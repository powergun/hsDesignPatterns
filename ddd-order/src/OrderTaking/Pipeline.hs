module OrderTaking.Pipeline where

import Data.Time.Clock (UTCTime)

data UnvalidatedOrder = UnvalidatedOrder
    { unOrderId :: String 
    , unCustomerInfo :: UnvalidatedCustomer
    , unShippingaddress :: UnvalidatedAddress 
    }

data UnvalidatedCustomer = UnvalidatedCustomer 
    { unName :: String
    , unEmail :: String
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

-- Order Life Cycle
data ValidatedOrderLine
data ValidatedOrder = ValidatedOrder
    { orderId :: String 
    , customerInfo :: CustomerInfo
    , shippingAddress :: String
    , billingAddress :: String
    , orderLines :: [ValidatedOrderLine]
    }
data CustomerInfo
data PricedOrderLine
data PricedOrder

data Order = Unvalidated UnvalidatedOrder
           | Validated ValidatedOrder
           | Priced PricedOrder

-- Internal Steps
data ProductCode
checkProductCodeExists :: ProductCode -> Bool
checkProductCodeExists = undefined

data AddressValidationError
data CheckedAddress
checkAddressExists :: UnvalidatedAddress
                   -> AsyncResult AddressValidationError CheckedAddress
checkAddressExists = undefined

data ValidationError
validateOrder :: (ProductCode -> Bool)
              -> (UnvalidatedAddress -> AsyncResult AddressValidationError CheckedAddress)
              -> AsyncResult [ValidationError] ValidatedOrder
validateOrder = undefined

newtype Price = Price Int
data PricingError
getProductPrice :: ProductCode -> Price
getProductPrice = undefined
priceOrder :: (ProductCode -> Price)
           -> ValidatedOrder
           -> Either PricingError PricedOrder
priceOrder = undefined
