/**
 * The Star Seller exercise in algorithmics,
 * written in ANSI C.                       [24 lines of code]
 *
 * I just feel in my element with C. It's like I can talk with the CPU,
 * without the headache of assembly. It's soft and comfortable and fascinating.
 */

#include <stdio.h>
#include <stdbool.h>

int main(int argc, char *argv[])
{
    char name[20];
    int  stars;
    bool valid = false;

    while (!valid) {
        printf("What is your name? ");
        if (scanf("%s", name) > 0)
            valid = true;
    }
    valid = false;
    printf("Hello, %s!\n", name);
    while (!valid) {
        printf("How many stars do you want? ");
        scanf("%d", &stars);
        if (stars >= 0 && stars <= 200)
            valid = true;
    }
    for (; stars; stars--)
        putchar('*');
    printf("\nGoodbye, %s\n", name);
    return 0;
}

// This language is case-sensitive.
