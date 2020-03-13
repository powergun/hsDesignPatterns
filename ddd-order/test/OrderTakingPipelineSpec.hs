module OrderTakingPipelineSpec (spec) where

import Test.Hspec

import OrderTaking.Pipeline

spec = hspec $ do
    describe "" $ do
        it "" $ do
            1 `shouldBe` 1

        it "create order id" $ do
            let oid = mkOrderId "iddqd"
            orderIdToString oid `shouldBe` "iddqd"