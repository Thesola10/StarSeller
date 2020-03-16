OBTW The Star Seller exercise in algorithmics,
     written in LOLCODE 1.3.                [27 lines of code]

    I'm about to die. Please stop this ordeal. Why am I doing this to myself??

    Well, as you can see, this language really isn't designed for ease-of-use.
    It calls itself "esoteric", but it really is just a language with poor
    syntax.
    Ironically, there are some pretty positive takeaways, like weak typing
    without implicits. Most weakly-typed languages make use of "duck typing",
    where they will not hesitate to cast a value silently on-the-fly to fit its
    destination variable. However, in LOLCODE, while it is weakly-typed, the
    compiler will try to avoid implicits like this and change the type of the
    variable itself to match. If you were using the GIMMEH statement, you'll
    be getting a string no matter what.
TLDR

HAI 1.3
CAN HAS STDIO?

I HAS A NAME 
I HAS A STARS ITZ -1

IM IN YR NAMEIN
    VISIBLE "What is your name? "!
    GIMMEH NAME
    DIFFRINT NAME AN "" 
    O RLY?
        YA RLY, GTFO
    OIC
IM OUTTA YR NAMEIN

VISIBLE "Hello, " NAME "!"

IM IN YR NBIN
    VISIBLE "How many stars do you want? "!
    GIMMEH STARS
    STARS IS NOW A NUMBR
    BOTH SAEM STARS AN BIGGR OF STARS AN 0
    O RLY?
        YA RLY, GTFO
    OIC
IM OUTTA YR NBIN

IM IN YR STOUT NERFIN YR STARS TIL BOTH SAEM STARS AN 0
    VISIBLE "*"!
IM OUTTA YR STOUT
VISIBLE ":)Goodbye, " NAME
KTHXBYE

BTW This language is case-sensitive.
