module OrderTaking.Domain ( Contact, mkContact ) where

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