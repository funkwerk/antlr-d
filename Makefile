# Make for Antlr4DTarget

MODEL = DRuntime

SRC_DIR = src/antlr/v4/runtime
SRC := $(shell find $(SRC_DIR) -name "*.d")

BUILDDIR = build
MODEL_DIR = model
ANTLR_DIR = antlr4
UNITTEST_DIR = unittest
UNITTEST_LIB = /usr/lib/d-unit.a
UNITTESTS := $(shell find $(UNITTEST_DIR) -name "*.d")

TEST_FLAGS = -cov -Isrc
GENERATOR = $(BUILD_DIR)/generator/
GENERATOR_FLAGS = -b

RDMD = rdmd
DMD = dmd
GENERATOR = axmi2d
ANTLR = antlr4-antlr4-master-4.5.3
ANTLR_TAR = $(ANTLR).tgz
TARGET = $(BUILDDIR)/$(ANTLR)/tool/resources/org/antlr/v4/tool/templates/codegen/D/

all : generate unittest
.PHONY : all


.PHONY : generate
generate :
	$(GENERATOR) $(GENERATOR_FLAGS) -s src -m $(MODEL_DIR)/$(MODEL).zargo

$(BUILDDIR)/TestRunner : $(UNITTESTS)
	$(DMD) $(TEST_FLAGS) $(UNITTESTS) $(SRC) $(UNITTEST_LIB) -of$(BUILDDIR)/TestRunner

.PHONY : unittest
unittest : $(BUILDDIR)/TestRunner | $(BUILDDIR)
	-$(BUILDDIR)/TestRunner
	mv ./*.lst $(BUILDDIR)

.PHONY : prepare_generator
prepare_generator : | $(BUILDDIR)
	cd $(BUILDDIR) && tar -xf ../$(ANTLR_DIR)/$(ANTLR_TAR)
	cp codegen/DTarget.java $(BUILDDIR)/$(ANTLR)/tool/src/org/antlr/v4/codegen/target
	mkdir -p $(TARGET)
	cp -r codegen/templates/*.stg \
		$(TARGET)
	cd $(BUILDDIR)/$(ANTLR) && mvn -DskipTests install

.PHONY : build_examples
build_examples : prepare_generator
	java -jar $(BUILDDIR)/$(ANTLR)/tool/target/antlr4-4.5.3.jar \
		-Dlanguage=D -o $(BUILDDIR) doc/examples/Expr.g4

.PHONY : clean
clean :
	rm -rf $(SRC_DIR)/**/*\.d_orig $(SRC_DIR)/**/*\.d~
	rm -rf $(SRC_DIR)/*\.d_orig $(SRC_DIR)/*\.d~
	rm -rf model/DRuntime.zargo~
	rm -rf ./*.lst

.PHONY : clobber
clobber :
	rm -rf $(BUILDDIR)

$(BUILDDIR):
	mkdir $(BUILDDIR)
