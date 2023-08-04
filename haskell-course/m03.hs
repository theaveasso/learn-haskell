module M03 where

-- Question 1
-- Write a function that checks if the monthly consumption of an electrical device is bigger, equal, or smaller than the maximum allowed and
-- returns a message accordingly.
-- The function has to take the hourly consumption of an electrical device, the hours of daily use, and the maximum monthly consumption allowed.
-- (Monthly usage = consumption (kW) * hours of daily use (h) * 30 days).
monthlyConsumption :: Int -> Int -> Bool
monthlyConsumption x maximumAllowed
    | monthlyUsage > maximumAllowed = "Bigger"
    | monthlyUsage < maximumAllowed = "Smaller"
    | otherwise = "Equal"
  where
    monthlyUsage = x * 30

-- Question 2
-- Prelude:
-- We use the function `show :: a -> String` to transform any type into a String.
-- So `show 3` will produce `"3"` and `show (3 > 2)` will produce `"True"`.

-- In the previous function, return the excess/savings of consumption as part of the message.
showExessSavingConsumption :: Int -> Int -> String
showExessSavingConsumption x maximumAllowed = show (monthlyUsage - maximumAllowed) where monthlyUsage = x * 30

-- Question 3
-- Write a function that takes in two numbers and returns their quotient such that it is not greater than 1.
-- Return the number as a string, and in case the divisor is 0, return a message why the division is not
-- possible. To implement this function using both guards and if-then-else statements.
quotientAsStringIfElse :: Double -> Double -> String
quotientAsStringIfElse _ 0 = "Division by zero is not possible"
quotientAsStringIfElse dividen divisor =
    if quotient <= 1
        then show quotient
        else show quotient ++ " (Quotient is greater than 1)"
  where
    quotient = dividen / divisor

-- Question 4
-- Write a function that takes in two numbers and calculates the sum of square roots for the product and quotient
-- of those numbers. Write the function such that you use a where block inside a let expression and a
-- let expression inside a where block.
sumOfSquareRootsWhereLet :: Double -> Double -> Double
sumOfSquareRootsWhereLet x y =
    let
        productRoot = sqrt (x * y)
        quotientRoot = sqrt (x / y)
     in
        productRoot + quotientRoot
