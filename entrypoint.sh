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
# $11 - extra-black-options
# $12 - extra-yapf-options
# ${13} - extra-isort-options
# ${14} - extra-docformatter-options
# ${15} - extra-pycodestyle-options
# ${16} - extra-pydocstyle-options
# ${17} - extra-mypy-options
# ${18} - extra-pylint-options
# ${19} - extra-flake8-options

# Run the autoformatters first.
if [ "$2" = true ] ; then

    echo Running: black --check ${11} $1

    black --check ${11} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Black ok"
    else
        echo "Black error"
        exit $exit_code
    fi

fi

if [ "$3" = true ]; then

    echo Running: yapf ${12} $1

    yapf ${12} $1
    exit_code=$?

    if "$exit_code" = "0" ]; then
        echo "yapf ok"
    else
        echo "yapf error"
        exit $exit_code
    fi

fi

if [ "$4" = true ] ; then

    echo Running: isort ${13} $1 -c --diff

    isort ${13} $1 -c --diff
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "isort ok"
    else
        echo "isort error"
        exit $exit_code
    fi

fi

if [ "$5" = true ] ; then

    echo Running: docformatter -c --recursive ${14} $1

    docformatter -c --recursive ${14} $1
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

    echo Running: pycodestyle ${15} $1

    pycodestyle ${15} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "pycodestyle ok"
    else
        echo "pycodestyle error"
        exit $exit_code
    fi

fi

if [ "$7" = true ] ; then

    echo Running: pydocstyle ${16} $1

    pydocstyle ${16} $1
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

    echo Running: mypy ${17} $1

    mypy ${17} $1
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

    echo Running: pylint ${18} $1

    pylint ${18} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Pylint ok"
    else
        echo "Pylint error"
        exit $exit_code
    fi

fi

if [ "${10}" = true ] ; then

    echo Running: flake8 ${19} $1

    flake8 ${19} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Flake8 ok"
    else
        echo "Flake8 error"
        exit $exit_code
    fi

fi

