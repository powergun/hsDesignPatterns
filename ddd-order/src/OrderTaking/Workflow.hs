module OrderTaking.Workflow where

-- see: https://jeltsch.wordpress.com/2012/03/20/natural-numbers-in-haskell/
-- source: http://hackage.haskell.org/package/natural-numbers
-- import           Data.Natural

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

-- DDD FP book L728

data WidgetCode = WidgetCode String  -- data ctor is private, same as below
makeWidgetCode :: [Char] -> WidgetCode
makeWidgetCode s@('W':x:y:z:w) = WidgetCode s
makeWidgetCode _               = undefined

data GizmoCode = GizmoCode String
makeGizmoCode s@('G':x:y:z:w) = GizmoCode s
makeGizmoCode _               = undefined

data ProductCode = PW WidgetCode
                 | PG GizmoCode

-- another to enforce the value range restriction on the type level is
-- using a smart contructor (like the makeXXX functions above)
-- see also: https://stackoverflow.com/questions/8510570/restricting-values-in-type-constructors
-- EDIT: I need to use smart ctor anyway to follow the book examples
data OrderQuantity = UnitQuantity Int
                   | KilogramQuantity Float
                   deriving (Eq, Ord, Show)
makeUnitQuantity x = if (x >= 1 && x <= 1000)
                     then UnitQuantity x
                     else undefined
makeKilogramQuantity x = if (x >= 0.05 && x <=100.0)
                         then KilogramQuantity x
                         else undefined

-- DDD FP Book L1981

data UnvalidatedOrder
data AcknowledgementSent
data OrderPlaced
data BillableOrderPlaced

data PlaceOrderEvents = PlaceOrderEvents
    { acknowledgementSent :: AcknowledgementSent
    , orderPlaced :: OrderPlaced
    , billableOrderPlaced :: BillableOrderPlaced
    }

placeOlder :: UnvalidatedOrder -> PlaceOrderEvents
placeOlder = undefined