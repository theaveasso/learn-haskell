module ListComprehensions where

-- Set Comprehensions
-- In math, the [comprehensions] notion can be used to construct new sets from ole sets
-- {square x | x in [1..5]}
-- Generators
-- are used in list comprehensions to generate elements for the resulting list.
-- [ expression | pattern <- list, condition ]
squareList = [x^2 | x <- [1..5]]

pairs :: [a] -> [b] -> [(a, b)]
pairs xs ys = [(x, y) | x <- xs, y <- ys]

-- Later generator which is essentially an additional generator that depends on the previously generated values. 
-- Later generator is indented further to the right than the previous generators. This allows you to filter and generate elements based on the values that were generated by earlier generators.
pythagoreanTriples :: Int -> [(Int, Int, Int)]
pythagoreanTriples n = 
  [(a,b,c) | 
    c <- [1..n],
    a <- [1..c],
    b <- [a..c],
    a^2 + b^2 == c^2]

concat' :: [[a]] -> [a]
concat' xss = [x | xs <- xss, x <- xs]

-- Guards
-- List comprehensions can use [guards] to restrict the values produced by earlier generators
evenOnly :: Integral a => a -> [a]
evenOnly n = [x | x <- [0..n], even x]

factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

prime :: Int -> Bool
prime n = factors n == [1,n]

primeList :: Int -> [Int]
primeList n = [x | x <- [2..n], prime x]

-- The Zip Funciton
-- Maps two lists to a list of pairs of their corresponding elements
pairs' :: [a] -> [(a,a)]
pairs' xs = zip xs (tail xs)

isSorted :: Ord a => [a] -> Bool
isSorted xs = and [x <= y | (x,y) <- pairs' xs]

positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (x', i) <- zip xs [0..], x == x']

-- String Comprehensions
-- a sequence of characters enclosed in double quotes. Interanlly, however, strings are represented as list of characters
count :: Char -> String -> Int
count x xs = length [x' | x' <- xs, x == x']

sum' [] = 0
sum' (x:xs) = x + sum' xs 

-- Exercises
pyths :: Int -> [(Int, Int, Int)]
pyths n = [(a,b,c) | 
    c <- [1..n],
    a <- [1..c],
    b <- [1..a],
    a^2 + b^2 == c^2
  ]

perfect :: Int -> [Int]
perfect n = [x | x <- [2..n], sum' (tail(reverse(factors x))) == x]
perfect' n = [x | x <- [2..n], sum' (init(factors x)) == x]

sp :: [Int] -> [Int] -> Int
sp xs ys = sum [xs !! i * ys !! i | i <- [0..n-1]]
               where n = length xs
sp' xs ys = sum [x*y | (x,y) <- zip xs ys]
