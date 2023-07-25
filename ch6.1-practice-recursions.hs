module PRecurions where

-- 1 -> Name the function.
-- 2 -> Write down its types
-- 3 -> Enumerate the cases 
-- 4 -> Define the simeple case
-- 5 -> List the [ingredients]
-- 6 -> Define the other case
-- 7 -> Think about the result

-- Problems: define a function that calculates the sum of a list of numbers
sum' :: Num a => [a] ->  a
-- sum' []     = 0
-- sum' (x:xs) = x + sum' xs
sum' = foldr (+) 0
