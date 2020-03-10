module OrderTakingWorkflow where

-- from DDD FP book L641
-- model the book's example in haskell

data CustomerInfo
data ShippingAddress
data BillingAddress
data OrderLine = OrderLine Product Quantity Price
data Product
data Quantity
data Price
data AmountToBill

data Order =
    Order CustomerInfo ShippingAddress BillingAddress [OrderLine] AmountToBill
