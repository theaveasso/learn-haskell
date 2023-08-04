module M04 where

-- Question 1
-- Lets say you have the nested values defined below. How would you get the value of 4 by using only pattern matching in a function?

nested :: [([Int], [Int])]
nested = [([1, 2], [3, 4]), ([5, 6], [7, 8])]

getFourthValue :: [([Int], [Int])] -> String
getFourthValue [_, (_, x)] = show x

-- Question 2
-- Write a function that takes a list of elements of any type and, if the list has 3 or more elements, it removes them. Else, it does nothing. Do it two times, one with multiple function definitions and one with case expressions.
removeMoreThanThreeEle :: [a] -> Maybe [a]
removeMoreThanThreeEle xs = if length xs > 3 then Just [] else Nothing

caseRemoveMoreThanThreeEle :: [a] -> Maybe [a]
caseRemoveMoreThanThreeEle xs = case length xs > 3 of
    True -> Just []
    False -> Nothing

-- Question 3
-- Create a function that takes a 3-element tuple (all of type Integer) and adds them together
addThreeElement :: a -> b -> c -> (a, b, c)
addThreeElement x y z = (x, y, z)

-- Question 4
-- Implement a function that returns True if a list is empty and False otherwise.
isEmpty :: [a] -> Bool
isEmpty xs = null xs

-- Question 5
-- Write the implementation of the tail function using pattern matching. But, instead of failing if the list is empty, return an empty list.
safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (x : xs) = Just xs

-- Question 6
-- write a case expression wrapped in a function that takes an Int and adds one if it's even. Otherwise does nothing.
-- (Use the `even` function to check if the number is even.)
addOneIfEven x = case even x of
    True -> x + 1
    False -> x
