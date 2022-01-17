@ECHO OFF
REM The Star Seller exercise in algorithmics,
REM written in Microsoft CMD Batch.         [14 lines of code]

REM Batch files on Windows are analogous to UNIX shell scripts, in that they
REM simply contain a set of commands for their respective command line
REM interpreters. The syntax reminds me of BASIC a bit, and it's probably not
REM a concindence, given that Microsoft designed the leading implementations of
REM BASIC back then.
REM
REM ... except this language is particularly awful to write: no quote awareness
REM means the trailing spaces have meaning in this file, the absence of a
REM boolean operator requires using several IF statements, and said statements
REM are only really usable with GOTO. (yikes)

:readname
SET /P NAME=What is your name? 
IF "%NAME%"==""     GOTO readname
ECHO Hello, %NAME%!

:readstars
SET /P STARS=How many stars do you want? 
IF %STARS% LSS 0    GOTO readstars
IF %STARS% GTR 200  GOTO readstars

:starloop
REM Awful hack: ECHO is forced to print a new line, so we prompt for nothing
REM and feed it nothing.
<NUL SET /P =*
SET /A STARS-=1
IF %STARS% GTR 0    GOTO starloop

ECHO.
ECHO Goodbye, %NAME%

REM This language is case-insensitive.
