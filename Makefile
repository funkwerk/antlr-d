# Make for Antlr4DTarget

MODEL = DRuntime

SRC_DIR = src/antlr/v4/runtime
SRC_ATN = $(SRC_DIR)/atn
SRC_TREE = $(SRC_DIR)/tree
SRC =	$(SRC_DIR)/RuntimeMetaData.d\
	$(SRC_DIR)/Parser.d\
	$(SRC_ATN)/ATN.d\
	$(SRC_ATN)/ATNState.d\
	$(SRC_ATN)/ATNConfig.d\
	$(SRC_ATN)/PredictionContext.d\
	$(SRC_ATN)/ArrayPredictionContext.d\
	$(SRC_ATN)/EpsilonTransition.d\
	$(SRC_DIR)/misc/Interval.d\
	$(SRC_DIR)/misc/IntervalSet.d\
	$(SRC_DIR)/misc/AbstractEqualityComparator.d\
	$(SRC_DIR)/misc/EqualityComparator.d\
	$(SRC_DIR)/misc/MurmurHash.d\
	$(SRC_DIR)/misc/DoubleKeyMap\
	$(SRC_TREE)/ParseTreeListener\
	$(SRC_DIR)/TrimToSizeListener

BUILD_DIR = build
MODEL_DIR = model
ANTLR_DIR = antlr4

TEST_FLAGS = --main -unittest -Isrc
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
generate :
	$(GENERATOR) $(GENERATOR_FLAGS) -s src -m $(MODEL_DIR)/$(MODEL).zargo


.PHONY : unittest
unittest :
	$(foreach src, $(SRC), $(RDMD) $(TEST_FLAGS) $(src);)

.PHONY : prepare_generator
prepare_generator :
	mkdir -p $(BUILD_DIR)
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

.PHONY : clean
clean :
	rm -rf $(SRC_DIR)/**/*\.d_orig $(SRC_DIR)/**/*\.d~
	rm -rf $(SRC_DIR)/*\.d_orig $(SRC_DIR)/*\.d~
	rm -rf model/DRuntime.zargo~

.PHONY : clobber
clobber :
	rm -rf $(BUILD_DIR)
