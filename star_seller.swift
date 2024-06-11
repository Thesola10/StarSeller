/**
 * The Star Seller exercise in algorithmics,
 * written in Swift.                        [34 lines of code]
 *
 * An interesting language for sure. It feels high-level yet natively handles
 * C types and function calls.
 */

// Interestingly, function parameters are named by default in Swift, and their
// label can differ from their internal variable name.
// Here, to be able to omit the label altogether, it is set to `_`
func putStars(_ stars: Int) {
    if (stars > 0) {
        for _ in 1...stars {
            print("*", terminator: "")
        }
    }
    print()
}

func star_seller() {
    // Swift, not unlike Rust, relies heavily on optional types. In fact,
    // a variable can only be nil if it is of an optional type.
    // Unwrapping is done using the `!` suffix.
    var name: String?
    var nstars: Int?
    var valid: Bool = false

    while (!valid) {
        print("What is your name?", terminator: " ")
        name = readLine()
        if (name != nil && name!.count > 0) {
            valid = true
        }
    }
    valid = false
    print("Hello, \(name!)!")
    while (!valid) {
        print("How many stars do you want?", terminator: " ")
        // Swift also supports using optionals in an if/else block, essentially
        // acting as a try/catch block of sorts.
        // The `let` keyword defines constants as opposed to `var` which
        // defines variables.
        if let stars = readLine() {
            nstars = Int(stars)
        }
        if (nstars != nil && nstars! <= 200 && nstars! >= 0) {
            putStars(nstars!)
            valid = true
        }
    }
    print("Goodbye, \(name!)")
}

// There is no explicit entry point in Swift, not unlike Python.
star_seller()

// This language is case-sensitive.
