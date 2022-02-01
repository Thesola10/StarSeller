\ The Star Seller exercise in algorithmics,
\ written in GNU Forth.                     [17 lines of code]

\ Forth is a stack-based programming language, in that values and instructions
\ alike are both pushed onto the same stack, and the end result is left on that
\ same stack.
\ This is very counter-intuitive, but also perfect for a tiny runtime, hence
\ why it is used as a scripting language in OpenFirmware.

VARIABLE TNAME
VARIABLE TSTARS

VARIABLE NAMEL

\ The comment after the function name in parentheses is a convention.
\ Before the double hyphens are the values consumed from the stack by our
\ function, and after are the values pushed onto the stack afterwards.
: PUTSTARS  ( n -- )    DUP 1 < IF DROP ELSE 1- 42 EMIT RECURSE THEN ;
: _GETSTARS ( -- n )    TSTARS TSTARS 10 ACCEPT S>NUMBER DROP ;
: GETSTARS  ( -- n )
    ." How many stars do you want? "
    \ We need this strange manipulation because boolean comparisons consume
    \ all of their arguments. The first DUP is so we have something left to
    \ return, the second one is for the "200 <" comparison, and the last one
    \ is for the "0 >" comparison.
    \ Also, since the result of the first comparison is ahead of our duped
    \ number, we need them to swap places, hence the "SWAP".
    _GETSTARS DUP DUP DUP 0 > SWAP 200 < AND IF CR ELSE DROP CR RECURSE THEN ;
: GETNAME   ( -- )
    ." What is your name? "
    \ A stack-based if block yields some strange syntax. Basically, the "IF"
    \ instruction consumes a boolean, then evaluates the stack until the "THEN"
    \ instruction at the end. If the condition is met, everything after the
    \ "ELSE" instruction is flushed, otherwise everything before the "ELSE"
    \ gets flushed. And it works.
    TNAME 100 ACCEPT DUP 0 > IF NAMEL ! ELSE DROP CR RECURSE THEN ;

GETNAME                                 CR
." Hello, " TNAME NAMEL @ TYPE ." !"    CR
GETSTARS PUTSTARS                       CR
." Goodbye, " TNAME NAMEL @ TYPE        CR
BYE

\ This language is case-insensitive.
