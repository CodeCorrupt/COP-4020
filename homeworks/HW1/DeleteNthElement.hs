-- Problem 3:
----------
--
--Use the Haskell operator ++ and the built-in
--functions drop and take to implement
--
--  deleteNthElement :: Int -> [a] -> [a]
--
--  that removes the element at index n in the the second argument
--  where n is the first argument.
--
--  You can test your solution with DeleteNthElementTests.hs.

module DeleteNthElement where
-- deleteNthElement :: Int -> [a] -> [a]
deleteNthElement a xs = (take (a - 1) xs) ++ (drop a xs)
