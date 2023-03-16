"""Tests package for python-lint-plus."""

import subprocess

ACTION_ARGS={"python_root_list": "tests/test_python_code.py", 
             "virtual_env": "python_lint_plus",
             "use_black": "false",
             "black_version": "",
             "use_yapf": "false",
             "yapf_version": "",
             "use_isort": "false",
             "isort_version": "",
             "use_docformatter": "false",
             "docformatter_version": "",
             "use_pycodestyle": "false",
             "pycodestyle_version": "",
             "use_autopep8": "false",
             "autopep8_version": "",
             "use_pydocstyle": "false",
             "pydocstyle_version": "",
             "use_mypy": "false",
             "mypy_version": "",
             "use_pylint": "false",
             "pylint_version": "",
             "use_flake8": "false",
             "flake8_version": "",
             "use_mccabe": "false",
             "mccabe_version": "",
             "use_radon": "false",
             "radon_version": "",
             "use_rstcheck": "false",
             "rstcheck_version": "",
             "use_check_manifest": "false",
             "check_manifest_version": "",
             "use_pyroma": "false",
             "pyroma_version": "",
             "extra_black_options": "",
             "extra_yapf_options": "",
             "extra_isort_options": "",
             "extra_docformatter_options": "",
             "extra_pycodestyle_options": "",
             "extra_autopep8_options": "",
             "extra_pydocstyle_options": "",
             "extra_mypy_options": "",
             "extra_pylint_options": "",
             "extra_flake8_options": "",
             "extra_mccabe_options": "",
             "extra_radon_options": "",
             "extra_rstcheck_options": "",
             "extra_manifest_options": "",
             "extra_pyroma_options": "",
             "python_version": "3.10.8",
             "architecture": "x86_64",
            }

def do_execute_action(action_args):
    """Execute python_lint_plus action.

    Parameters
    ----------
    action_args : dict
        The dictionary containing all the arguments for the action.

    Return
    ------
    returncode : int
        The return code from the action.
    """
    return subprocess.run(["./entrypoint.sh",
                            action_args["python_root_list"],
                            action_args["virtual_env"],
                            action_args["use_black"],
                            action_args["black_version"],
                            action_args["use_yapf"],
                            action_args["yapf_version"],
                            action_args["use_isort"],
                            action_args["isort_version"],
                            action_args["use_docformatter"],
                            action_args["docformatter_version"],
                            action_args["use_pycodestyle"],
                            action_args["pycodestyle_version"],
                            action_args["use_autopep8"],
                            action_args["autopep8_version"],
                            action_args["use_pydocstyle"],
                            action_args["pydocstyle_version"],
                            action_args["use_mypy"],
                            action_args["mypy_version"],
                            action_args["use_pylint"],
                            action_args["pylint_version"],
                            action_args["use_flake8"],
                            action_args["flake8_version"],
                            action_args["use_mccabe"],
                            action_args["mccabe_version"],
                            action_args["use_radon"],
                            action_args["radon_version"],
                            action_args["use_rstcheck"],
                            action_args["rstcheck_version"],
                            action_args["use_check_manifest"],
                            action_args["check_manifest_version"],
                            action_args["use_pyroma"],
                            action_args["pyroma_version"],
                            action_args["extra_black_options"],
                            action_args["extra_yapf_options"],
                            action_args["extra_isort_options"],
                            action_args["extra_docformatter_options"],
                            action_args["extra_pycodestyle_options"],
                            action_args["extra_autopep8_options"],
                            action_args["extra_pydocstyle_options"],
                            action_args["extra_mypy_options"],
                            action_args["extra_pylint_options"],
                            action_args["extra_flake8_options"],
                            action_args["extra_mccabe_options"],
                            action_args["extra_radon_options"],
                            action_args["extra_rstcheck_options"],
                            action_args["extra_manifest_options"],
                            action_args["extra_pyroma_options"],
                            action_args["python_version"],
                            action_args["architecture"]],
                            stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE,
                            universal_newlines=True)

