-- The Star Seller exercise in algorithmics,
-- written in Haskell script.               [23 lines of code]

-- Honestly, Haskell and pure functional programming is such a strange yet
-- elegant concept. It feels so right and I can't wait to experiment further
-- with it.

import Text.Read

putStars :: Int -> [Char]
putStars n = take n (repeat '*')    -- Demoing a lazy iterator

-- One interesting point in Haskell is that, being a purely functional
-- language, there is no real concept of "loops". Those have to be implemented
-- as recursive functions.
askStars :: IO Int
askStars =  do
            putStr "How many stars do you want? "
            ask <- getLine
            let value = readMaybe ask :: Maybe Int
            -- The Maybe wrapping type forces you to use pattern-matching to
            -- consider the case where there is no value (due to an error for
            -- instance).
            case value of
              Just n -> if n <=> (0,200)
                           then return n
                           else askStars
              Nothing -> askStars

(<=>) :: Ord a => a -> (a,a) -> Bool
(<=>) x (min, max) = x >= min && x <= max


-- Interestingly, the IO wrapping type (which signifies impurity) cannot be
-- removed. This way, you have to be mindful of how much code you have to pull
-- into that context. It improves reusability drastically.
main :: IO ()
main =  do
        putStr "What is your name? "
        name <- getLine
        putStrLn $ "Hello, " ++ name ++ "!"
        stars <- askStars
        putStrLn $ putStars stars
        putStrLn $ "Goodbye, " ++ name


-- This language is case- and indentation-sensitive.
