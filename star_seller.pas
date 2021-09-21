(* The Star Seller exercise in algorithmics,
   written in FreePascal.                   [25 lines of code]
 *)

{ Pascal was likely the prime competitor for C back in the nineties, and their
   fates are surprisingly similar -- they both had an object-oriented evolution
   and they were the first-class language on respective operating systems
   -- Pascal was to Mac OS Classic what C is to UNIX.

  Also: Borland's Delphi is just an evolution of Apple's Object Pascal.
}

var Stars : integer;
    Name  : array[1..20] of char;
    valid : boolean;
    i     : integer;

begin
    valid := False;
    WHILE NOT valid DO
    begin
        write('What is your name? '); readln(Name);
        IF NOT (name = '') THEN valid := True;
    end;
    valid := False;
    writeln('Hello, ', Name, '!');
    WHILE NOT valid DO
    begin
        write('How many stars do you want? '); readln(Stars);
        IF (Stars >= 0) AND (Stars <= 200) THEN
        begin
            FOR i := 1 TO Stars DO write('*');
            writeln;
            valid := True;
        end;
    end;
    writeln('Goodbye, ', Name);
end.

{ This language is case-insensitive. }
