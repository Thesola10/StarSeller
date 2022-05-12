      * The Star Seller exercise in algorithmics,
      * written in COBOL.                   [23 lines of code]

      * COBOL was designed to run on punch cards, so it is not freeform.
      * For instance, a line must start on column 7 since the first 6
      * are (theoretically) reserved for line numbers, and can't be
      * longer than 72 columns. Also, comments start on column 7, but
      * other code must start at least on column 8.
      * Look mom, now I can code with a six-figure salary!

000100 IDENTIFICATION DIVISION.
000200  PROGRAM-ID. StarSeller.
000300 DATA DIVISION.
        WORKING-STORAGE SECTION.
      * I'm sure this type system makes sense somehow. Eh, at least
      * having a type system at all makes it better than Javascript.
        01 WS-NAME PIC A(20) VALUE IS ' '.
        01 WS-STAR PIC S9(9) USAGE IS BINARY VALUE IS -1.
        88 PASS VALUES ARE 0 THRU 200.

       PROCEDURE DIVISION.
           PERFORM READ-NAME-PARA UNTIL NOT WS-NAME=" ".
           DISPLAY "Hello, "WS-NAME"!".
           PERFORM READ-STARS-PARA UNTIL PASS.
           PERFORM SHOW-STARS-PARA WS-STAR TIMES.
           DISPLAY "".

           DISPLAY "Goodbye, "WS-NAME.
           STOP RUN.

           READ-NAME-PARA.
           DISPLAY "What is your name? " NO ADVANCING.
           ACCEPT WS-NAME.

           READ-STARS-PARA.
           DISPLAY "How many stars do you want? " NO ADVANCING.
           ACCEPT WS-STAR.

           SHOW-STARS-PARA.
           DISPLAY "*" NO ADVANCING.

      * This language is case-insensitive and indentation-sensitive.
