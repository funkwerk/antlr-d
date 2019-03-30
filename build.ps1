param (
    [string]$arg
)

function call {
    param (
        [string] $command,
        [switch] $verbose
    )

    Write-Host $command
    if ($verbose) {
        Invoke-Expression "$command"
    }
    else {
        Invoke-Expression "$command > `$null"
    }
}

function program {
    foreach ($cmd in $args) {
        $cmd = Get-Command $cmd -ErrorAction SilentlyContinue
        if ($null -ne $cmd) {
            return '& "' + $cmd.Source + '"'
        }
    }
}

function require {
    foreach ($cmd in $args) {
        if ($null -eq $cmd) {
            Write-Error "Missing required program"
            exit
        }
    }
}

$JAVA = program "java"
$MVN = program "mvn"
$DMD = program "ldmd2"
$7z = program  "7z" "C:\Program Files\7-Zip\7z.exe"

$BUILD_DIR = "build"

$ANTLR_DIR = "antlr4"
$ANTLR = "antlr4-4.7.2"
$TARGET = "$BUILD_DIR/$ANTLR/tool/resources/org/antlr/v4/tool/templates/codegen/D/"
$TEST_TEMPLATE_DIR = "$BUILD_DIR/$ANTLR/runtime-testsuite/resources/org/antlr/v4/test/runtime/templates"

$SOURCE_FILES = Get-ChildItem -Path source -Filter *.d -Recurse | ForEach-Object {
    Resolve-Path -Relative $_.FullName
}


$rules = @{
    prepare_generator = {
        require $7z $JAVA $MVN

        if (!(Test-Path "build")) {
            call "mkdir build"
        }

        call "cd build"
        call "$7z x ../$ANTLR_DIR/$ANTLR.tar.gz -aoa"
        call "$7z x $ANTLR.tar -aoa -ttar"
        call "cd .."

        call "cp codegen/DTarget.java $BUILD_DIR/$ANTLR/tool/src/org/antlr/v4/codegen/target"
        call "mkdir -f -p $TEST_TEMPLATE_DIR"
        call "cp -r -fo -co codegen/templates/ $TARGET"

        call "cd $BUILD_DIR/$ANTLR"
        call "`$env:MAVEN_OPTS = '-Xmx1G'"
        call "$MVN -DskipTests install" -verbose 
        call "cd ../.."
    }

    build_examples    = {
        require $JAVA

        if (!(Test-Path "$BUILD_DIR/$ANTLR/tool/target/antlr4-4.7.2-complete.jar")) {
            Invoke-Command $rules.prepare_generator
        }

        call "$JAVA -jar $BUILD_DIR/$ANTLR/tool/target/antlr4-4.7.2-complete.jar -Dlanguage=D -atn -o $BUILD_DIR doc/examples/Expr.g4"
        call "$JAVA -jar $BUILD_DIR/$ANTLR/tool/target/antlr4-4.7.2-complete.jar -Dlanguage=D -atn -o $BUILD_DIR doc/examples/ruleTranslator/RuleTranslator.g4"
    }

    docs              = {
        require $DMD

        if (!(Test-Path "build")) {
            call "mkdir build"
        }
        call "$DMD -op -Dd$BUILD_DIR/docs -o- $SOURCE_FILES"
    }

    clobber           = {
        if (Test-Path "build") {
            call "rm -r -fo build"
        }
    }

    ""                = {
        Write-Host "No command specified"
        Write-Host "Available rules:"
        foreach ($r in $rules.Keys) {
            if ($r -ne "") {
                Write-Host "    " $r
            }
        }
    }
}

Invoke-Command $rules[$arg]