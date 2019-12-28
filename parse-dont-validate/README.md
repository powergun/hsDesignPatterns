# Parse! Dont validate

source: <https://lexi-lambda.github.io/blog/2019/11/05/parse-don-t-validate/>

> Parsing avoids this problem by stratifying the program into two phases—parsing and execution—where failure due to invalid input can only happen in the first phase. The set of remaining failure modes during execution is minimal by comparison, and they can be handled with the tender care they require.

**see also hsFP/applicative/Validation for a practical example of this
"two-phases" processing**

> Use a data structure that makes illegal states unrepresentable.
> Push the burden of proof upward as far as possible, but no further.
> In other words, write functions on the data representation you wish you had, not the data representation you are given. The design process then becomes an exercise in bridging the gap, often by working from both ends until they meet somewhere in the middle
> Use abstract datatypes to make validators “look like” parsers.

In that case, use an abstract newtype with a smart constructor to
“fake” a parser from a validator.
