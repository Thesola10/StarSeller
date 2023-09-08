      * The Star Seller exercise in algorithmics,
      * written in COBOL.                   [23 lines of code]

      * COBOL was designed to run on punch cards, so it is not freeform.
      * For instance, a line must start on column 7 since the first 6
      * are (theoretically) reserved for line numbers, and can't be
      * longer than 72 columns. Also, comments start on column 7, but
      * other code must start at least on column 8.
      * Look mom, now I can code with a six-figure salary!

 00100 IDENTIFICATION DIVISION.
 00200  PROGRAM-ID. StarSeller.
 00300 DATA DIVISION.
 00400  WORKING-STORAGE SECTION.
      * I'm sure this type system makes sense somehow. Eh, at least
      * having a type system at all makes it better than Javascript.
 00500  01 WS-NAME PIC A(20) VALUE IS ' '.
 00600  01 WS-STAR PIC S9(9) USAGE IS BINARY VALUE IS -1.
 00700  88 PASS VALUES ARE 0 THRU 200.

 00800 PROCEDURE DIVISION.
 00900     PERFORM READ-NAME-PARA UNTIL NOT WS-NAME=" ".
 01000     DISPLAY "Hello, "WS-NAME"!".
 01100     PERFORM READ-STARS-PARA UNTIL PASS.
 01200     PERFORM SHOW-STARS-PARA WS-STAR TIMES.
 01300     DISPLAY "".

 01400     DISPLAY "Goodbye, "WS-NAME.
 01500     STOP RUN.

 01600     READ-NAME-PARA.
 01700     DISPLAY "What is your name? " NO ADVANCING.
 01800     ACCEPT WS-NAME.

 01900     READ-STARS-PARA.
 02000     DISPLAY "How many stars do you want? " NO ADVANCING.
 02100     ACCEPT WS-STAR.

 02200     SHOW-STARS-PARA.
 02300     DISPLAY "*" NO ADVANCING.

      * This language is case-insensitive and indentation-sensitive.
