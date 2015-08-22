-- $Id: Nat.hs,v 1.1 2013/09/15 13:57:56 leavens Exp leavens $
module Nat where
data Nat = Zero | Succ Nat 
            deriving (Show, Eq)
