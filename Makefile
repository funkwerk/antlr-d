# Make for antlr-d

EXPORT = /usr/local
DMD_EXE = ldc2

UNAME_M := $(shell uname -m)

ifeq ($(UNAME_M),x86_64)
    RDMD = rdmd
    EXPORT_INCLUDE = $(EXPORT)/include/d
    EXECUTABLE = x86-64
    TESTRUNNER_OPT =
endif
ifeq ($(UNAME_M),i686)
    RDMD = rdmd
    EXPORT_INCLUDE = $(EXPORT)/include/d
    EXECUTABLE = 80386
    TESTRUNNER_OPT = -s
endif
# Rasperry PI Desktop (Ubuntu MATE)
ifeq ($(UNAME_M),armv7l)
    EXPORT_INCLUDE = $(EXPORT)/import/d
    EXECUTABLE = ARM
    TESTRUNNER_OPT =
endif

DMD = $(DMD_EXE) -link-defaultlib-shared -w -O
MVN = MAVEN_OPTS="-Xmx1G" mvn
SHELL = bash
MKDIR_P = mkdir -p

SRC_DIR = source
BUILD_DIR = build
EXPORT_LIB = $(EXPORT)/lib

MODEL_DIR = model
MODELS := $(shell find $(MODEL_DIR) -name "*.zargo")
MODELS_R := $(patsubst %, $(BUILD_DIR)/%, $(patsubst %.zargo, %.receipt, $(MODELS)))

SRC_DIR_DOT = $(subst /,.,$(SRC_DIR))
SRC_ROOT = $(SRC_DIR)/antlr/v4/runtime
SRC := $(shell find $(SRC_ROOT) -name "*.d")
XPATH_LEXER_SRC := $(shell find $(SRC_ROOT) -name "*.g4")

ANTLR_DIR = antlr4
UNITTEST_DIR = unittest
UNITTEST_LIB = -L-lunit-threaded -L-ldshould -L-lprettyprint

SOURCE_FILES := $(shell find $(SRC_ROOT) -name "*.d")
MODULE_FILES := $(shell find $(UNITTEST_DIR) -name "*.d") $(SOURCE_FILES)

EXAMPLE_MODULE_FILES := $(shell find $(SRC_ROOT) -name "*.d")
EXAMPLE_TIMETABLE_DIR = doc/examples/time_table
EXAMPLE_TIMETABLE_FILES := $(shell find $(EXAMPLE_TIMETABLE_DIR) -name "*.d")

EXAMPLE_XML_DIR = doc/examples/xml
EXAMPLE_XML_FILES := $(shell find $(EXAMPLE_XML_DIR) -name "*.d")

UNITTEST_FILES := $(shell grep -l -r unittest $(SRC_DIR) $(UNITTEST_DIR)/**/*.d)

UNITTEST_MODULES := $(subst unicode.,,\
		$(subst separated_grammar.,,\
		$(subst complex.,,\
		$(subst simple.,,$(subst unittest.,,$(subst $(SRC_DIR_DOT).,,$(subst /,.,\
		$(patsubst %.d,%$(NEWLINE),$(UNITTEST_FILES)))))))))

TEST_FLAGS = -cov -Isource -J$(BUILD_DIR) -unittest
GENERATOR = $(BUILD_DIR)/generator/
GENERATOR_FLAGS = -b

GENERATOR = axmi2d
ANTLR = antlr4-4.7.2
ANTLR_TAR = $(ANTLR).tar.gz
TARGET = $(BUILD_DIR)/$(ANTLR)/tool/resources/org/antlr/v4/tool/templates/codegen/D/

TEST_TEMPLATE_DIR = $(BUILD_DIR)/$(ANTLR)/runtime-testsuite/resources/org/antlr/v4/test/runtime/templates
TEST_DIR = $(BUILD_DIR)/$(ANTLR)/runtime-testsuite/test/org/antlr/v4/test/runtime
TEST_TARGET_DIR = $(TEST_DIR)/d
TEST_D_DIR = $(BUILD_DIR)/$(ANTLR)/runtime/D

# required to detect model changes
_dummy := $(shell mkdir -p $(BUILD_DIR)/$(MODEL_DIR))

# required to detect system changes
ifneq ($(shell file -e elf $(BUILD_DIR)/TestRunner | grep -o $(EXECUTABLE)),$(EXECUTABLE))
   _dummy := $(shell rm -rf $(BUILD_DIR)/TestRunner)
endif

.PHONY : all
all : generate unittest

.PHONY: generate
generate: $(MODELS_R)

$(BUILD_DIR)/TimeTable : $(EXAMPLE_TIMETABLE_FILES) $(EXAMPLE_MODULE_FILES)
	@echo $(EXAMPLE_TIMETABLE_FILES)
	$(DMD) -cov $(EXAMPLE_TIMETABLE_FILES) $(EXAMPLE_MODULE_FILES) -of$(BUILD_DIR)/TimeTable

$(BUILD_DIR)/XMI : $(EXAMPLE_XML_FILES) $(EXAMPLE_MODULE_FILES)
	@echo $(EXAMPLE_XML_FILES)
	$(DMD) -cov $(EXAMPLE_XML_FILES) $(EXAMPLE_MODULE_FILES) -of$(BUILD_DIR)/XMI

$(BUILD_DIR)/TestRunner : $(MODULE_FILES)
	$(file > $(BUILD_DIR)/modules, $(UNITTEST_MODULES))
	$(DMD) $(TEST_FLAGS) $(MODULE_FILES) $(UNITTEST_LIB) -of$(BUILD_DIR)/TestRunner

.PHONY : unittest
unittest : $(BUILD_DIR)/TestRunner | $(BUILD_DIR)
	-$(BUILD_DIR)/TestRunner $(TESTRUNNER_OPT)
	@mv ./*.lst $(BUILD_DIR)

.PHONY : prepare_generator
prepare_generator : | $(BUILD_DIR)
	cd $(BUILD_DIR) && tar -xf ../$(ANTLR_DIR)/$(ANTLR_TAR)
	cp codegen/DTarget.java $(BUILD_DIR)/$(ANTLR)/tool/src/org/antlr/v4/codegen/target
	mkdir -p $(TEST_D_DIR)
	cp -r source $(TEST_D_DIR)/
	cp Makefile $(TEST_D_DIR)/
	cp test-dub.json $(TEST_D_DIR)/dub.json
	mkdir -p $(TARGET)
	cp -r codegen/templates/*.stg \
		$(TARGET)
	mkdir -p $(TEST_TEMPLATE_DIR)
	cp test/D.test.stg \
		$(TEST_TEMPLATE_DIR)
	cp test/BaseRuntimeTest.java \
		$(TEST_DIR)
	mkdir -p $(TEST_TARGET_DIR)
	cp test/d/*.java \
		$(TEST_TARGET_DIR)
	cd $(BUILD_DIR)/$(ANTLR) && $(MVN) -DskipTests install

.PHONY : build_examples
build_examples : prepare_generator
	java -jar $(BUILD_DIR)/$(ANTLR)/tool/target/$(ANTLR)-complete.jar \
		-Dlanguage=D -visitor -o $(BUILD_DIR) doc/examples/simple_expression/Expr.g4
	cp $(BUILD_DIR)/doc/examples/simple_expression/*.d doc/examples/simple_expression
	java -jar $(BUILD_DIR)/$(ANTLR)/tool/target/$(ANTLR)-complete.jar \
		-Dlanguage=D -atn -o $(BUILD_DIR)\
		doc/examples/ruleTranslator/RuleLexer.g4
	cp $(BUILD_DIR)/doc/examples/ruleTranslator/RuleLexer.tokens \
		doc/examples/ruleTranslator/
	java -jar $(BUILD_DIR)/$(ANTLR)/tool/target/$(ANTLR)-complete.jar \
		-Dlanguage=D -o $(BUILD_DIR)\
		doc/examples/ruleTranslator/RuleParser.g4
	cp $(BUILD_DIR)/doc/examples/ruleTranslator/Rule*.d \
		doc/examples/ruleTranslator/
	cp $(BUILD_DIR)/doc/examples/ruleTranslator/Rule*.tokens \
		doc/examples/ruleTranslator/

.PHONY: build_xpathlexer
build_xpathlexer : prepare_generator
	java -jar $(BUILD_DIR)/$(ANTLR)/tool/target/antlr4-4.7.2-complete.jar \
		-Dlanguage=D -o $(BUILD_DIR) $(XPATH_LEXER_SRC)

.PHONY: build_library
build_library: $(BUILD_DIR)/libantlr-d.so.4.7

$(BUILD_DIR)/libantlr-d.so.4.7: $(SOURCE_FILES)
	$(DMD) -shared -relocation-model=pic -op -Hd=$(BUILD_DIR)/di $(SOURCE_FILES) \
		-od=$(BUILD_DIR) -of=$(BUILD_DIR)/libantlr-d.so.4.7


# some D source files must replace di files
EXPORT_D_FILES_NAMES = misc/MurmurHash.di \
                 atn/AbstractConfigHashSet.di \
                 atn/PredictionContext.di
EXPORT_D_FILES := $(patsubst %.di, $(SRC_DIR)/antlr/v4/runtime/%.d,\
                  $(EXPORT_D_FILES_NAMES))
NO_EXPORT_DI_FILES := $(patsubst %.di, \
                  $(EXPORT_INCLUDE)/antlr/v4/runtime/%.di,\
                  $(EXPORT_D_FILES_NAMES))

.PHONY: install
install: $(BUILD_DIR)/libantlr-d.so.4.7
	cp $(BUILD_DIR)/libantlr-d.so.4.7 $(EXPORT_LIB)
	rm -rf $(EXPORT_LIB)/libantlr-d.so.4 $(EXPORT_LIB)/libantlr-d.so
	ln -s $(EXPORT_LIB)/libantlr-d.so.4.7 $(EXPORT_LIB)/libantlr-d.so.4
	ln -s $(EXPORT_LIB)/libantlr-d.so.4 $(EXPORT_LIB)/libantlr-d.so
	ldconfig
	@rm -rf $(EXPORT_INCLUDE)/antlr/*
	$(MKDIR_P) $(EXPORT_INCLUDE)/antlr

	cp -r $(SRC_DIR)/antlr $(EXPORT_INCLUDE)

.PHONY: docs
 docs:
	$(DMD) -op -Dd${BUILD_DIR}/docs -o- $(SOURCE_FILES)

.PHONY : clean
clean :
	rm -rf $(SRC_ROOT)/**/**/*\.d_orig $(SRC_ROOT)/**/**/*\.d~
	rm -rf $(SRC_ROOT)/**/*\.d_orig $(SRC_ROOT)/**/*\.d~
	rm -rf $(SRC_ROOT)/*\.d_orig $(SRC_ROOT)/*\.d~
	rm -rf model/DRuntime*.zargo~
	rm -rf $(BUILD_DIR)/*.lst
	rm -rf $(BUILD_DIR)/TestRunner

.PHONY : clobber
clobber :
	rm -rf $(BUILD_DIR)

$(BUILD_DIR):
	$(MKDIR_P) $(BUILD_DIR)/model

$(BUILD_DIR)/%.receipt : %.zargo
	time $(GENERATOR) $(GENERATOR_FLAGS) -s $(SRC_DIR) -m $<
	@touch $@
