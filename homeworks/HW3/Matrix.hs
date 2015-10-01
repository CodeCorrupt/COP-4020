module Matrix (Matrix, fillWith, fromRule, numRows, numColumns, 
               at, mtranspose, mmap, add, mult) 
where

-- newtype is like "data", but has some efficiency advantages
newtype Matrix a = Mat ((Int,Int),(Int,Int) -> a)

fillWith   :: (Int,Int) -> a -> (Matrix a)
fromRule   :: (Int,Int) -> ((Int,Int) -> a) -> (Matrix a)
numRows    :: (Matrix a) -> Int
numColumns :: (Matrix a) -> Int
at         :: (Matrix a) -> (Int, Int) -> a
mtranspose :: (Matrix a) -> (Matrix a)
mmap       :: (a -> b) -> (Matrix a) -> (Matrix b)
add        :: Num a => (Matrix a) -> (Matrix a) -> (Matrix a)
mult       :: Num a => (Matrix a) -> (Matrix a) -> (Matrix a)

-- Without changing what is above, implement the above functions.




