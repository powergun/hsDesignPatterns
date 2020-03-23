
I've written up a first attempt at a mocking framework for our codebase. You can find a PR to it here: https://github.com/DACH-NY/solution-spider/pull/6072
Its API mock call design is based heavily on mockazo (https://hackage.haskell.org/package/mockazo), which itself is a derivative of monad-mock. The matcher API was a nice suggestion from Raph apparently based on the Java Hamcrest library.
I'm keen to get feedback on the API design from those interested.
in it, there's an example use module in DA.ASX.Test.Mock.Example. (edited) 
HackageHackage
mockazo: Mock records of functions easily
Install via cabal install mockazo.

