-- $Id$
module Fact where
-- fact :: Int -> Int  -- doesn't work properly
fact :: Integer -> Integer -- this works
fact n = product [1 .. n]
