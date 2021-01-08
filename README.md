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
- [pydocstyle](https://github.com/PyCQA/pydocstyle/)
- [mypy](http://mypy-lang.org/)
- [pylint](https://www.pylint.org/)
- [flake8](http://flake8.pycqa.org)

The default for each tool is check only, not make automatic changes.  It's
recommended that the tools you use in this action be used in-line with your
editor or IDE and/or as pre-commit hooks.  This action just verifies you didn't
forget to do that.

However, you could choose to have fixes applies by each tool.  If you do, it's
recommended that the autoformatters come first, followed by the style checking
tools to verify the autoformatter results.  After this, the type checkers and
linters can be run.

All tools are enabled by default with the exception of black and yapf.  It's
certainly your prerogative to use as many autoformatters as you'd like, but I
recommend using only one.  Which you choose should be enabled with the
use-black or use-yapf input.

## Usage

See [action.yml](action.yml)

Basic:

```yml
steps:
  - uses: actions/checkout@v2
  - uses: weibullguy/python-lint-plus@master
```

Options:

```yml
steps:
  - uses: actions/checkout@v2
  - uses: weibullguy/python-lint-plus@master
    with:
      python-root-list: "python_alelo tests"
      use-black: false
      use-yapf: false
      use-isort: false
      use-docformatter: false
      use-pycodestyle: false
      use-pydocstyle: false
      use-mypy: false
      use-pylint: false
      use-flake8: false
      extra-black-options: ""
      extra-yapf-options: ""
      extra-isort-options: ""
      extra-docformatter-options: ""
      extra-pycodestyle-options: ""
      extra-pydocstyle-options: ""
      extra-mypy-options: ""
      extra-pylint-options: ""
      extra-flake8-options: ""
```

Command build logic list:

```bash
black --check $(extra-black-options) $(python-root-list)

yapf $(extra-yapf-options) $(python-root-list) --diff

isort $(extra-isort-options) $(python-root-list) -c --diff

docformatter $(extra-docformatter-options) $(python-root-list)

pycodestyle $(extra-pycodestyle-options) $(python-root-list)

pydocstyle $(extra-pydocstyle-options) $(python-root-list)

mypy $(extra-mypy-options) $(python-root-list)

pylint $(extra-pylint-options) $(python-root-list)

flake8 $(extra-flake8-options) $(python-root-list)
```

## Versions used

To identify the version used you must consult the [CHANGELOG.md](https://github.com/weibullguy/python-lint-image/blob/master/CHANGELOG.md) of the image used in the [Dockerfile](Dockerfile).

## License

The scripts and documentation in this project are released under the [MIT License](LICENSE)

## Contributions

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md)

## Thanks

Thanks to Ricardo Chaves for writing the python-lint action and giving me a
solid starting point for this action.

