REM   The Star Seller exercise in algorithmics,
REM   written in Microsoft BASIC.           [11 lines of code]

REM   I couldn't tell you for sure that that's where it originated, but
REM   I'm fairly sure I've seen the Star Seller as an example for BASIC
REM   somewhere. This code is confirmed to work on any computer with a BASIC
REM   implementation. The more retro, the better :P

10    PRINT"What is your name?"
20    INPUT A$
30    IF A$ = "" THEN GOTO 10
40    PRINT"Hello, ",A$,"!"
50    PRINT"How many stars do you want?"
60    INPUT S
70    IF S > 200 OR S < 0 THEN GOTO 50
80    FOR I = 1 TO S : PRINT "*";
85    NEXT
90    PRINT
100   PRINT"Goodbye, ",A$

REM   This language is case-insensitive.
