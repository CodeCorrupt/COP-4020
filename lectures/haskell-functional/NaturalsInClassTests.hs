-- $Id: NaturalsTests.hs,v 1.2 2013/09/15 13:57:56 leavens Exp leavens $
module NaturalsInClassTests where
import Nat
import NaturalsInClass
import Testing

main :: IO()
main = dotests "$Revision: 1.2 $" tests

tests :: [TestCase Bool]
tests =
    [assertTrue ((toInteger' Zero) == 0)
    ,assertTrue ((toInteger' (Succ Zero)) == 1)
    ,assertTrue ((toInteger' (Succ (Succ (Succ (Succ (Succ Zero)))))) == 5)
    -- fromInteger'
    ,assertTrue ((fromInteger' 0) == Zero)
    ,assertTrue ((fromInteger' 4) == (Succ (Succ (Succ (Succ Zero)))))
    ,assertTrue ((toInteger' (fromInteger' 99)) == 99)
    ,assertTrue ((toInteger' ((fromInteger' 32) `plus` (fromInteger' 99))) == 131)
    ,assertTrue ((toInteger' ((fromInteger' 32) `mult` (fromInteger' 99))) == 32*99)
    -- equal
    ,assertTrue (Zero `equal` Zero)
    ,assertFalse (Zero `equal` (Succ Zero))
    ,assertFalse ((Succ (Succ Zero)) `equal` (Succ Zero))
    -- plus
    ,assertTrue ((Zero `plus` Zero) `equal` Zero)
    ,assertTrue ((fromInteger' 86) `equal` (fromInteger' 86))
    ,assertTrue ((Zero `plus` (fromInteger' 10))
                 `equal` (fromInteger' 10))
    ,assertTrue (((Succ Zero) `plus` (fromInteger' 10))
                 `equal` (Succ (fromInteger' 10)))
    ,assertTrue (((Succ (Succ Zero)) `plus` (fromInteger' 10))
                 `equal` (Succ (Succ (fromInteger' 10))))
    ,assertTrue (((fromInteger' 5) `plus` (fromInteger' 10))
                 `equal` (fromInteger' 15))
    -- mult
    ,assertTrue ((Zero `mult` (fromInteger' 10))
                 `equal` Zero)
    ,assertTrue (((Succ Zero) `mult` (fromInteger' 10))
                 `equal` (fromInteger' 10))
    ,assertTrue (((Succ (Succ Zero)) `mult` (fromInteger' 10))
                 `equal` (fromInteger' 20))
    ,assertTrue (((fromInteger' 3) `mult` (fromInteger' 4))
                 `equal` (fromInteger' 12))
    -- lessOrEqual
    ,assertTrue (lessOrEqual (fromInteger' 86) (fromInteger' 86))
    ,assertTrue ((fromInteger' 86) `lessOrEqual` (fromInteger' 87))
    ,assertFalse ((fromInteger' 87) `lessOrEqual` (fromInteger' 86))
    ]
                
