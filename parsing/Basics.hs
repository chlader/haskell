module Basics where

import Control.Monad.State.Lazy
import System.Environment


-- rewrite prob1 so that it uses >>= instead of do notation.
-- use >>=, not >>
prob1 :: IO [Integer]
{- prob1 =
  do
    putStrLn "prob1"
    return [1,2,3] -} 
prob1 = putStrLn "prob1" >>= \x -> return [1,2,3]

--rewrite prob2 so it uses do notation
prob2 :: State Integer Integer
{- prob2 =
    get >>= (\ x -> 
    put (x + x) >>
    return 1) -}

prob2 = do
    x <- get
    put (x+x)
    return 1

type Sta s a = s -> (s,a)

-- modify prob3 so it does the same computations as prob2
-- except with explicit state-passing
prob3 :: Sta Integer Integer
--prob3 s = Sta (\s -> (s,s))
prob3 s = (s+s, 1)

-- fill in reverseArgs so that it gets the command-line arguments
-- reverses them, and returns them
reverseArgs :: IO [String]
reverseArgs = do 
    x <- getArgs
    return (reverse x)

-- fill in getFirstArgIf so it returns Just x if there are 
-- command-line arguments and x is the first of these, and Nothing otherwise
getFirstArgIf :: IO (Maybe String)
getFirstArgIf = do
    x <- getArgs
    if null x then
        return Nothing
    else
        return (Just (head x))