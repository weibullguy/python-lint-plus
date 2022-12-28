#!/bin/sh -l

# Parameters
#
# $1 - python-root-list
# $2 - use-black
# $3 - use-yapf
# $4 - use-isort
# $5 - use-docformatter
# $6 - use-pycodestyle
# #7 - use-autopep8
# $8 - use-pydocstyle
# $9 - use-mypy
# $10 - use-pylint
# ${11} - use-flake8
# ${12} - use mccabe
# ${13} - use radon
# ${14} - use-rstcheck
# ${15} - use-check-manifest
# ${16} - use-pyroma
# ${17} - extra-black-options
# ${18} - extra-yapf-options
# ${19} - extra-isort-options
# ${20} - extra-docformatter-options
# ${21} - extra-pycodestyle-options
# ${22} - extra-autopep8-options
# ${23} - extra-pydocstyle-options
# ${24} - extra-mypy-options
# ${25} - extra-pylint-options
# ${26} - extra-flake8-options
# ${27} - extra-mccabe-options
# ${28} - extra-radon-options
# ${29} - extra-rstcheck-options
# ${30} - extra-manifest-options
# ${31} - extra-pyroma-options

# Run the autoformatters first.
if [ "$2" = true ] ; then

    echo Running: black --check ${17} $1

    black --check ${17} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Black ok"
    else
        echo "Black error"
        exit $exit_code
    fi

fi

if [ "$3" = true ]; then

    echo Running: yapf ${18} $1

    yapf ${18} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "yapf ok"
    else
        echo "yapf error"
        exit $exit_code
    fi

fi

if [ "$4" = true ] ; then

    echo Running: isort ${19} $1 -c --diff

    isort ${19} $1 -c --diff
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "isort ok"
    else
        echo "isort error"
        exit $exit_code
    fi

fi

if [ "$5" = true ] ; then

    echo Running: docformatter -c --recursive ${20} $1

    docformatter -c --recursive ${20} $1
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

    echo Running: pycodestyle ${21} $1

    pycodestyle ${21} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "pycodestyle ok"
    else
        echo "pycodestyle error"
        exit $exit_code
    fi

fi

if [ "$7" = true ] ; then

    echo Running: autopep8 ${22} $1

    autopep8 ${22} $1
    exit_code=$?

    if [ "$exit_code" = 0 ]; then
        echo "autopep8 ok"
    else
        echo "autopep8 error"
        echo $exit_code
    fi

fi

if [ "$8" = true ] ; then

    echo Running: pydocstyle ${23} $1

    pydocstyle ${23} $1
    exit_code=$?

    if [ "$exit_code" = 0 ]; then
        echo "pydocstyle ok"
    else
        echo "pydocstyle error"
        exit $exit_code
    fi
fi

# Next type check everything.
if [ "$9" = true ] ; then

    echo Running: mypy ${24} $1

    mypy ${24} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "mypy ok"
    else
        echo "mypy error"
        exit $exit_code
    fi

fi

# Finally, lint the code.
if [ "${10}" = true ] ; then

    echo Running: pylint ${25} $1

    pylint ${25} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Pylint ok"
    else
        echo "Pylint error"
        exit $exit_code
    fi

fi

if [ "${11}" = true ] ; then

    echo Running: flake8 ${26} $1

    flake8 ${26} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Flake8 ok"
    else
        echo "Flake8 error"
        exit $exit_code
    fi

fi

# Check code maintainability
if [ "${12}" = true ]; then

    echo Running: mccabe ${27} $1

    python -m mccabe ${27} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "mccabe complexity ok"
    else
        echo "mccabe error"
        exit $exit_code
    fi
fi

if [ "${13}" = true ]; then

    echo Running: radon ${28} $1

    radon ${28} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "radon ok"
    else
        echo "radon error"
        exit $exit_code
    fi
fi

# Check rst files
if [ "${14}" = true ]; then

    echo Running: rstcheck ${29} $1

    rstcheck ${29} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Rstcheck ok"
    else
        echo "Rstcheck error"
        exit $exit_code
    fi
fi

# Check packaging
if [ "${15}" = true ]; then

    echo Running: check-manifest ${30} .

    check-manifest ${30} .
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Check-manifest ok"
    else
        echo "Check-manifest error"
        exit $exit_code
    fi
fi

if [ "${16}" = true ]; then

    echo Running: pyroma ${31} .

    pyroma ${31} .
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Pyroma ok"
    else
        echo  "Pyroma error"
        exit $exit_code
    fi
fi

