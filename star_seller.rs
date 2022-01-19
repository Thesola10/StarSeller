/**
 * The Star Seller exercise in algorithmics,
 * written in Rust.                         [35 lines of code]
 *
 * Rust is a programming language initially developed by Mozilla, intended to
 * rewrite parts of the Gecko rendering engine. It puts a strong accent on
 * memory safety and takes inspiration from functional languages like Haskell.
 * In fact, the original Rust compiler was initially written in OCaml.
 *
 * I had originally written an implementation making use of crates (the package
 * ecosystem developed alongside Rust), but decided to try and make one in pure
 * Rust -- after all, it couldn't be the odd one out, right?
 */

use std::io::{Write, stdin, stdout};

fn main()
{
    let mut name        = String::new();
    let mut starsc      = String::new();
    let mut stars:i32   = -1;
    let mut valid:bool  = false;

    while !valid {
        print!("What is your name? ");
        // Turns out Rust is a very stubborn language. Unlike literally every
        // other language on Earth, Rust won't flush the standard output after
        // printing. So we need to do it manually to have the prompt show up
        // before the user validates their input.
        stdout().flush().unwrap();
        let nc = stdin().read_line(&mut name).unwrap();
        if nc > 0 {
            // Stubbornness intensifies as Rust also does not strip the newline
            // character, so we need to do it manually.
            // That stubbornness serves to keep Rust memory-safe, which for OS
            // dev can save precious time debugging. For instance, here we use
            // truncate() which modifies the String instance, but in the match
            // clause below, we use trim() which returns a &str slice, which is
            // basically a bounded substring pointer.
            name.truncate(name.len() - 1);
            valid = true;
        }
    }
    valid = false;

    println!("Hello, {}!", name);

    while !valid {
        print!("How many stars do you want? ");
        stdout().flush().unwrap();
        stdin().read_line(&mut starsc).unwrap();

        // One clever aspect of Rust, which is inherited from functional
        // programming, is pattern matching. Here, parsing an integer out of a
        // string may result in an error, so we decompose the Result<T> type
        // and match its two possible constructors. By the way, the unwrap()
        // function used repeatedly before simply routes the Err() outcome into
        // an exception. Neat.
        match starsc.trim().parse() {
            Ok(x)   => stars = x,
            Err(_)  => (),
        }
        if (0..200).contains(&stars) {
            valid = true;
        }
    }

    for _x in 0..stars {
        print!("*");
    }
    println!("\nGoodbye, {}", name);
}

// This language is case-sensitive.
