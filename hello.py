#!/usr/bin/env python3

def greet_from_branch_a():
    """Feature added in branch A"""
    print("Hello from feature branch A!")
    print("Branch A adds this new line in this new function.")

def main():
    print("Hello, World!")
    print("Master branch has these lines in it.")
    print("This is production-ready code!")

if __name__ == "__main__":
    main()
