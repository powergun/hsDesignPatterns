module OrderTaking.Domain ( Contact, mkContact ) where

-- from DDD FP book L641 
-- model the book's example in haskell

data CustomerInfo
data ShippingAddress
data BillingAddress
data Product
data Quantity
data Price
data AmountToBill

data Order =
    Order CustomerInfo ShippingAddress BillingAddress [OrderLine] AmountToBill

data OrderLine = 
    OrderLine Product Quantity Price

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

--- DDD FP Book L2246

data Contact = Contact 
    { contactId :: Int
    , name :: String
    , address :: String
    }
    deriving (Show)

-- hide data ctor and expose a smart constructor function
-- caller can not:
-- - deconstruct contact entity 
-- - modify a field
mkContact :: Int -> String -> String -> Contact
mkContact c n a = Contact { contactId = c, name = n, address = a }

instance Eq Contact where
    (==) lhs rhs = contactId lhs == contactId rhs
