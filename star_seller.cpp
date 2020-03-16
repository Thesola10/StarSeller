/**
 * The Star Seller exercise in algorithmics,
 * written in ANSI C++.                     [26 lines of code]
 *
 * I am trying to use as many C++-specific syntax elements as possible,
 * so as to pertinently illustrate it against C and Rust. This is an
 * experiment for me to gauge the "worth" of these languages, and gain an
 * instructed opinion on them.
 */

#include <iostream>

using namespace std;

int main()
{
    string name;
    int    stars;
    bool   valid = false;

    while (!valid) {
        cout << "What is your name? ";
        cin >> name;
        if (name.length() > 0)
            valid = true;
    }
    valid = false;
    cout << "Hello, " << name << "!" << endl;
    while (!valid) {
        cout << "How many stars do you want? ";
        cin >> stars;
        if (stars >= 0 && stars <= 200)
            valid = true;
    }
    for (; stars; stars--)
        cout << "*";
    cout << endl << "Goodbye, " << name << endl;
    return 0;
}

// This language is case-sensitive.
