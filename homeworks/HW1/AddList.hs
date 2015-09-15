-- Problem 2:
----------
--
--This problem asks you to write a function in three different ways.
--
--(a) Write the function
--
--  add_list_comprehension :: Integer -> [Integer] -> [Integer]
--
--  that adds the first argument to each element of the second argument
--  and returns the resulting list. You have to use a list comprehension.
--
--  (b) Write the function
--
--    add_list_recursion :: :: Integer -> [Integer] -> [Integer]
--
--    that adds the first argument to each element of the second argument
--    and returns the resulting list. You have to use recursion.
--
--    (c) Write the function
--
--      add_list_map :: Integer -> [Integer] -> [Integer]
--
--      that adds the first argument to each element of the second argument
--      and returns the resulting list. You have to use the Haskell
--      built-in function map.
--
--      Save your solutions in the file AddList and make sure
--      that it starts with the module declaration:
--
--      module AddList where
--
--      You can test your solutions using AddListTests.hs.

module AddList where
-- add_list_comprehension :: Integer -> [Integer] -> [Integer]
add_list_comprehension a xs = [x+a | x <- xs]

-- add_list_recursion :: Integer -> [Integer] -> [Integer]
add_list_recursion _ [] = []
add_list_recursion a (x:xs) = a+x:add_list_comprehension a xs

-- add_list_map :: Integer -> [Integer] -> [Integer]
add_list_map a xs = map (a +) xs
