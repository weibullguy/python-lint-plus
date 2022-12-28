"""Just one test"""

import uuid


def get_name_len(name: str) -> int:
    """Len var"""
    return len(name)


def start():
    "Run ..."
    print(get_name_len("Doyle"))
    print(uuid.uuid4().hex)
