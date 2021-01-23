module Lib
  ( getCurrentDate,
    getCurrentDateString,
    replace,
    split,
    toEither,
  )
where

import Data.Functor ((<&>))
import Data.Time.Calendar (toGregorian)
import Data.Time.Clock

type Year = Integer

type Month = Int

type Day = Int

getCurrentDate :: IO (Year, Month, Day)
getCurrentDate = getCurrentTime <&> (toGregorian . utctDay)

getCurrentDateString :: IO (String)
getCurrentDateString = getCurrentTime <&> (show . utctDay)

replace :: (a -> Bool) -> a -> [a] -> [a]
replace f r = foldr (\curr acc -> if f curr then r : acc else curr : acc) []

split :: Eq a => a -> [a] -> [[a]]
split a =
  foldr
    ( \curr acc -> case acc of
        (x : xs) -> if curr == a then [] : acc else (curr : x) : xs
    )
    [[]]

toEither :: String -> Maybe a -> Either String a
toEither _ (Just a) = Right a
toEither a Nothing = Left a