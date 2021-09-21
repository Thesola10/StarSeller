#!/usr/bin/env node
/**
 * The Star Seller exercise in algorithmics,
 * written in Node.JS.                      [32 lines of code]
 *
 * Javascript has some cool ideas: it's an async-by-default language, built
 * to be event-oriented, which makes perfect sense on web pages... but not so
 * much for modern apps and the complexity they require.
 * And don't even get me started on the bad practices (auto-semicolon, cast in
 * comparisons, silent failure...)
 */

// Not unlike Rust, the Javascript I/O interface is very bare-bones, so I'm
// using the built-in Readline module.
const Readline = require('readline');
const Util = require('util');

const rl = Readline.createInterface({
    input: process.stdin,
    output: process.stdout,
    terminal: false
});
const question = Util.promisify(rl.question).bind(rl);

var name = "";
var nstars = -1;

async function askName()
{
    while (!name) {
        name = await question("What is your name? ");
    }
    console.log(`Hello, ${name}!`);
}

async function askStars()
{
    var ans = "";
    while (!ans || nstars < 0 || nstars > 200) {
        ans = await question("How many stars do you want? ");
        nstars = parseInt(ans);
    }
    console.log("*".repeat(nstars));
}

// Javascript is an asynchronous, event-oriented language, so all lines run at
// the same time by default. Promises are a control structure for syncing calls
// together.
askName()
    .then(askStars)
    .then(() => {
        console.log(`Goodbye, ${name}`);
        process.exit(0);
    });

// This language is case-sensitive.
