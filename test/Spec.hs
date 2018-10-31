import           LunarPhase
import           Test.Hspec

main :: IO ()
main = hspec $ do
  describe "calcPhase" $ do
    it "January   5 2000 ==> Waning Crescent" $ do
      calcPhase 2000 1 5 `shouldBe` WaningCrescent

    it "January   6 2000 ==> New" $ do
      calcPhase 2000 1 6 `shouldBe` New

    it "January   7 2000 ==> Waxing Crescent" $ do
      calcPhase 2000 1 7 `shouldBe` WaxingCrescent

    it "April    28 2012 ==> Waxing Crescent" $ do
      calcPhase 2012 4 28 `shouldBe` WaxingCrescent

    it "April    29 2012 ==> First Quarter" $ do
      calcPhase 2012 4 29 `shouldBe` FirstQuarter

    it "April    30 2012 ==> Waxing Gibbous" $ do
      calcPhase 2012 4 30 `shouldBe` WaxingGibbous

    it "April    27 1989 ==> Waning Gibbous" $ do
      calcPhase 1989 4 27 `shouldBe` WaningGibbous

    it "April    28 1989 ==> Third Quarter" $ do
      calcPhase 1989 4 28 `shouldBe` ThirdQuarter

    it "April    29 1989 ==> Waning Crescent" $ do
      calcPhase 1989 4 29 `shouldBe` WaningCrescent

    it "October  23 2018 ==> Waxing Gibbous" $ do
      calcPhase 2018 10 23 `shouldBe` WaxingGibbous

    it "October  24 2018 ==> Full" $ do
      calcPhase 2018 10 24 `shouldBe` Full

    it "October  25 2018 ==> Waning Gibbous" $ do
      calcPhase 2018 10 25 `shouldBe` WaningGibbous

    it "October  30 2018 ==> Waning Gibbous" $ do
      calcPhase 2018 10 30 `shouldBe` WaningGibbous

    it "October  31 2018 ==> Third Quarter" $ do
      calcPhase 2018 10 31 `shouldBe` ThirdQuarter

    it "November  1 2018 ==> Waning Crescent" $ do
      calcPhase 2018 11 1 `shouldBe` WaningCrescent
