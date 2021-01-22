module Lib
  ( getCurrentDate,
    getCurrentDateString,
    showTriple,
    replace,
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