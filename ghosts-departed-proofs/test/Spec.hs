import qualified DemoNamed
import qualified DemoPhantomTypes
import qualified DemoPhantomTypesRestricted
import qualified DemoTypeOperators

main :: IO ()
main = do
  DemoPhantomTypes.demo
  DemoPhantomTypesRestricted.demo
  DemoNamed.demo
  DemoTypeOperators.demo
