#!/usr/bin/env python3
# The Star Seller exercise in algorithmics,
# written in Python 3.                      [18 lines of code]

'''
Not much to say. Python is concise and straightforward, and its exigeance in
indentation makes it enjoyable to read. Certainly one of the smaller Star
Sellers I've implemented so far.

An important drawback to Python is that as a language, it is fully interpreted.
While later versions of Python 3 implement an intermediary bytecode format to
speed up re-execution, it is important to keep that in mind.
'''

def star_seller():
    name : str
    stars : int     = 0
    valid : bool    = False

    while not valid:
        name = input("What is your name? ")
        if len(name) > 0:
            valid = True
    valid = False
    print(f"Hello, {name}!")
    while not valid:
        stars = int(input("How many stars do you want? "))
        if (stars < 200):
            print("*" * stars)
            valid = True
    print(f"Goodbye, {name}")

if __name__ == '__main__':
    star_seller()

# This language is case- and indentation-sensitive
