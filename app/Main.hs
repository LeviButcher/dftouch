module Main where

import Data.List
import Lib (getCurrentDateString, replace, split)
import System.Environment

replaceIfDashWithUnderscore = replace (== '-') '_'

main :: IO ()
main = do
  args <- getArgs
  let filePath = head args
  dateString <- replaceIfDashWithUnderscore <$> getCurrentDateString
  print dateString
  let splitPath = split '/' filePath
  let (rest, fileName) = splitAt (length splitPath - 1) splitPath
  let dateFileName = ((dateString ++ "_") ++) <$> fileName
  let dateFullPath = intercalate "/" $ union rest dateFileName
  writeFile dateFullPath ""

-- Problems
-- 1. Day when less then 10 doesn't have 0 at start
-- 1. No handling of paths yet
-- 1. Inefficient operations but eh