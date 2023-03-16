#!/bin/env python3

from . import ACTION_ARGS

import os

class ClassToTestBlack:
    """Class for testing black."""

    def method_with_short_lines(self):
        """This is a method with lines that do need to be wrapped and so does the summary and description in the docstring.

        The docstring summary and description are longer than the wrap length, so they both need to be wrapped.
        """
        float_const = 10.0
        int_const = 10
        str_const = "10"

        if float_const >= 10 and float_const < 90.0:
            print("The float constant is at least 10.0 and less than 90.0 and now we're printing a super long line.")

        if int_const >= 10 and int_const < 90:
            print("The integer constant is at least 10 and less than 90 and now we're printing a super long line.")

        if str_const == "10":
            print("The string constant is 10 and this line is longer than the maximum line length of characters.")
