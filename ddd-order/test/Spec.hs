import qualified OrderTakingDomainSpec
import qualified OrderTakingPipelineSpec

main :: IO ()
main = do
    OrderTakingDomainSpec.spec
    OrderTakingPipelineSpec.spec
