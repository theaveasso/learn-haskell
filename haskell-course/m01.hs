module M01 where

-- Question 1
-- Write a multiline comment below.
{-
 - This is multilines comment
-}

-- Question 2
-- Define a function that takes a value and multiplies it by 3.
timeThree :: Int -> Int
timeThree x = x * 3

-- Question 3
-- Define a function that calculates the area of a circle.
area :: Double -> Double
area r = pi * r * r

-- Question 4
-- Define a function that calculates the volume of a cylinder by composing the previous function together with the height of the cylinder.
cylinderV :: Double -> Double -> Double
cylinderV r h = h * area r

-- Question 5
-- Define a function that takes the height and radius of a cylinder and checks if the volume is greater than or equal to 42.
isBiggerCylinder :: Double -> Double -> Bool
isBiggerCylinder r h = cylinderV r h > 42
