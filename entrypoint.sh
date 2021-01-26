#!/bin/sh -l

# Parameters
#
# $1 - python-root-list
# $2 - use-black
# $3 - use-yapf
# $4 - use-isort
# $5 - use-docformatter
# $6 - use-pycodestyle
# $7 - use-pydocstyle
# $8 - use-mypy
# $9 - use-pylint
# $10 - use-flake8
# ${11} - use mccabe
# ${12} - use radon
# ${13} - use-rstcheck
# ${14} - use-check-manifest
# ${15} - use-pyroma
# ${16} - extra-black-options
# ${17} - extra-yapf-options
# ${18} - extra-isort-options
# ${19} - extra-docformatter-options
# ${20} - extra-pycodestyle-options
# ${21} - extra-pydocstyle-options
# ${22} - extra-mypy-options
# ${23} - extra-pylint-options
# ${24} - extra-flake8-options
# ${25} - extra-mccabe-options
# ${26} - extra-radon-options
# ${27} - extra-rstcheck-options
# ${28} - extra-manifest-options
# ${29} - extra-pyroma-options

# Run the autoformatters first.
if [ "$2" = true ] ; then

    echo Running: black --check ${16} $1

    black --check ${16} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Black ok"
    else
        echo "Black error"
        exit $exit_code
    fi

fi

if [ "$3" = true ]; then

    echo Running: yapf ${17} $1

    yapf ${17} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "yapf ok"
    else
        echo "yapf error"
        exit $exit_code
    fi

fi

if [ "$4" = true ] ; then

    echo Running: isort ${18} $1 -c --diff

    isort ${18} $1 -c --diff
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "isort ok"
    else
        echo "isort error"
        exit $exit_code
    fi

fi

if [ "$5" = true ] ; then

    echo Running: docformatter -c --recursive ${19} $1

    docformatter -c --recursive ${19} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "docformatter ok"
    elif [ "$exit_code" = "3" ]; then
        echo "docformatter wants to format one or more files"
    else
        echo "docformatter error"
        echo $exit_code
    fi
fi

# Then check the autoformatter results.
if [ "$6" = true ] ; then

    echo Running: pycodestyle ${20} $1

    pycodestyle ${20} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "pycodestyle ok"
    else
        echo "pycodestyle error"
        exit $exit_code
    fi

fi

if [ "$7" = true ] ; then

    echo Running: pydocstyle ${21} $1

    pydocstyle ${21} $1
    exit_code=$?

    if [ "$exit_code" = 0 ]; then
        echo "pydocstyle ok"
    else
        echo "pydocstyle error"
        echo $exit_code
    fi
fi

# Next type check everything.
if [ "$8" = true ] ; then

    echo Running: mypy ${22} $1

    mypy ${22} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "mypy ok"
    else
        echo "mypy error"
        exit $exit_code
    fi

fi

# Finally, lint the code.
if [ "$9" = true ] ; then

    echo Running: pylint ${23} $1

    pylint ${23} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Pylint ok"
    else
        echo "Pylint error"
        exit $exit_code
    fi

fi

if [ "${10}" = true ] ; then

    echo Running: flake8 ${24} $1

    flake8 ${24} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Flake8 ok"
    else
        echo "Flake8 error"
        exit $exit_code
    fi

fi

# Check code maintainability
if [ "${11}" = true ]; then

    echo Running: mccabe ${25} $1

    python -m mccabe ${25} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "mccabe complexity ok"
    else
        echo "mccabe error"
        exit $exit_code
    fi
fi

if [ "${12}" = true ]; then

    echo Running: radon ${26} $1

    radon ${26} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "radon ok"
    else
        echo "radon error"
        exit $exit_code
    fi
fi

# Check rst files
if [ "${13}" = true ]; then

    echo Running: rstcheck ${27} $1

    rstcheck ${27} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Rstcheck ok"
    else
        echo "Rstcheck error"
        exit $exit_code
    fi
fi

# Check packaging
if [ "${14}" = true ]; then

    echo Running: check-manifest ${28} .

    check-manifest ${28} .
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Check-manifest ok"
    else
        echo "Check-manifest error"
        exit $exit_code
    fi
fi

if [ "${15}" = true ]; then

    echo Running: pyroma ${29} .

    pyroma ${29} .
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Pyroma ok"
    else
        echo  "Pyroma error"
        exit $exit_code
    fi
fi

