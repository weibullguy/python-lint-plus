#!/bin/sh -l

# Parameters
#
# $1 - python-root-list
# $2 - use-pylint
# $3 - use-pycodestyle
# $4 - use-flake8
# $5 - use-black
# $6 - use-mypy
# $7 - use-isort
# $8 - use-docformatter
# $9 - use-pydocstyle
# $10 - extra-pylint-options
# $11 - extra-pycodestyle-options
# ${12} - extra-flake8-options
# ${13} - extra-black-options
# ${14} - extra-mypy-options
# ${15} - extra-isort-options
# ${16} - extra-docformatter-options
# ${17} - extra-pydocstyle-options

if [ "$8" = true ] ; then

    echo Running: docformatter ${16} $1

    docformatter ${16} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "docformetter ok"
    else
        echo "docformatter error"
        echo $exit_code
    fi
fi

if [ "$2" = true ] ; then

    echo Running: pylint ${10} $1

    pylint ${10} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Pylint ok"
    else
        echo "Pylint error"
        exit $exit_code
    fi

fi


if [ "$3" = true ] ; then

    echo Running: pycodestyle ${11} $1

    pycodestyle ${11} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "pycodestyle ok"
    else
        echo "pycodestyle error"
        exit $exit_code
    fi

fi

if [ "$9" = true ] ; then

    echo Running: pydocstyle ${17} $1

    pydocstyle ${17} $1
    exit_code=$?

    if [ "$exit_code" = 0 ]; then
        echo "pydocstyle ok"
    else
        echo "pydocstyle error"
        echo $exit_code
    fi
fi

if [ "$4" = true ] ; then

    echo Running: flake8 ${12} $1

    flake8 ${12} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Flake8 ok"
    else
        echo "Flake8 error"
        exit $exit_code
    fi

fi

if [ "$5" = true ] ; then

    echo Running: black --check ${13} $1

    black --check ${13} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Black ok"
    else
        echo "Black error"
        exit $exit_code
    fi

fi

if [ "$6" = true ] ; then

    echo Running: mypy ${14} $1

    mypy ${14} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "mypy ok"
    else
        echo "mypy error"
        exit $exit_code
    fi

fi

if [ "$7" = true ] ; then

    echo Running: isort ${15} $1 -c --diff

    isort ${15} $1 -c --diff
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "isort ok"
    else
        echo "isort error"
        exit $exit_code
    fi

fi

