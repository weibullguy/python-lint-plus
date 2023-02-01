#!/bin/sh -l

# Parameters
#
# $1 - python-root-list
# $2 - virtual-env
# $3 - use-black
# $4 - black-version
# $5 - use-yapf
# $6 - yapf-version
# $7 - use-isort
# $8 - isort-version
# $9 - use-docformatter
# $10 - docformatter-version
# ${11} - use-pycodestyle
# ${12} - pycodestyle-version
# ${13} - use-autopep8
# ${14} - autopep8-version
# ${15} - use-pydocstyle
# ${16} - pydocstyle-version
# ${17} - use-mypy
# ${18} - mypy-version
# ${19} - use-pylint
# ${20} - pylint-version
# ${21} - use-flake8
# ${22} - flake8-version
# ${23} - use mccabe
# ${24} - mccabe-version
# ${25} - use radon
# ${26} - radon-version
# ${27} - use-rstcheck
# ${28} - rstcheck-version
# ${29} - use-check-manifest
# ${30} - check-manifest-version
# ${31} - use-pyroma
# ${32} - pyroma-version
# ${33} - extra-black-options
# ${34} - extra-yapf-options
# ${35} - extra-isort-options
# ${36} - extra-docformatter-options
# ${37} - extra-pycodestyle-options
# ${38} - extra-autopep8-options
# ${39} - extra-pydocstyle-options
# ${40} - extra-mypy-options
# ${41} - extra-pylint-options
# ${42} - extra-flake8-options
# ${43} - extra-mccabe-options
# ${44} - extra-radon-options
# ${45} - extra-rstcheck-options
# ${46} - extra-manifest-options
# ${47} - extra-pyroma-options
# ${48} - python-version
# ${49) - architecture

# actions path has the copy of this actions repo
echo $RUNNER_OS
if [ $RUNNER_OS = 'Windows' ]
then
    MATCHERS=$GITHUB_ACTION_PATH\matchers\*.json
else
    MATCHERS=$GITHUB_ACTION_PATH/matchers/*.json
fi
echo $MATCHERS

for matcher in $MATCHERS
do
    echo Adding matcher $matcher
    echo "::add-matcher::${matcher}"
done

# Get the python version and architecture to use for this run.
python-version=${48}
architecture=${49}

# Create a virtual environment to run tools.
echo "Creating virtual environment: $2"
python3 -m venv $2
echo "Activating virtual environment: $2"
echo ""
. $2/bin/activate
pip install -U -q pip tomli

echo "Commencing tool run"
echo ""

# Run the autoformatters first.
if [ "$3" = true ] ; then

    echo Running: black --check ${33} $1

    pip install -q black$4

    black --check ${33} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Black ok"
        echo ""
    else
        echo "Black error"
        exit $exit_code
    fi

fi

if [ "$5" = true ]; then

    echo Running: yapf ${34} $1

    pip install -q yapf$6

    yapf ${34} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "yapf ok"
        echo ""
    else
        echo "yapf error"
        exit $exit_code
    fi

fi

if [ "$7" = true ] ; then

    echo Running: isort ${35} $1 -c --diff

    pip install -q isort$8

    isort ${35} $1 -c --diff
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "isort ok"
        echo ""
    else
        echo "isort error"
        exit $exit_code
    fi

fi

if [ "$9" = true ] ; then

    echo Running: docformatter -c --recursive ${36} $1

    pip install -q docformatter${10}

    docformatter -c --recursive ${36} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "docformatter ok"
        echo ""
    elif [ "$exit_code" = "3" ]; then
        echo "docformatter wants to format one or more files"
        echo ""
    else
        echo "docformatter error"
        echo $exit_code
    fi
fi

# Then check the autoformatter results.
if [ "${11}" = true ] ; then

    echo Running: pycodestyle ${37} $1

    pip install -q pycodestyle${12}

    pycodestyle ${37} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "pycodestyle ok"
        echo ""
    else
        echo "pycodestyle error"
        exit $exit_code
    fi

fi

if [ "${13}" = true ] ; then

    echo Running: autopep8 ${38} $1

    pip install -q autopep8${14}

    autopep8 ${38} $1
    exit_code=$?

    if [ "$exit_code" = 0 ]; then
        echo "autopep8 ok"
        echo ""
    else
        echo "autopep8 error"
        echo $exit_code
    fi

fi

if [ "${15}" = true ] ; then

    echo Running: pydocstyle ${39} $1

    pip install -q pydocstyle${16}

    pydocstyle ${39} $1
    exit_code=$?

    if [ "$exit_code" = 0 ]; then
        echo "pydocstyle ok"
        echo ""
    else
        echo "pydocstyle error"
        exit $exit_code
    fi
fi

# Next type check everything.
if [ "${17}" = true ] ; then

    echo Running: mypy ${40} $1

    pip install -q mypy${18}

    mypy ${40} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "mypy ok"
        echo ""
    else
        echo "mypy error"
        exit $exit_code
    fi

fi

# Finally, lint the code.
if [ "${19}" = true ] ; then

    echo Running: pylint ${41} $1

    pip install -q pylint${20}

    pylint ${41} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Pylint ok"
        echo ""
    else
        echo "Pylint error"
        exit $exit_code
    fi

fi

if [ "${21}" = true ] ; then

    echo Running: flake8 ${42} $1

    pip install -q flake8${22}

    flake8 ${42} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Flake8 ok"
        echo ""
    else
        echo "Flake8 error"
        exit $exit_code
    fi

fi

# Check code maintainability
if [ "${23}" = true ]; then

    echo Running: mccabe ${43} $1

    pip install -q mccabe${24}

    python -m mccabe ${43} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "mccabe complexity ok"
        echo ""
    else
        echo "mccabe error"
        exit $exit_code
    fi
fi

if [ "${25}" = true ]; then

    echo Running: radon ${44} $1

    pip install -q radon${26}

    radon ${44} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "radon ok"
        echo ""
    else
        echo "radon error"
        exit $exit_code
    fi
fi

# Check rst files
if [ "${27}" = true ]; then

    echo Running: rstcheck ${45} $1

    pip install -q rstcheck${28}

    rstcheck ${45} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Rstcheck ok"
        echo ""
    else
        echo "Rstcheck error"
        exit $exit_code
    fi
fi

# Check packaging
if [ "${29}" = true ]; then

    echo Running: check-manifest ${46} .

    pip install -q check-manifest${30}

    check-manifest ${46} .
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Check-manifest ok"
        echo ""
    else
        echo "Check-manifest error"
        exit $exit_code
    fi
fi

if [ "${31}" = true ]; then

    echo Running: pyroma ${47} .

    pip install -q pyroma${32}

    pyroma ${47} .
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Pyroma ok"
        echo ""
    else
        echo  "Pyroma error"
        exit $exit_code
    fi
fi

