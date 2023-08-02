module TypesAndClasses where

-- Type
-- A type is a name for a collection of related values
-- Bool -> True | False

-- Type Errors
-- Applying a function to one or more arguments of the wrong type is called a type error
-- 
-- All type errors are found at compile time, which makes programs safer and faster by removing the need for type check at run time

-- Type inference
-- Every well formed expression has a type, which can be automaticall calculated at compile time using a process

name :: String
name = "Theaveas So"

-- Basic Types
-- Bool    - logical values
-- Char    - single characters
-- String  - string of characters
-- Integer - integer numbers
-- Float   - floating point numbers

-- List Types
-- List    - a sequence of values of the [same] type
-- Tuple   - a sequence of values of [different] types

-- Function Types - a mapping from values of one type to values of another types

-- Polymorphic Funtion - if its type contains one or more type variables
-- Overloaded Function - A Polymorphic function is called [Overloaded] if its type contains one or more class constraints
