/**
 * The Star Seller exercise in algorithmics,
 * written in Java.                         [27 lines of code]
 *
 * Java is often cited as the ultimate object-oriented language. I guess I can
 * agree, but it is also often heavy in resources due to requiring a virtual
 * machine. Still, the object concept is very expressive (albeit verbose).
 */

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class star_seller
{
    public static void main(String[] args) throws IOException
    {
        BufferedReader r = new BufferedReader(new InputStreamReader(System.in));
        String name;
        int stars = -1;

        do {
            System.out.print("What is your name? ");
            name = r.readLine();
        } while (name.isBlank());
        System.out.println("Hello, " + name + "!");
        do {
            System.out.print("How many stars do you want? ");
            try {
                stars = Integer.parseInt(r.readLine());
            } catch (NumberFormatException e) {
                continue;
            }
        } while (stars < 0 || stars > 200);
        System.out.println("*".repeat(stars));
        System.out.println("Goodbye, " + name);
    }
}

// This language is case-sensitive.
