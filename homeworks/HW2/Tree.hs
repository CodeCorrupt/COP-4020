--Problem 3:
------------
--
--Given the data structure
--
--  data Tree a = Nil | Node a (Tree a) (Tree a) 
--                  deriving (Eq, Show)
--
--                  implement the function
--
--                    stratify :: Tree a -> [a]
--
--                    that lists the elements of the tree in the following order:
--                    - first, all elements at depth 1 from left to right,
--                    - second, all elements at depth 2 from left to right,
--                    - etc.
--
--                    Put your solution in the file Tree.hs and test
--                    it with TreeTests.hs.

module Tree where

data Tree a = Nil | Node a (Tree a) (Tree a) 
                deriving (Eq, Show)

depth :: Tree a -> Integer
depth Nil            = 0
depth (Node n t1 t2) = 1 + max (depth t1) (depth t2)

-- collapses a tree into a list by visiting 
-- the elements of the tree 'inorder'

collapse :: Tree a -> [a]
collapse Nil            = []
collapse (Node x t1 t2) = collapse t1 ++ [x] ++ collapse t2

-- stratifies a tree into a list by visiting
-- all elements at depth 1, then all elements 2, etc.

stratify :: Tree a -> [a]
-- Put your implementation here
-- I found a website with an example. 
--          http://aryweb.nl/2013/10/28/haskell-tree-traversal/
-- I don't see any other way to do it so I copied their
--  implimentation since it made sense to me.
stratify Nil            = []
stratify tree = tbf [tree]
    where
        tbf [] = []
        tbf xs = map nodeValue xs ++ tbf (concat (map leftAndRightNodes xs))
        nodeValue (Node a _ _) = a
        leftAndRightNodes (Node _ Nil Nil) = []
        leftAndRightNodes (Node _ Nil b)     = [b]
        leftAndRightNodes (Node _ a Nil)     = [a]
        leftAndRightNodes (Node _ a b)         = [a,b]
