# Make for Antlr4DTarget

MODEL = DRuntime

SRC_DIR = src/antlr/v4/runtime
SRC =	$(SRC_DIR)/misc/Interval.d\
	$(SRC_DIR)/misc/Array2DHashSet.d

BUILD_DIR = build
MODEL_DIR = model

TEST_FLAGS = --main -unittest
GENERATOR_FLAGS = -b

RDMD = rdmd
DMD = dmd
GENERATOR = axmi2d


.PHONY:	generate
generate:
	$(GENERATOR) $(GENERATOR_FLAGS) -s src -m $(MODEL_DIR)/$(MODEL).zargo


.PHONY: unittest
unittest:
	$(foreach src, $(SRC), $(RDMD) $(TEST_FLAGS) $(src);)


.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
