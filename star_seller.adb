with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

-- The Star Seller exercise in algorithmics,
-- written in Ada.                          [35 lines of code]

-- I'm noting that Ada is particularly verbose. I'm sure that this has an
-- advantage in terms of memory safety and eliminating undefined behaviour.
-- I mean, there's a reason why it's powering Ariane 5. You don't want that
-- to segfault and decide to crash back into the ground.

procedure Star_Seller is
    Stars : Integer range 0 .. 200;
    Name : String (1 .. 20);
    Last : Natural;
    Valid : Boolean := False;
begin
    while not Valid loop
        Put("What is your name? ");
        Get_Line(Name, Last); -- Read name
        if not (Last = 0) then
            Valid := True;
        end if;
    end loop;
    Valid := False;
    Put("Hello, ");
    Put(Name (1..Last));
    Put("!");
    New_Line;
    while not Valid loop
        Put("How many stars do you want? ");
        Get(Stars);
        if (Stars >= 0) and (Stars <= 200) then
            for I in Integer range 1..Stars loop
                Put("*");
            end loop;
            New_Line;
            Valid := True;
        end if;
    end loop;
    Put("Goodbye, ");
    Put(Name (1..Last));
    New_Line;
end Star_Seller;

-- This language is case-insensitive.
