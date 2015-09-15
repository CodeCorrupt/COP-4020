-- Problem 1:
----------
--
--Write the function
--
--  average3 :: (Double,Double,Double) -> Double
--
--  which takes a triple of Doubles, (x,y,z), and returns a Double that is
--  the average (i.e., the arithmetic mean) of x, y, and z.
--
--  Save your solution inside the file Average3.hs and
--  make sure that your file starts with the module declaration:
--
--  module Average3 where
--
--  You can test your solution with Average3Tests.hs.

module Average3 where
-- average3 :: (Double,Double,Double) -> Double
average3 (x,y,z) = (x+y+z)/3.0
