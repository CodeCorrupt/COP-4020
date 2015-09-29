--Problem 2:
------------
--
--Implement the functions
--
--  zip3 :: [a] -> [b] -> [c] -> [(a,b,c)]
--
--    unzip3 :: [(a,b,c)] -> ([a], [b], [c])
--
--    that generalize the functions zip and unzip from pairs to triples.  
--    You must not use the internal Haskell implementations
--    of both functions.
--
--    Complete the implementation of both functions in the file
--    Zip3unzip3.hs and test your solution with 
--    Zip3unzip3Tests.hs.

module Zip3unzip3 where

import Prelude hiding (zip3, unzip3)

zip3 :: [a] -> [b] -> [c] -> [(a,b,c)]
-- Put your implementation here
zip3 [] [] [] = []
zip3 (a:as) [] [] = []
zip3 [] (b:bs) [] = []
zip3 [] [] (c:cs) = []
zip3 (a:as) (b:bs) [] = []
zip3 (a:as) [] (c:cs) = []
zip3 [] (b:bs) (c:cs) = []
zip3 (a:as) (b:bs) (c:cs) = (a,b,c):(zip3 as bs cs)

unzip3 :: [(a,b,c)] -> ([a], [b], [c])
-- Put your implementation here
-- From prelude source
unzip3 = foldr (\(a,b,c) ~(as,bs,cs) -> (a:as,b:bs,c:cs)) ([],[],[])
