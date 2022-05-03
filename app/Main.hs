module Main where

import Lib
import Options.Applicative
import Data.Time.Clock
import Data.Time.Format
import System.FilePath

-- TODO
-- Extract out separator to args
-- specify date format with args

data AppArgs = AppArgs {
    file :: FilePath
} deriving (Show)

argsParser :: Parser AppArgs
argsParser = AppArgs
      <$> strArgument
          ( metavar "TARGET"
         <> help "Target for the greeting" )

main :: IO ()
main = app =<< execParser opts
  where
    opts = info (argsParser <**> helper)
      ( fullDesc
     <> progDesc "Print a greeting for TARGET"
     <> header "hello - a test for optparse-applicative" )


getTimeString :: UTCTime -> String
getTimeString = formatTime defaultTimeLocale "%d_%m_%y"

setDateOnFile :: UTCTime -> FilePath -> FilePath
setDateOnFile time filePath = replaceBaseName filePath newName
    where 
        baseName = takeBaseName filePath
        newName = getTimeString time <> "_" <> baseName


-- TODO - Handle Failure?
app :: AppArgs -> IO ()
app (AppArgs(filePath)) = do
    time <- getCurrentTime
    let datedFile = setDateOnFile time filePath
    writeFile datedFile "" -- TODO Maybe create directories if need be
