--Problem 1:
------------
--
--Implement the function
--
--  average :: Fractional a => [a] -> a
--
--  that takes a list of numbers [x1, x2, ... xn] and
--  returns their average (arithmetic mean), i.e.,
--  the value computed according to the formula:
--
--    (x1 + x2 + ... + xn) / n
--
--    Your implementation has to be *tail recursive*.  To do that you have
--    to complete the implementation of the second case of the function
--    average_iter in the file AverageTailRecursive.hs.
--
--    Test your solution with AverageTailRecursiveTests.hs.
--

module AverageTailRecursive where

average :: Fractional a => [a] -> a

average []     = error "Empty list"
average (x:xs) = average_iter xs (x, 1)  

average_iter :: Fractional a => [a] -> (a, a) -> a

-- first case - Empty set
average_iter []     (sum, len) = sum / len

-- second case - More in set
average_iter (x:xs) (sum, len) = average_iter xs ((sum+x), (len+1))
