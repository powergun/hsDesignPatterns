module OrderTakingWorkflowSpec (spec) where

import Test.Hspec

import OrderTakingWorkflow (Contact(..))

spec :: IO ()
spec = hspec $ do
    describe "Test Contact Enquality" $ do
        it "Given Same Id, Different Addresses, Expect Equal" $ do
            let c1 = Contact 1 "i" "j"
                c2 = Contact 1 "a" "b"
            c1 `shouldBe` c2