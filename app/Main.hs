module Main where

import qualified Data.Text.IO       as T
import           Data.Time.Calendar
import           Data.Time.Clock
import           LunarPhase

date :: IO (Integer, Int, Int)
date = getCurrentTime >>= return . toGregorian . utctDay

currentYear :: IO Integer
currentYear = (\(y,_,_) -> y) <$> date

currentMonth :: IO Int
currentMonth = (\(_,m,_) -> m) <$> date

currentDay :: IO Int
currentDay = (\(_,_,d) -> d) <$> date

main :: IO ()
main = do
  year  <- currentYear
  month <- currentMonth
  day   <- currentDay
  T.putStrLn $ phaseString $ calcPhase year month day
