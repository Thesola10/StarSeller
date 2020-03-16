package main

/**
 * The Star Seller exercise in algorithmics,
 * written in Go.                           [32 lines of code]
 *
 * I hear Go is a pretty fierce competitor to Rust in the world of modern
 * native apps. Anyways, I'm glad that people finally see the good in native
 * and will (maybe) stop hallucinating over Javascript.
 *
 * I read a bit more about Go, it seems to be very I/O focused, a bit like a
 * native hybrid of Python and Java, since it employs a garbage collector and
 * rather simplistic syntax. You would prefer to use it for things like web
 * application servers.
 */

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    var name  string
    var stars int
    var valid bool
    reader := bufio.NewReader(os.Stdin)

    for !valid {
        fmt.Print("What is your name? ")
        name, _ = reader.ReadString('\n')
        if len(name) > 0 {
            valid = true
        }
    }
    valid = false

    fmt.Println("Hello, ", name, "!")

    for !valid {
        fmt.Print("How many stars do you want? ")
        fmt.Scan(&stars)
        if stars >= 0 && stars <= 200 {
            valid = true
        }
    }

    for stars > 0 {
        fmt.Print("*")
        stars -= 1
    }
    fmt.Println("\nGoodbye, ", name)
}

// This language is case-sensitive.
