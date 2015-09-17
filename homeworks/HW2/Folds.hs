--Problem 4:
------------
--
--Implement two functions: a function 'count' given by
--
--  count :: Eq a => a -> [a] -> Integer
--
--  that numbers the occurrences of an element in a list, and a (re)implementation of 'elem':
--
--    elem2 :: Eq a => a -> [a] -> Bool
--
--    Use a different Prelude fold function in each: one a left fold, and one a right fold.
--    (If you swap them, the test will hang.)  The rule of thumb is that the left,
--    or tail-recursive, fold is more effcient if a list needs to be fully examined.
--    If it doesn't, the right fold is better, again for efficiency.
--
--    Technically, the non-strict fold could do the job in both cases here,
--    but for full points you should use a left fold.
--
--    Put your solutions in Folds.hs and test them with FoldsTests.hs.

module Folds where

count :: Eq a => a -> [a] -> Integer
-- Put your implementation here

elem2 :: Eq a => a -> [a] -> Bool
-- Put your implementation here
