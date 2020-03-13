module OrderTaking.Pipeline where

import Data.Time.Clock (UTCTime)

data UnvalidatedOrder = UnvalidatedOrder
    { orderId :: String 
    , customerInfo :: UnvalidatedCustomer
    , shippingaddress :: UnvalidatedAddress 
    }

data UnvalidatedCustomer = UnvalidatedCustomer 
    { name :: String
    , email :: String
    }

data UnvalidatedAddress = UnvalidatedAddress String

data Command a = Command 
    { data' :: a
    , timestamp :: UTCTime
    , userId :: String
    }

type PlaceOrderCommand = Command UnvalidatedOrder

-- Public API
-- Success output of PlaceOrder workflow
data PlaceOrderEvent = OrderPlaced
                     | BillableOrderPlaced
                     | OrderAcknowledgementSent

-- Failure output of PlaceOrder workflow
data PlaceOrderError

-- 
type AsyncResult a b = Either a b
placeOrderWorkflow :: PlaceOrderCommand -> AsyncResult PlaceOrderError [PlaceOrderEvent]
placeOrderWorkflow = undefined

