module Matrix (Matrix, fillWith, fromRule, numRows, numColumns, 
               at, mtranspose, mmap, add--, mult) 
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
add        :: (Num a) => (Matrix a) -> (Matrix a) -> (Matrix a)
-- mult       :: Num a => (Matrix a) -> (Matrix a) -> (Matrix a)

-- Found answeres online and used the format of those.
fillWith t e = Mat(t, (\_ -> e))
fromRule t = (\r -> Mat (t, r))
numRows (Mat ((x,_),_)) = x
numColumns (Mat ((_,y),_)) = y
at (Mat (_,f)) = (\c -> f c)
mtranspose (Mat((x,y), f)) = Mat((y,x), fnt)
    where fnt (i,j) = f (j,i)
mmap m (Mat (t, f)) = Mat (t, m.f)

matchShape :: (Matrix a) -> (Matrix a) -> Bool
matchShape a b = (numRows a == numRows b 
        && numColumns a == numColumns b)
    
add a b =
    if matchShape a b
    then fromRule (numRows a, numColumns b) (\val -> (+) (at a val) (at b val))
    else error "Error: Size does not match"

-- I was unable to do mult so I have commented them out so it will still compile
