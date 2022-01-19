/**
 * The Star Seller exercise in algorithmics,
 * written in Microsoft C Sharp.            [22 lines of code]
 *
 * C Sharp (written C#) is by far the flagship language for Microsoft's .NET
 * platform. Interestingly, it is also born from plagiarism, and the ashes of
 * its predecessor J Sharp, a Java clone from Microsoft.
 */

using System;

public class StarSeller
{
    public static void Main(string[] args)
    {
        string name;
        int stars = -1;

        do {
            Console.Write("What is your name? ");
            name = Console.ReadLine();
        } while (name == "");
        Console.WriteLine("Hello, " + name + "!");

        do {
            Console.Write("How many stars do you want? ");
            stars = (int) Console.ReadLine();
        } while (stars < 0 || stars > 200);

        for (; stars > 0; stars--) {
            Console.Write("*");
        }
        Console.WriteLine("\nGoodbye, " + name);
    }
}

// This language is case-sensitive.
