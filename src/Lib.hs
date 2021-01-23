module Lib
  ( getCurrentDate,
    getCurrentDateString,
    showTriple,
    replace,
    split,
  )
where

import Data.Time.Calendar (toGregorian)
import Data.Time.Clock

type Year = Integer

type Month = Int

type Day = Int

getCurrentDate :: IO (Year, Month, Day)
getCurrentDate = getCurrentTime >>= return . toGregorian . utctDay

getCurrentDateString :: IO (String)
getCurrentDateString = getCurrentTime >>= return . show . utctDay

showTriple :: (Show a, Show b, Show c) => (a, b, c) -> String
showTriple (a, b, c) = show a ++ show b ++ show c

replace :: (a -> Bool) -> a -> [a] -> [a]
replace f r = foldr (\curr acc -> if f curr then r : acc else curr : acc) []

-- // check if element is a
-- if a, then make empty list
-- else add a to most recent list
split :: Eq a => a -> [a] -> [[a]]
split a =
  foldr
    ( \curr acc -> case acc of
        (x : xs) -> if curr == a then [] : acc else (curr : x) : xs
    )
    [[]]