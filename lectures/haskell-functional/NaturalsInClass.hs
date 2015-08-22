-- $Id: Naturals.hs,v 1.2 2013/09/15 13:57:56 leavens Exp leavens $
module NaturalsInClass where

import Nat

toInteger' :: Nat -> Integer
toInteger' Zero = 0
toInteger' (Succ n) = 1 + (toInteger' n)

fromInteger' :: Integer -> Nat
fromInteger' i = if i == 0
                 then Zero
                 else (Succ (fromInteger' (i-1)))
                
equal :: Nat -> Nat -> Bool
equal Zero Zero = True
equal (Succ n) (Succ m) = equal n m
equal _ _ = False


plus :: Nat -> Nat -> Nat
Zero `plus` m = m
(Succ n) `plus` m = (Succ (n `plus` m))

mult :: Nat -> Nat -> Nat
Zero `mult` m = Zero
(Succ n) `mult` m =  m `plus` (n `mult` m)

lessOrEqual :: Nat -> Nat -> Bool
Zero `lessOrEqual` _ = True
_ `lessOrEqual` Zero = False
(Succ n) `lessOrEqual` (Succ m) = (n `lessOrEqual` m)

-- exercises for the reader:
-- sub :: Nat -> Nat -> Nat

-- isZero :: Nat -> Bool

