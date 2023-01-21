# python-lint-plus

<p align="left">
  <a href="https://github.com/weibullguy/python-lint-plus"><img alt="All lints status" src="https://github.com/weibullguy/python-lint-plus/workflows/all-lints/badge.svg"></a></p>

## About

This is a fork of Ricardo Chaves [python-lint action](https://github.com/ricardochaves/python-lint/) 
but I added some tools that I like to use.

This action may be used to execute the following applications:

- [black](https://github.com/psf/black)
- [yapf](https://github.com/google/yapf)
- [isort](https://github.com/timothycrosley/isort)
- [docformatter](https://github.com/myint/docformatter)
- [pycodestyle](https://pycodestyle.readthedocs.io)
- [autopep8](https://github.com/hhatto/autopep8)
- [pydocstyle](https://github.com/PyCQA/pydocstyle/)
- [mypy](http://mypy-lang.org/)
- [pylint](https://www.pylint.org/)
- [flake8](http://flake8.pycqa.org)
- [mccabe](https://github.com/pycqa/mccabe)
- [radon](https://pypi.org/project/radon/)
- [rstcheck](https://github.com/myint/rstcheck)
- [check-manifest](https://github.com/mgedmin/check-manifest)
- [pyroma](https://github.com/regebro/pyroma)

The default for each tool is check only, not make automatic changes.  It's
recommended that the tools you use in this action be used in-line with your
editor or IDE and/or as pre-commit hooks.  This action just verifies you didn't
forget to do that.

All tools are enabled by default with the exception of black and yapf.  It's
certainly your prerogative to use as many autoformatters as you'd like, but I
recommend using only one.  Which you choose should be enabled with the
use-black or use-yapf input.

Each run of the action creates a virtual environment.  Each of the enabled
tools is installed in this virtual environment before that tool is executed.
The default name of the virtual environment is ```python-lint-plus```, but you 
can set it to whatever you'd like with the ```virtual-env``` option.
This can be helpful if you're running a matrix of various versions of python.

## Usage

See [action.yml](action.yml)

Basic:

```yml
steps:
  - uses: actions/checkout@v2
  - uses: weibullguy/python-lint-plus@v1.11.0
```

Options:

```yml
steps:
  - uses: actions/checkout@v2
  - uses: weibullguy/python-lint-plus@v1.11.0
    with:
      python-root-list: "tests"
      virtual-env: "python-lint-plus"
      use-black: false
      black-version:
      use-yapf: false
      yapf-version:
      use-isort: false
      isort-version:
      use-docformatter: false
      docformatter-version:
      use-pycodestyle: false
      pycodestyle-version:
      use-autopep8: false
      autopep8-version:
      use-pydocstyle: false
      pydocstyle-version:
      use-mypy: false
      mypy-version:
      use-pylint: false
      pylint-version:
      use-flake8: false
      flake8-version:
      use-mccabe: false
      mccabe-version:
      use-radon: false
      radon-version:
      use-rstcheck: false
      rstcheck-version:
      use-check-manifest: false
      check-manifest-version:
      use-pyroma: false
      pyroma-version:
      extra-black-options: ""
      extra-yapf-options: ""
      extra-isort-options: ""
      extra-docformatter-options: ""
      extra-pycodestyle-options: ""
      extra-pydocstyle-options: ""
      extra-mypy-options: ""
      extra-pylint-options: ""
      extra-flake8-options: ""
      extra-mccabe-options: ""
      extra-radon-options: ""
      extra-rstcheck-options: ""
      extra-manifest-options: ""
      extra-pyroma-options: ""
```

Command build logic list:

```bash
black --check $(extra-black-options) $(python-root-list)

yapf $(extra-yapf-options) $(python-root-list) --diff

isort $(extra-isort-options) $(python-root-list) -c --diff

docformatter $(extra-docformatter-options) $(python-root-list)

pycodestyle $(extra-pycodestyle-options) $(python-root-list)

autopep8 $(extra-autopep8-options) $(python-root-list)

pydocstyle $(extra-pydocstyle-options) $(python-root-list)

mypy $(extra-mypy-options) $(python-root-list)

pylint $(extra-pylint-options) $(python-root-list)

flake8 $(extra-flake8-options) $(python-root-list)

python -m mccabe $(extra-mccabe-options) $(python-root-list)

radon $(extra-radon-options) $(python-root-list)

rstcheck $(extra-rstcheck-options) $(python-root-list)

check-manifest $(extra-manifest-options) .

pyroma $(extra-pyroma-options) .
```

When using radon, you will have to specify which check (cc, raw, mi, or hal)
you want to run in the extra-radon-options argument.  For example, the 
following snippet will cause radon to run the Cyclomatic Complexity check on 
the files.

```yml
steps:
  - uses: actions/checkout@v2
  - uses: weibullguy/python-lint-plus@v1.11.0
    with:
      python-root-list: "tests"
      virtual-environment: "python-lint-plus"
      use-radon: true
      extra-radon-options: "cc -s"
```

To run multiple radon checks, you'll need to add a step for each in your
workflow file.

## Tool Versions Used

If the version input is left unset, the action will use the latest version of
the tool available on PyPi.  In the following example action.yml, the 
docformatter version used will be 1.5.0, the isort version used will be the
latest available on PyPi, and the pydocstyle version used will be the latest
available on PyPi with a version number greater than or equal to 6.1.0.

```yml
steps:
  - uses: actions/checkout@v2
  - uses: weibullguy/python-lint-plus@v1.11.0
    with:
      python-root-list: "tests"
      virtual-env: "python-lint-plus"
      use-docformatter: true
      docformatter-version: "==1.5.0"
      use-isort: true 
      use-pydocstyle: true
      pydocstyle-version: ">=6.1.0"
```

## License

The scripts and documentation in this project are released under the [MIT License](LICENSE)

## Contributions

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md)

## Thanks

Thanks to Ricardo Chaves for writing the python-lint action and giving me a
solid starting point for this action.

