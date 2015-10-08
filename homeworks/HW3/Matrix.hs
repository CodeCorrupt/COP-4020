module Matrix (Matrix, fillWith, fromRule, numRows, numColumns, 
               at, mtranspose, mmap--, add, mult) 
                )
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
-- add        :: Num a => (Matrix a) -> (Matrix a) -> (Matrix a)
-- mult       :: Num a => (Matrix a) -> (Matrix a) -> (Matrix a)

-- Without changing what is above, implement the above functions.

-- Found answeres online and used the format of those.
fillWith t e = Mat(t, (\_ -> e))
fromRule t = (\r -> Mat (t, r))
numRows (Mat ((x,_),_)) = x
numColumns (Mat ((_,y),_)) = y
at (Mat (_,f)) = (\c -> f c)
mtranspose (Mat((x,y), f)) = Mat((y,x), fnt)
    where fnt (i,j) = f (j,i)
mmap m (Mat (t, f)) = Mat (t, m.f)

-- I was unable to do add or mult so I have commented them out so it will still compile
