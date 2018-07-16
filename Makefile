# Make for antlr-d

EXPORT = /usr/local

UNAME_M := $(shell uname -m)
ifeq ($(UNAME_M),x86_64)
    MVN = JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk MAVEN_OPTS="-Xmx1G" mvn
    RDMD = rdmd
    DMD = dmd -w
    EXPORT_INCLUDE = $(EXPORT)/include/dmd
endif
ifeq ($(UNAME_M),i686)
    MVN = JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk MAVEN_OPTS="-Xmx1G" mvn
    RDMD = rdmd
    DMD = dmd -w
    EXPORT_INCLUDE = $(EXPORT)/include/dmd
endif
# Rasperry PI Desktop (Ubuntu MATE)
ifeq ($(UNAME_M),armv7l)
    MVN = JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-armhf MAVEN_OPTS="-Xmx1G" mvn
    DMD = ldmd2 -w -link-defaultlib-shared
    EXPORT_INCLUDE = $(EXPORT)/import
endif

SHELL = bash
MKDIR_P = mkdir -p

BUILD_DIR = build
EXPORT_LIB = $(EXPORT)/lib

MODEL_DIR = model
MODELS := $(shell find $(MODEL_DIR) -name "*.zargo")
MODELS_R := $(patsubst %, $(BUILD_DIR)/%, $(patsubst %.zargo, %.receipt, $(MODELS)))

SRC_DIR = source
SRC_DIR_DOT = $(subst /,.,$(SRC_DIR))
SRC_ROOT = $(SRC_DIR)/antlr/v4/runtime
SRC := $(shell find $(SRC_ROOT) -name "*.d")
XPATH_LEXER_SRC := $(shell find $(SRC_ROOT) -name "*.g4")

BUILD_DIR = build
ANTLR_DIR = antlr4
UNITTEST_DIR = unittest
UNITTEST_LIB = -L-lunit-threaded -L-ldshould

SOURCE_FILES := $(shell find $(SRC_ROOT) -name "*.d")
MODULE_FILES := $(shell find $(UNITTEST_DIR) -name "*.d") $(SOURCE_FILES)

EXAMPLE_MODULE_FILES := $(shell find $(SRC_ROOT) -name "*.d")
EXAMPLE_TIMETABLE_DIR = doc/examples/time_table
EXAMPLE_TIMETABLE_FILES := $(shell find $(EXAMPLE_TIMETABLE_DIR) -name "*.d")

EXAMPLE_XML_DIR = doc/examples/xml
EXAMPLE_XML_FILES := $(shell find $(EXAMPLE_XML_DIR) -name "*.d")

UNITTEST_FILES := $(filter %.d, $(filter-out Makefile%,\
            $(filter-out build/%, $(filter-out .git/%, $(shell grep -l -r unittest)))))

UNITTEST_MODULES := $(subst simple.,,$(subst unittest.,,$(subst $(SRC_DIR_DOT).,,$(subst /,.,\
		$(patsubst %.d,%$(NEWLINE),\
		$(filter-out %/TestRunner.d, $(UNITTEST_FILES)))))))

TEST_FLAGS = -cov -Isource -J$(BUILD_DIR) -unittest
GENERATOR = $(BUILD_DIR)/generator/
GENERATOR_FLAGS = -b

GENERATOR = axmi2d
ANTLR = antlr4-4.7.1
ANTLR_TAR = $(ANTLR).tar.gz
TARGET = $(BUILD_DIR)/$(ANTLR)/tool/resources/org/antlr/v4/tool/templates/codegen/D/
TEST_TEMPLATE_DIR = $(BUILD_DIR)/$(ANTLR)/runtime-testsuite/resources/org/antlr/v4/test/runtime/templates

# required to detect model changes
_dummy := $(shell mkdir -p $(BUILD_DIR)/$(MODEL_DIR))

.PHONY : all
all : generate unittest

.PHONY: generate
generate: $(MODELS_R)

$(BUILD_DIR)/TimeTable : $(EXAMPLE_TIMETABLE_FILES) $(EXAMPLE_MODULE_FILES)
	@echo $(EXAMPLE_TIMETABLE_FILES)
	$(DMD) -cov -g $(EXAMPLE_TIMETABLE_FILES) $(EXAMPLE_MODULE_FILES) -of$(BUILD_DIR)/TimeTable

$(BUILD_DIR)/XMI : $(EXAMPLE_XML_FILES) $(EXAMPLE_MODULE_FILES)
	@echo $(EXAMPLE_XML_FILES)
	$(DMD) -cov $(EXAMPLE_XML_FILES) $(EXAMPLE_MODULE_FILES) -of$(BUILD_DIR)/XMI

$(BUILD_DIR)/TestRunner : $(MODULE_FILES)
	$(file > $(BUILD_DIR)/modules, $(UNITTEST_MODULES))
	$(DMD) $(TEST_FLAGS) $(MODULE_FILES) $(UNITTEST_LIB) -of$(BUILD_DIR)/TestRunner

.PHONY : unittest
unittest : $(BUILD_DIR)/TestRunner | $(BUILD_DIR)
	-$(BUILD_DIR)/TestRunner
	@mv ./*.lst $(BUILD_DIR)

.PHONY : prepare_generator
prepare_generator : | $(BUILD_DIR)
	cd $(BUILD_DIR) && tar -xf ../$(ANTLR_DIR)/$(ANTLR_TAR)
	cp codegen/DTarget.java $(BUILD_DIR)/$(ANTLR)/tool/src/org/antlr/v4/codegen/target
	mkdir -p $(TARGET)
	cp -r codegen/templates/*.stg \
		$(TARGET)
	mkdir -p $(TEST_TEMPLATE_DIR)
	cp test/D.test.stg \
		$(TEST_TEMPLATE_DIR)
	cd $(BUILD_DIR)/$(ANTLR) && $(MVN) -DskipTests install

.PHONY : build_examples
build_examples : prepare_generator
	java -jar $(BUILD_DIR)/$(ANTLR)/tool/target/antlr4-4.7.1-complete.jar \
		-Dlanguage=D -o $(BUILD_DIR) doc/examples/Expr.g4
	java -jar $(BUILD_DIR)/$(ANTLR)/tool/target/antlr4-4.7.1-complete.jar \
		-Dlanguage=D -o $(BUILD_DIR) doc/examples/ruleTranslator/RuleTranslator.g4

.PHONY: build_xpathlexer
build_xpathlexer : prepare_generator
	java -jar $(BUILD_DIR)/$(ANTLR)/tool/target/antlr4-4.7.1-complete.jar	\
		-Dlanguage=D -o $(BUILD_DIR) $(XPATH_LEXER_SRC)

.PHONY: build_library
build_library: $(BUILD_DIR)/libantlr-d.so.4.7

$(BUILD_DIR)/libantlr-d.so.4.7: $(SOURCE_FILES)
	$(DMD) -shared -fPIC $(SOURCE_FILES) -od=$(BUILD_DIR) -of=$(BUILD_DIR)/libantlr-d.so.4.7

.PHONY: install_library
install_library: $(BUILD_DIR)/libantlr-d.so.4.7
	cp $(BUILD_DIR)/libantlr-d.so.4.7 $(EXPORT_LIB)
	rm -rf $(EXPORT_LIB)/libantlr-d.so.4 $(EXPORT_LIB)/libantlr-d.so
	ln -s $(EXPORT_LIB)/libantlr-d.so.4.7 $(EXPORT_LIB)/libantlr-d.so.4
	ln -s $(EXPORT_LIB)/libantlr-d.so.4 $(EXPORT_LIB)/libantlr-d.so
	ldconfig
	cp -R source/antlr $(EXPORT_INCLUDE)

.PHONY : clean
clean :
	rm -rf $(SRC_ROOT)/**/**/*\.d_orig $(SRC_ROOT)/**/**/*\.d~
	rm -rf $(SRC_ROOT)/**/*\.d_orig $(SRC_ROOT)/**/*\.d~
	rm -rf $(SRC_ROOT)/*\.d_orig $(SRC_ROOT)/*\.d~
	rm -rf model/DRuntime*.zargo~
	rm -rf $(BUILD_DIR)/*.lst

.PHONY : clobber
clobber :
	rm -rf $(BUILD_DIR)

$(BUILD_DIR):
	$(MKDIR_P) $(BUILD_DIR)/model

$(BUILD_DIR)/%.receipt : %.zargo
	time $(GENERATOR) $(GENERATOR_FLAGS) -s $(SRC_DIR) -m $<
	@touch $@
