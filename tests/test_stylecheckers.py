#!/bin/env python3

import pytest

from . import ACTION_ARGS, do_execute_action


class TestPyCodeStyle:
    """Test class for testing action using pycodestyle."""

    @pytest.mark.unit
    def test_no_changes_no_options(self):
        """pycodestyle returns 0 with no options on a file not needing changes."""
        ACTION_ARGS["python_root_list"] = "tests/_files/test_stylers_no_changes.py"
        ACTION_ARGS["use_pycodestyle"] = "true"
        ACTION_ARGS["extra_pycodetyle_options"] = ""

        process = do_execute_action(ACTION_ARGS)

        assert process.returncode == 0
        assert "pycodestyle ok" in process.stdout


    @pytest.mark.unit
    def test_no_changes_with_options(self):
        """pycodestyle returns 0 with options on a file not needing changes."""
        ACTION_ARGS["python_root_list"] = "tests/_files/test_stylers_no_changes.py"
        ACTION_ARGS["use_pycodestyle"] = "true"
        ACTION_ARGS["extra_pycodetyle_options"] = "--statistics --diff"

        process = do_execute_action(ACTION_ARGS)

        assert process.returncode == 0
        assert "pycodestyle ok" in process.stdout
