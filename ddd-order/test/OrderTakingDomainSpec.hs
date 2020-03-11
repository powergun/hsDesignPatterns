module OrderTakingDomainSpec (spec) where

import Test.Hspec

import OrderTaking.Domain

spec :: IO ()
spec = hspec $ do
    describe "Test Contact Enquality" $ do
        it "Given Same Id, Different Addresses, Expect Equal" $ do
            let c1 = mkContact 1 "i" "j"
                c2 = mkContact 1 "a" "b"
            c1 `shouldBe` c2

    describe "Test Contact Immutablility" $ do
        it "Can not deconstruct Contact Entity" $ do
            let c1 = mkContact 1 "i" "j"
                -- won't compile
                -- (Contact _ _ a) = c1 
                -- c2 = c1 { contactId = 21 }
            1 `shouldBe` 1