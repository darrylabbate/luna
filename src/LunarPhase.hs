{-# LANGUAGE OverloadedStrings #-}

module LunarPhase where

import           Data.Fixed
import           Data.Text
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
           deriving (Eq, Show)

moonRevolution = 29.530588853

calcPhase :: Integer -> Int -> Int -> Phase
calcPhase y m d = phase . flip mod' moonRevolution . fromIntegral $
                  diffDays (fromJulian y m d) (fromJulian 2000 1 6) where
                  phase x | x < 0.94566  = New
                          | x < 7.53699  = WaxingCrescent
                          | x < 9.22831  = FirstQuarter
                          | x < 13.91963 = WaxingGibbous
                          | x < 15.61096 = Full
                          | x < 21.80228 = WaningGibbous
                          | x < 22.59361 = ThirdQuarter
                          | x < 28.68493 = WaningCrescent
                          | otherwise    = New

phaseString :: Phase -> Text
phaseString New            = "New 🌑"
phaseString WaxingCrescent = "Waxing Crescent 🌒"
phaseString FirstQuarter   = "First Quarter 🌓"
phaseString WaxingGibbous  = "Waxing Gibbous 🌔"
phaseString Full           = "Full 🌕"
phaseString WaningGibbous  = "Waning Gibbous 🌖"
phaseString ThirdQuarter   = "Third Quarter 🌗"
phaseString WaningCrescent = "Waning Crescent 🌘"
