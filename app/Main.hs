module Main where

import Data.List
import Data.Maybe (listToMaybe)
import Lib (getCurrentDateString, replace, split, toEither)
import System.Environment
import System.Exit

replaceIfDashWithUnderscore = replace (== '-') '_'

main :: IO ()
main = do
  args <- getArgs
  let userArgs = listToMaybe args
  let either = toEither "dftouch: missing file input" userArgs
  filePath <- case either of
    Left error -> print error >> exitSuccess
    Right success -> return success
  dateString <- replaceIfDashWithUnderscore <$> getCurrentDateString
  let splitPath = split '/' filePath
  let (rest, fileName) = splitAt (length splitPath - 1) splitPath
  let dateFileName = ((dateString ++ "_") ++) <$> fileName
  let dateFullPath = intercalate "/" $ union rest dateFileName
  print dateFullPath

-- writeFile dateFullPath ""

-- Problems
-- 1. Inefficient operations but eh