module Main where

import Data.List
-- Get working with relative paths
-- Look into publishing

import Lib (getCurrentDateString, replace)
import System.Environment

replaceIfDashWithUnderscore = replace (== '-') '_'

-- Assume first arg is just path/filename
main :: IO ()
main = do
  args <- getArgs
  let filePath = head args
  dateString <- replaceIfDashWithUnderscore <$> getCurrentDateString
  print dateString
  let newFile = dateString ++ "_" ++ filePath
  writeFile newFile ""

-- Problems
-- 1. Day when less then 10 doesn't have 0 at start
-- 1. No handling of paths yet
-- 1. Inefficient operations but eh