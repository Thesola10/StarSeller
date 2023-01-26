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
000400  WORKING-STORAGE SECTION.
      * I'm sure this type system makes sense somehow. Eh, at least
      * having a type system at all makes it better than Javascript.
000500  01 WS-NAME PIC A(20) VALUE IS ' '.
000600  01 WS-STAR PIC S9(9) USAGE IS BINARY VALUE IS -1.
000700  88 PASS VALUES ARE 0 THRU 200.

000800 PROCEDURE DIVISION.
000900     PERFORM READ-NAME-PARA UNTIL NOT WS-NAME=" ".
001000     DISPLAY "Hello, "WS-NAME"!".
001100     PERFORM READ-STARS-PARA UNTIL PASS.
001200     PERFORM SHOW-STARS-PARA WS-STAR TIMES.
001300     DISPLAY "".

001400     DISPLAY "Goodbye, "WS-NAME.
001500     STOP RUN.

001600     READ-NAME-PARA.
001700     DISPLAY "What is your name? " NO ADVANCING.
001800     ACCEPT WS-NAME.

001900     READ-STARS-PARA.
002000     DISPLAY "How many stars do you want? " NO ADVANCING.
002100     ACCEPT WS-STAR.

002200     SHOW-STARS-PARA.
002300     DISPLAY "*" NO ADVANCING.

      * This language is case-insensitive and indentation-sensitive.
