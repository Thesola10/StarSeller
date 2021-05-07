-- The Star Seller exercise in algorithmics,
-- written in Haskell script.               [23 lines of code]

-- Honestly, Haskell and pure functional programming is such a strange yet
-- elegant concept. It feels so right and I can't wait to experiment further
-- with it.

import Text.Read

putStars :: Int -> [Char]
putStars n = take n (repeat '*')    -- Demoing a lazy iterator


askStars :: IO Int
askStars =  do
            putStr "How many stars do you want? "
            ask <- getLine
            let value = readMaybe ask :: Maybe Int
            case value of
              Just n -> if n <=> (0,200)
                           then return n
                           else askStars
              Nothing -> askStars


(<=>) :: Ord a => a -> (a,a) -> Bool
(<=>) x (min, max) = x >= min && x <= max

main :: IO ()
main =  do
        putStr "What is your name? "
        name <- getLine
        putStrLn $ "Hello, " ++ name ++ "!"
        stars <- askStars
        putStrLn $ putStars stars
        putStrLn $ "Goodbye, " ++ name


-- This language is case-sensitive.
