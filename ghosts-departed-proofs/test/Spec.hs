import qualified DemoNamed
import qualified DemoPhantomTypes
import qualified DemoPhantomTypesRestricted

main :: IO ()
main = do
  DemoPhantomTypes.demo
  DemoPhantomTypesRestricted.demo
  DemoNamed.demo
