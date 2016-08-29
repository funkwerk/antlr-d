# Make for Antlr4DTarget

MODEL = DRuntime

SRC_DIR = src/antlr/v4/runtime
SRC_ATN = $(SRC_DIR)/atn
SRC =	$(SRC_ATN)/ATN.d\
	$(SRC_ATN)/ATNState.d\
	$(SRC_ATN)/ATNConfig.d\
	$(SRC_ATN)/PredictionContext.d\
	$(SRC_ATN)/ArrayPredictionContext.d\
	$(SRC_DIR)/misc/Interval.d\
	$(SRC_DIR)/misc/AbstractEqualityComparator.d\
	$(SRC_DIR)/misc/EqualityComparator.d\
	$(SRC_DIR)/misc/MurmurHash.d\
	$(SRC_DIR)/misc/DoubleKeyMap

BUILD_DIR = build
MODEL_DIR = model

TEST_FLAGS = --main -unittest -Isrc
GENERATOR_FLAGS = -b

RDMD = rdmd
DMD = dmd
GENERATOR = axmi2d

all : generate unittest
.PHONY : all


.PHONY :	generate
generate :
	$(GENERATOR) $(GENERATOR_FLAGS) -s src -m $(MODEL_DIR)/$(MODEL).zargo


.PHONY : unittest
unittest :
	$(foreach src, $(SRC), $(RDMD) $(TEST_FLAGS) $(src);)


.PHONY : clean
clean :
	rm -rf $(BUILD_DIR)
	rm -rf $(SRC_DIR)/**/*\.d_orig $(SRC_DIR)/**/*\.d~
	rm -rf $(SRC_DIR)/*\.d_orig $(SRC_DIR)/*\.d~
	rm -rf model/DRuntime.zargo~
