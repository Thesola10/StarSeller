'vim: ft=vb
Import System

''' The Star Seller exercise in algorithmics,
''' written in Visual Basic .NET.           [22 lines of code]

''' This is the very first programming language I got to try. I used it on
''' Future Pinball, then started using Visual Basic 2010 Express.
''' Luckily, I stopped using it as I learned more about programming in general.
''' The syntax for this language is kind of heavy in retrospect, though I
''' remember having noted that before.

Module StarSeller
    Sub Main(args as String())
        Dim Name    as String
        Dim Stars   as Integer
        Dim Counter as Integer
        Dim Valid   as Boolean = False

        Console.Write("What is your name? ")
        Name = Console.ReadLine()
        Console.WriteLine("Hello, " + Name + "!")
        While Not Valid
            Console.Write("How many stars do you want? ")
            Stars = Console.ReadLine()
            If Stars >= 0 And Stars <= 200 Then
                Valid = True
            End If
        End While
        For Counter = 1 To Stars
            Console.Write("*")
        Next
        Console.WriteLine(vbCrLf + "Goodbye, " + Name)
    End Sub
End Module

''' This language is case-insensitive.
