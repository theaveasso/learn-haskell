module Recursive where

-- Expressions are [evaluated] by a stepwise process of applying functions to their arguments

-- Recursive functions
-- Functions can also be defined in terms of themselves.
fac :: Int -> Int
fac 0 = 1
fac n = n * fac (n - 1)

