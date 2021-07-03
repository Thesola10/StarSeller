extern crate rprompt;

use rprompt::prompt_reply_stdout;

/**
 * The Star Seller exercise in algorithmics,
 * written in Rust with Cargo.              [26 lines of code]
 *
 * Cargo was necessary, because native Rust implementations of stdin read
 * are too simplistic for this kind of program. Additionally, in Rust, you are
 * expected to use external crates, so this makes this example more useful and
 * representative of "real world" Rust code.
 *
 * So, is Rust any good for smaller applications? The optimized binary for the
 * Star Seller is 1.6M, while the C version is only 18K, and even the Ada
 * version is under 400K.
 * HOWEVER! I have noticed that running 'strip' on that release binary brings
 * it way down to a mere 203K. This may be because Rust links crates "as is",
 * even statically, by keeping every symbol they define, regardless of whether
 * they are actually used.
 *
 * Its robustness and memory safety also really turn the tide when it comes to
 * much larger applications, so that could be interesting to see.
 *
 * In any case, if I'm ever given a choice between C++ and Rust, I'm definitely
 * going to choose the latter, without a second thought.
 */

fn main()
{
    let mut name       = String::new();
    let mut stars:i32  = 0;
    let mut valid:bool = false;

    while !valid {
        name = prompt_reply_stdout("What is your name? ").unwrap();
        if name.chars().count() > 0 {
            valid = true;
        }
    }
    valid = false;

    println!("Hello, {}!", name);

    while !valid {
        stars = prompt_reply_stdout("How many stars do you want? ").unwrap()
            .parse().unwrap();
        // There's no explicit need for match, but this being an example,
        // I find it useful to include it as a reference.
        match stars {
            0 ..= 200 => valid = true,
            _         => (),
        }
    }

    for _x in 0..stars {
        print!("*");
    }
    println!("\nGoodbye, {}", name);
}

// This language is case-sensitive.
