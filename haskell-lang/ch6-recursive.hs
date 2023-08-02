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
length' (_:xs) = 1 + length' xs

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

-- Excercises
-- and 
and' :: [Bool] -> Bool
and' []     = True
and' (b:bs) = b && and' bs  

-- concat
concat' :: [[a]] -> [a]
concat' []       = []
concat' (xs:xss) = xs ++ concat' xss

-- replicate
replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n a = a : replicate (n-1) a

-- (!!)
-- indexing :: [a] -> Int -> a
-- (x:xs) indexing 0 = x
-- (x:xs) indexing n = xs indexing (n -1)

-- insertion sort
insert :: Int -> [Int] -> [Int]
insert x [] = [x]
insert x (y:ys) = if x <= y 
                    then x : y : ys 
                    else y : insert x ys

iSort :: [Int] -> [Int]
iSort []     = []
iSort (x:xs) = insert x (iSort xs)

-- merge sort
halve :: [a] -> ([a], [a])
halve xs = ((take s xs), (drop s xs)) 
            where s = (length' xs) `div` 2

merge :: [Int] -> [Int] -> [Int]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) = if x <= y 
                        then x : merge xs (y:ys)
                        else y : merge ys (x:xs)

mSort :: [Int] -> [Int]
mSort []            = []
mSort [x]           = [x]
mSort xs = merge (mSort ys) (mSort zs) where (ys, zs) = halve xs 
