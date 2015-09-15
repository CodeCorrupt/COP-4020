-- Problem 4:
----------
--
--Write the function
--
--  unique :: (Eq a) => [a] -> [a]
--
--  that takes a list and removes all but the
--  first occurrence of every duplicated element
--  of the list.
--
--  You can test your solution with UniqueTests.hs.

module Unique where
--  unique :: (Eq a) => [a] -> [a]
unique [] = []
unique (x:xs) = x:(unique (remove x xs))

remove r [] = []
remove r (y:ys) = 
    if r == y
    then remove r ys
    else y:(remove r ys)
