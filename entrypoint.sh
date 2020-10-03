#!/bin/sh -l

# Parameters
#
# $1 - python-root-list
# $2 - use-black
# $3 - use-isort
# $4 - use-docformatter
# $5 - use-pycodestyle
# $6 - use-pydocstyle
# $7 - use-mypy
# $8 - use-pylint
# $9 - use-flake8
# $10 - extra-black-options
# $11 - extra-isort-options
# ${12} - extra-docformatter-options
# ${13} - extra-pycodestyle-options
# ${14} - extra-pydocstyle-options
# ${15} - extra-mypy-options
# ${16} - extra-pylint-options
# ${17} - extra-flake8-options

# Run the autoformatters first.
if [ "$2" = true ] ; then

    echo Running: black --check ${10} $1

    black --check ${10} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Black ok"
    else
        echo "Black error"
        exit $exit_code
    fi

fi

if [ "$3" = true ] ; then

    echo Running: isort ${11} $1 -c --diff

    isort ${11} $1 -c --diff
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "isort ok"
    else
        echo "isort error"
        exit $exit_code
    fi

fi

if [ "$4" = true ] ; then

    echo Running: docformatter -c --recursive ${12} $1

    docformatter -c --recursive ${12} $1
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
if [ "$5" = true ] ; then

    echo Running: pycodestyle ${13} $1

    pycodestyle ${13} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "pycodestyle ok"
    else
        echo "pycodestyle error"
        exit $exit_code
    fi

fi

if [ "$6" = true ] ; then

    echo Running: pydocstyle ${14} $1

    pydocstyle ${14} $1
    exit_code=$?

    if [ "$exit_code" = 0 ]; then
        echo "pydocstyle ok"
    else
        echo "pydocstyle error"
        echo $exit_code
    fi
fi

# Next type check everything.
if [ "$7" = true ] ; then

    echo Running: mypy ${15} $1

    mypy ${15} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "mypy ok"
    else
        echo "mypy error"
        exit $exit_code
    fi

fi

# Finally, lint the code.
if [ "$8" = true ] ; then

    echo Running: pylint ${16} $1

    pylint ${16} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Pylint ok"
    else
        echo "Pylint error"
        exit $exit_code
    fi

fi

if [ "$9" = true ] ; then

    echo Running: flake8 ${17} $1

    flake8 ${17} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Flake8 ok"
    else
        echo "Flake8 error"
        exit $exit_code
    fi

fi

