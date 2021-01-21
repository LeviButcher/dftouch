module Lib
  ( getCurrentDate,
    showTriple,
  )
where

import Data.Time.Calendar (toGregorian)
import Data.Time.Clock

type Year = Integer

type Month = Int

type Day = Int

getCurrentDate :: IO (Year, Month, Day)
getCurrentDate = getCurrentTime >>= return . toGregorian . utctDay

showTriple :: (Show a, Show b, Show c) => (a, b, c) -> String
showTriple (a, b, c) = show a ++ show b ++ show c
