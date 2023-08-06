module M05 where

import qualified Data.Map as Map

-- Higher order functions
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

complexFunc1 :: Int -> Int
complexFunc1 x = x * x

func1 :: Int -> Int
func1 x = applyTwice complexFunc1 x

-- filter
filterOdd :: (Integral a) => [a] -> [a]
filterOdd xs = filter odd xs

nameWithA :: [String] -> [String]
nameWithA xs = filter isContain xs
  where
    isContain name = 'a' `elem` name

-- any
largerThan :: (Ord a) => a -> a -> Bool
largerThan x y = x < y

anyLargerThan :: (Ord a, Integral a) => [a] -> a -> Bool
anyLargerThan xs x = any (largerThan x) xs

-- lambda function
-- \x y -> x + y

nameWithA' :: [String] -> [String]
nameWithA' xs = filter (\x -> 'a' `elem` x) xs

-- Precedence
-- Associativity (left -> right) || (right -> left)

-- Curried functions
add3 :: Int -> (Int -> (Int -> Int))
add3 x y = \z -> x + y + z

-- add3 :: Int -> (Int -> (Int -> Int))
-- add3 x = \y -> (\z -> x + y + z)
--
-- add3 :: Int -> (Int -> (Int -> Int))
-- add3 = \x -> (\y -> (\z -> x + y + z))

-- Partial application
createEmail :: String -> String -> String -> String
createEmail domain name lastname = concat [name, ".", lastname, "@", domain]

createEmailTeckel :: String -> String -> String
createEmailTeckel = createEmail "teckel-owners.com"

createEmailSCL :: String -> String -> String
createEmailSCL = createEmail "secret-cardano-lovers.com"

-- Apply composing
-- The function application $ operator
complicateF :: [Int] -> Bool
complicateF xs = any even (filter (> 25) (tail (take 10 xs)))

-- Create a higher-order function that takes 3 parameters: A function and the two parameters that that function takes, and flips the order of the parameters.
-- For example this: `(/) 6 2` returns `3`. But this: `flip' (/) 6 2` returns `0.3333333333`
hFlip :: (a -> b -> c) -> b -> a -> c
hFlip f x y = f y x

-- Create the `uncurry'` function that converts a curried function to a function on pairs. So this: `(+) 1 2` that returns `3` can be written as
-- `uncurry' (+) (1,2)` (with the two different arguments inside a pair).

hUncurry :: (a -> b -> c) -> (a, b) -> c
hUncurry f (x, y) = f x y

-- Create the `curry'` function that converts an uncurried function to a curried function. So this: `fst (1,2)` that returns `1` can be written as
-- `curry' fst 1 2` (with the tuple converted into two different arguments).
hToCurry :: ((a, b) -> c) -> (a -> b -> c)
hToCurry f x y = f (x, y)

-- Use higher-order functions, partial application, and point-free style to create a function that checks if a word has an uppercase letter.
-- Start with using just higher-order functions and build from there.
hIfAnyUpperCase :: String -> Bool
-- hIfAnyUpperCase xs = any (\c -> c `elem` ['A' .. 'Z']) xs
-- hIfAnyUpperCase xs = any (`elem` ['A' .. 'Z']) xs
hIfAnyUpperCase = any (`elem` ['A' .. 'Z'])

-- Create the `count` function that takes a team ("Red", "Blue", or "Green") and returns the amount of votes the team has inside `votes`.

votes :: [String]
votes = ["Red", "Blue", "Green", "Blue", "Blue", "Red"]

hCountVotes :: [String] -> Map.Map String Int
hCountVotes xs = Map.fromListWith (+) [(team, 1) | team <- xs]

-- Create a one-line function that filters `cars` by brand and then checks if there are any left.
cars :: [(String, Int)]
cars = [("Toyota", 0), ("Nissan", 3), ("Ford", 1)]

hIfAnyCarsLeft :: [(String, Int)] -> String -> Bool
hIfAnyCarsLeft xs brand = any (\(b, n) -> b == brand && n > 0) xs

-- simple function
square' :: (Num a) => a -> a
square' x = x * x

squareInList :: (Num a) => [a] -> [a]
squareInList xs = map square' xs

sumEvenSquare :: [Int] -> Int
sumEvenSquare xs = sum (map (\x -> x * x) (filter even xs))
