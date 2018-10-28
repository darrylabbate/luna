import           LunarPhase
import           Test.Hspec

main :: IO ()
main = hspec $ do
  describe "calcPhase" $ do
    it "January 5th, 2000  ==> Waning Crescent" $ do
      calcPhase 2000 1 5 `shouldBe` WaningCrescent

    it "January 6th, 2000  ==> New" $ do
      calcPhase 2000 1 6 `shouldBe` New

    it "January 7th, 2000  ==> Waxing Crescent" $ do
      calcPhase 2000 1 7 `shouldBe` WaxingCrescent

    it "April 28th, 2012   ==> Waxing Crescent" $ do
      calcPhase 2012 4 28 `shouldBe` WaxingCrescent

    it "April 29th, 2012   ==> First Quarter" $ do
      calcPhase 2012 4 29 `shouldBe` FirstQuarter

    it "April 30th, 2012   ==> Waxing Gibbous" $ do
      calcPhase 2012 4 30 `shouldBe` WaxingGibbous

    it "April 27th, 1989   ==> Waning Gibbous" $ do
      calcPhase 1989 4 27 `shouldBe` WaningGibbous

    it "April 28th, 1989   ==> Third Quarter" $ do
      calcPhase 1989 4 28 `shouldBe` ThirdQuarter

    it "April 29th, 1989   ==> Waning Crescent" $ do
      calcPhase 1989 4 29 `shouldBe` WaningCrescent

    it "October 23rd, 2018 ==> Waxing Gibbous" $ do
      calcPhase 2018 10 23 `shouldBe` WaxingGibbous

    it "October 24th, 2018 ==> Full" $ do
      calcPhase 2018 10 24 `shouldBe` Full

    it "October 25th, 2018 ==> Waning Gibbous" $ do
      calcPhase 2018 10 25 `shouldBe` WaningGibbous
