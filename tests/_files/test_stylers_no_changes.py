#!/bin/env python3


class ClassToTestStyleCheckers:
    """Class for testing style checkers."""

    def method_with_short_lines(self):
        """This is a method with lines that do not need to be wrapped."""
        float_const = 10.0
        int_const = 10
        str_const = "10"

        if float_const >= 10:
            print("The float constant is at least 10.0")

        if int_const >= 10:
            print("The integer constant is at least 10.")

        if str_const == "10":
            print("The string constant is 10.")
