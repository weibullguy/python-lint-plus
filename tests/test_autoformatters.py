#!/bin/env python

import pytest

from . import ACTION_ARGS, do_execute_action


class TestBlack:
    """Test class for testing action using black."""

    @pytest.mark.unit
    def test_no_changes_no_options(self):
        """black returns 0 with no options on a file not needing changes."""
        ACTION_ARGS["python_root_list"] = "tests/_files/test_formatters_no_changes.py"
        ACTION_ARGS["use_black"] = "true"
        ACTION_ARGS["extra_black_options"] = ""

        process = do_execute_action(ACTION_ARGS)

        assert process.returncode == 0
        assert "Black ok" in process.stdout

    @pytest.mark.unit
    def test_no_changes_with_options(self):
        """black returns 0 with options on a file not needing changes."""
        ACTION_ARGS["python_root_list"] = "tests/_files/test_formatters_no_changes.py"
        ACTION_ARGS["use_black"] = "true"
        ACTION_ARGS["extra_black_options"] = "--line-length 72 --target-version py38"

        process = do_execute_action(ACTION_ARGS)

        assert process.returncode == 0
        assert "Black ok" in process.stdout

    @pytest.mark.unit
    def test_changes_no_options(self):
        """black returns 1 with no options on a file needing changes."""
        ACTION_ARGS["python_root_list"] = "tests/_files/test_formatters_with_changes.py"
        ACTION_ARGS["use_black"] = "true"
        ACTION_ARGS["extra_black_options"] = ""

        process = do_execute_action(ACTION_ARGS)

        assert process.returncode == 1
        assert "Black error" in process.stdout

    @pytest.mark.unit
    def test_changes_with_options(self):
        """black returns 1 with options on a file needing changes."""
        ACTION_ARGS["python_root_list"] = "tests/_files/test_formatters_with_changes.py"
        ACTION_ARGS["use_black"] = "true"
        ACTION_ARGS["extra_black_options"] = "--line-length 100"

        process = do_execute_action(ACTION_ARGS)

        assert process.returncode == 1
        assert "Black error" in process.stdout

        ACTION_ARGS["python_root_list"] = ""
        ACTION_ARGS["use_black"] = "false"
        ACTION_ARGS["extra_black_options"] = ""



class TestiSort:
    """Test class for testing action using isort."""

    @pytest.mark.unit
    def test_no_changes_no_options(self):
        """isort returns 0 with no options on a file not needing changes."""
        ACTION_ARGS["python_root_list"] = "tests/_files/test_formatters_no_changes.py"
        ACTION_ARGS["use_isort"] = "true"
        ACTION_ARGS["extra_isort_options"] = ""

        process = do_execute_action(ACTION_ARGS)

        assert process.returncode == 0
        assert "isort ok" in process.stdout

        ACTION_ARGS["python_root_list"] = ""
        ACTION_ARGS["use_isort"] = "false"
        ACTION_ARGS["extra_isort_options"] = ""

    @pytest.mark.unit
    def test_no_changes_with_options(self):
        """isort returns 0 with options on a file not needing changes."""
        ACTION_ARGS["python_root_list"] = "tests/_files/test_formatters_no_changes.py"
        ACTION_ARGS["use_isort"] = "true"
        ACTION_ARGS["extra_isort_options"] = "-l 72"

        process = do_execute_action(ACTION_ARGS)

        assert process.returncode == 0
        assert "isort ok" in process.stdout

        ACTION_ARGS["python_root_list"] = ""
        ACTION_ARGS["use_isort"] = "false"
        ACTION_ARGS["extra_isort_options"] = ""

    @pytest.mark.unit
    def test_changes_no_options(self):
        """isort returns 0 with no options on a file not needing changes."""
        ACTION_ARGS["python_root_list"] = "tests/_files/test_formatters_with_changes.py"
        ACTION_ARGS["use_isort"] = "true"
        ACTION_ARGS["extra_isort_options"] = ""

        process = do_execute_action(ACTION_ARGS)

        assert process.returncode == 1
        assert "isort error" in process.stdout

        ACTION_ARGS["python_root_list"] = ""
        ACTION_ARGS["use_isort"] = "false"
        ACTION_ARGS["extra_isort_options"] = ""

    @pytest.mark.unit
    def test_changes_with_options(self):
        """isort returns 0 with options on a file not needing changes."""
        ACTION_ARGS["python_root_list"] = "tests/_files/test_formatters_with_changes.py"
        ACTION_ARGS["use_isort"] = "true"
        ACTION_ARGS["extra_isort_options"] = "-w 72"

        process = do_execute_action(ACTION_ARGS)

        assert process.returncode == 1
        assert "isort error" in process.stdout

        ACTION_ARGS["python_root_list"] = ""
        ACTION_ARGS["use_isort"] = "false"
        ACTION_ARGS["extra_isort_options"] = ""


class TestDocformatter:
    """Test class for testing action using docformatter."""

    @pytest.mark.unit
    def test_no_changes_no_options(self):
        """docformatter returns 0 with no options on a file not needing changes."""
        ACTION_ARGS["python_root_list"] = "tests/_files/test_formatters_no_changes.py"
        ACTION_ARGS["use_docformatter"] = "true"
        ACTION_ARGS["extra_docformatter_options"] = ""

        process = do_execute_action(ACTION_ARGS)

        assert process.returncode == 0
        assert "docformatter ok" in process.stdout

        ACTION_ARGS["python_root_list"] = ""
        ACTION_ARGS["use_docformatter"] = "false"
        ACTION_ARGS["extra_docformatter_options"] = ""

    @pytest.mark.unit
    def test_no_changes_with_options(self):
        """docformatter returns 0 with options on a file not needing changes."""
        ACTION_ARGS["python_root_list"] = "tests/_files/test_formatters_no_changes.py"
        ACTION_ARGS["use_docformatter"] = "true"
        ACTION_ARGS["extra_docformatter_options"] = "--wrap-summaries 82"

        process = do_execute_action(ACTION_ARGS)

        assert process.returncode == 0
        assert "docformatter ok" in process.stdout

        ACTION_ARGS["python_root_list"] = ""
        ACTION_ARGS["use_docformatter"] = "false"
        ACTION_ARGS["extra_docformatter_options"] = ""

    @pytest.mark.unit
    def test_changes_no_options(self):
        """docformatter returns 0 with no options on a file not needing changes."""
        ACTION_ARGS["python_root_list"] = "tests/_files/test_formatters_with_changes.py"
        ACTION_ARGS["use_docformatter"] = "true"
        ACTION_ARGS["extra_docformatter_options"] = ""

        process = do_execute_action(ACTION_ARGS)

        assert process.returncode == 3
        assert "docformatter wants to format one or more files" in process.stdout

        ACTION_ARGS["python_root_list"] = ""
        ACTION_ARGS["use_docformatter"] = "false"
        ACTION_ARGS["extra_docformatter_options"] = ""

    @pytest.mark.unit
    def test_changes_with_options(self):
        """docformatter returns 0 with options on a file not needing changes."""
        ACTION_ARGS["python_root_list"] = "tests/_files/test_formatters_with_changes.py"
        ACTION_ARGS["use_docformatter"] = "true"
        ACTION_ARGS["extra_docformatter_options"] = "--wrap-summaries 72 --wrap-descriptions 65"

        process = do_execute_action(ACTION_ARGS)

        assert process.returncode == 3
        assert "docformatter wants to format one or more files" in process.stdout

        ACTION_ARGS["python_root_list"] = ""
        ACTION_ARGS["use_docformatter"] = "false"
        ACTION_ARGS["extra_docformatter_options"] = ""

