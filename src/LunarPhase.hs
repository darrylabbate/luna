module LunarPhase where

import           Data.Fixed
import           Data.Time
import           Data.Time.Calendar.Julian

data Phase = New
           | WaxingCrescent
           | FirstQuarter
           | WaxingGibbous
           | Full
           | WaningGibbous
           | ThirdQuarter
           | WaningCrescent

moonRevolution = 29.530588853

calcPhase :: Integer -> Int -> Int -> Phase
calcPhase y m d = phase . flip mod' moonRevolution . fromIntegral $
                  diffDays (fromJulian y m d) (fromJulian 2000 1 6) where
                  phase x | x < 1.84566  = New
                          | x < 5.53699  = WaxingCrescent
                          | x < 9.22831  = FirstQuarter
                          | x < 12.91963 = WaxingGibbous
                          | x < 16.61096 = Full
                          | x < 20.30228 = WaningGibbous
                          | x < 23.99361 = ThirdQuarter
                          | x < 27.68493 = WaningCrescent
                          | otherwise    = New

phaseString :: Phase -> String
phaseString New            = "New 🌑"
phaseString WaxingCrescent = "Waxing Crescent 🌒"
phaseString FirstQuarter   = "First Quarter 🌓"
phaseString WaxingGibbous  = "Waxing Gibbous 🌔"
phaseString Full           = "Full 🌕"
phaseString WaningGibbous  = "Waning Gibbous 🌖"
phaseString ThirdQuarter   = "Third Quarter 🌗"
phaseString WaningCrescent = "Waning Crescent 🌘"
