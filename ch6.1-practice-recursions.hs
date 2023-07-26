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

-- Problems: define a function that drops a given number of elements from the start of a list
drop' :: Int -> [a] -> [a]
-- drop' 0 []     = []
-- drop' n []     = []
-- drop' 0 (x:xs) = x : xs
-- drop' n (x:xs) = drop (n-1) xs
drop' 0 xs = xs
drop' _ [] = []
drop' n (_: xs) = drop (n-1) xs

-- Problem: define a function that removes the last element from a non-empty list
dropLast :: [a] -> [a]
-- dropLast (x:xs)
--   | null xs   = []
--   | otherwise = x : dropLast xs
dropLast [_] = []
dropLast (x:xs) = x : dropLast xs
