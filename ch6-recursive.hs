module Recursive where

-- Expressions are [evaluated] by a stepwise process of applying functions to their arguments

-- Recursive functions
-- Functions can also be defined in terms of themselves.
fac :: Int -> Int
fac 0 = 1
fac n = n * fac (n - 1)

-- Why recursion Usefull
-- [Simpler] to define in terms of other functions
-- Many functions can [naturally] be defined in terms of themselves
-- Properties of functions defined using recurion can be proved using the simple but powerfull mathematical technique of [induction]

-- Recursion on Lists
product' :: Num a => [a] -> a
product' []     = 1
product' (n:ns) = n * product' ns

length' :: [a] -> Int
length' []    = 0
length (_:xs) = 1 + length' xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

drop' :: Int -> [a] -> [a]
drop' 0 xs = xs
drop' _ [] = []
drop' n (_:xs) = drop' (n-1) xs

-- Quicksort
-- The empty list is already sorted;
-- Non-empty lists can be sorted by sorting the tail values <= the head, sorting the tail values > the head and then appending the resulting lists on either side of the head value.

quickSort :: Ord a => [a] -> [a]
quickSort     [] = []
quickSort (x:xs) = quickSort ls ++ [x] ++ quickSort us
                    where 
                      ls = [a | a <- xs, a <= x]
                      us = [b | b <- xs, b >  x]
