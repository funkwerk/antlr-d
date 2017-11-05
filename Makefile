# Make for Antlr4DTarget

SHELL = bash
MKDIR_P = mkdir -p

BUILD_DIR = build
MODEL_DIR = model
MODELS := $(shell find $(MODEL_DIR) -name "*.zargo")
MODELS_R := $(patsubst %, $(BUILD_DIR)/%, $(patsubst %.zargo, %.receipt, $(MODELS)))

SRC_DIR = src/antlr/v4/runtime
SRC := $(shell find $(SRC_DIR) -name "*.d")
XPATH_LEXER_SRC := $(shell find $(SRC_DIR) -name "*.g4")

BUILD_DIR = build
ANTLR_DIR = antlr4
UNITTEST_DIR = unittest
UNITTEST_LIB = /usr/lib/libd-unit.a /usr/lib/libunit-threaded.a
UNITTESTS := $(shell find $(UNITTEST_DIR) -name "*.d")

#TEST_FLAGS = -debug=deserializer -cov -Isrc -g -gs
TEST_FLAGS = -cov -Isrc -g -gs
GENERATOR = $(BUILD_DIR)/generator/
GENERATOR_FLAGS = -b

RDMD = rdmd
DMD = dmd
GENERATOR = axmi2d
ANTLR = antlr4-antlr4-master-4.5.3
ANTLR_TAR = $(ANTLR).tgz
TARGET = $(BUILD_DIR)/$(ANTLR)/tool/resources/org/antlr/v4/tool/templates/codegen/D/

all : generate unittest
.PHONY : all

.PHONY : generate
generate : $(MODELS_R)

$(BUILD_DIR)/TestRunner : $(SRC) $(UNITTESTS)
	$(DMD) $(TEST_FLAGS) $(UNITTESTS) $(SRC) $(UNITTEST_LIB) -of$(BUILD_DIR)/TestRunner

.PHONY : unittest
unittest : $(BUILD_DIR)/TestRunner | $(BUILD_DIR)
	-$(BUILD_DIR)/TestRunner
	mv ./*.lst $(BUILD_DIR)

.PHONY : prepare_generator
prepare_generator : | $(BUILD_DIR)
	cd $(BUILD_DIR) && tar -xf ../$(ANTLR_DIR)/$(ANTLR_TAR)
	cp codegen/DTarget.java $(BUILD_DIR)/$(ANTLR)/tool/src/org/antlr/v4/codegen/target
	mkdir -p $(TARGET)
	cp -r codegen/templates/*.stg \
		$(TARGET)
	cd $(BUILD_DIR)/$(ANTLR) && mvn -DskipTests install

.PHONY : build_examples
build_examples : prepare_generator
	java -jar $(BUILD_DIR)/$(ANTLR)/tool/target/antlr4-4.5.3.jar \
		-Dlanguage=D -o $(BUILD_DIR) doc/examples/Expr.g4

.PHONY : build_xpathlexer
build_xpathlexer : prepare_generator
	java -jar $(BUILD_DIR)/$(ANTLR)/tool/target/antlr4-4.5.3.jar	\
		-Dlanguage=D -o $(BUILD_DIR) $(XPATH_LEXER_SRC)

.PHONY : clean
clean :
	rm -rf $(SRC_DIR)/**/**/*\.d_orig $(SRC_DIR)/**/**/*\.d~
	rm -rf $(SRC_DIR)/**/*\.d_orig $(SRC_DIR)/**/*\.d~
	rm -rf $(SRC_DIR)/*\.d_orig $(SRC_DIR)/*\.d~
	rm -rf model/DRuntime*.zargo~
	rm -rf ./*.lst

.PHONY : clobber
clobber :
	rm -rf $(BUILD_DIR)

$(BUILD_DIR):
	$(MKDIR_P) $(BUILD_DIR)/model

$(BUILD_DIR)/%.receipt : %.zargo $(BUILD_DIR)
	time $(GENERATOR) $(GENERATOR_FLAGS) -s src -m $<
	@touch $@
