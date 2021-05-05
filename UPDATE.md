# Updating the D Target to a new ANTLR Version

Using the example of the update from 4.8 to 4.9.2.

## Update Source Code

Download the source code `antlr4-4.9.2.tar.gz` from https://github.com/antlr/antlr4/releases.

Copy `antlr4-4.9.2.tar.gz` to `antlr4`.
Remove the previous version.

## Update Version Number

Replace "4.8" with "4.9.2" in:

    Makefile
    build.ps1
    README.md

## Apply Changes

Identify the changes in a checkout of https://github.com/antlr

    git diff 4.8 4.9.2 -- tool/resources/org/antlr/v4/tool/templates/codegen/Java
    git diff 4.8 4.9.2 -- runtime/Java/src/org/antlr/v4/runtime
    git diff 4.8 4.9.2 -- runtime-testsuite/test/org/antlr/v4/test/runtime/java

Apply the corresponding changes in:

    codegen/templates/D.stg
    source/antlr/v4/runtime
    test

(Most of the changes are in `test`.
The test is apparently a ported test for the C++ target.)

## Regenerate checked in Generated Code

In `unittest` use the new `antlr4` to regenerate the D source code.

## Run Tests

While in principle any D compiler can be used, testing the runtime requires LDC.

    make test
