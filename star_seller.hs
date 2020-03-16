-- The Star Seller exercise in algorithmics,
-- written in Haskell script.               [Unfinished]

-- Honestly, Haskell and pure functional programming is such a strange yet
-- elegant concept. It feels so right and I can't wait to experiment further
-- with it.

putStars :: Int -> [Char]
putStars n = take n (repeat '*')    -- Demoing a lazy iterator


main :: IO ()
main = print "hello"

-- This language is case-sensitive.
