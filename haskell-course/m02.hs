module M02 where

-- Question 1
-- Add the type signatures for the functions below and then remove the comments and try to compile.
-- (Use the types presented in the lecture.)

f1 :: Double -> Double -> Double -> Double
f1 x y z = x ** (y / z)

f2 :: Double -> Double -> Double -> Double
f2 x y z = sqrt (x / y - z)

f3 :: Bool -> Bool -> [Bool]
f3 x y = [x == True] ++ [y]

f4 :: (Eq a) => [a] -> [a] -> [a] -> Bool
f4 x y z = x == (y ++ z)

-- Question 2
-- Why should we define type signatures of functions? How can they help you? How can they help others?
{-
1. Improved Code Clarity:
Type signatures act as documentation, making the code more readable and self-explanatory. When you provide type signatures, it becomes evident what type of data the function expects as input and what type of data it returns as output.
2. Error Detection:
Type signatures help catch type-related errors early in the development process. If you accidentally pass an argument of the wrong type to a function, Haskell's type checker will raise a type error, allowing you to fix the issue before running the code.
3. Enhanced Maintainability:
When code includes type signatures, it is easier for developers to understand the intended behavior of functions and how to use them correctly. This becomes especially crucial when maintaining or updating code written by someone else or revisiting your own code after a long time.
4. Avoid Ambiguity:
In some cases, without type signatures, Haskell might infer a more general type than intended. By providing explicit type signatures, you can ensure that the function behaves exactly as you expect and avoid potential ambiguity.
5. Facilitating Code Reuse:
Type signatures enable other developers to understand how to call your functions and incorporate them into their own codebase. Knowing the types of inputs and outputs makes it easier to use your functions as building blocks in larger programs.
6. API Documentation:
Type signatures serve as part of the public interface of your functions. When you share your code as a library or expose functions to other modules, clear type signatures help users understand how to interact with your code and what to expect in return.
7. Performance Optimization:
In certain cases, the type information provided by the signatures can aid Haskell's compiler in generating more efficient code. With explicit type information, the compiler can make better decisions about optimizations.
8. Type-driven Development:
Defining type signatures can serve as a guide during the development process. It allows you to think about the data types and requirements of your functions before writing the implementation.
-}

-- Question 3
-- Are there any functions in Haskell that let you transform one type to the other? Try googling for the answer.
{-
fromIntegral: This function converts an integral (whole number) type to a more general numeric type. For example, it can convert an Int to a Double.

toInteger: This function converts a whole number type to the Integer type, which can represent arbitrarily large integers.

toRational: This function converts a fractional number type to the Rational type, which represents exact ratios of integers.

realToFrac: This function converts a real (fractional or integral) type to a Fractional type. For example, it can convert a Double to a Float.

read: The read function converts a String to a type that implements the Read typeclass. You can use it to parse values from strings.

show: The show function converts a value of a type that implements the Show typeclass to its string representation.

fromJust: This function is used to extract the value from a Maybe type. It takes a Maybe a and returns an a, assuming that the Maybe is a Just with a value. Note that using fromJust is not recommended unless you are sure the Maybe contains a value.

toMaybe: A custom function to convert a value to a Maybe type, where Just contains the value, and Nothing represents a missing or undefined value.

either: This function is used for converting the value inside an Either type to a common result type. It takes two functions as arguments, one for the Left value and the other for the Right value.
-}

-- Question 5
-- Can you also define in Haskell list of lists? Did we showed any example of that? How would you access the inner most elements?
extractList :: [[a]] -> [a]
extractList xss = concat xss

data Shape
    = Circle Double
    | Rectangle Double Double
    | Square Double

circleShape :: Shape
circleShape = Circle 5.0

rectangleShape :: Shape
rectangleShape = Rectangle 3.0 5.0

squareShape :: Shape
squareShape = Square 8.0

area :: Shape -> Double
area (Circle r) = pi * r * r
area (Rectangle a b) = a * b
area (Square s) = s * s

totalArea :: [Shape] -> Double
totalArea [] = 0
totalArea (x : xs) = area x + totalArea xs

-- Question 6: Polymorphism
-- Define a polymorphic function pairReverse that takes a pair of values and returns a new pair with the elements reversed. The function should work for pairs of any type.

pairReverse :: (a, b) -> (b, a)
pairReverse (x, y) = (y, x)
