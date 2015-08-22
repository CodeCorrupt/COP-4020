-- $Id$
module MapInClassTests where
import Prelude hiding (map)
import MapInClass
import Testing
main :: IO()
main = dotests "PredicatesTests $Revision: 1.1 $" tests
tests :: [TestCase [Int]]
tests = 
    [eqTest (map (+1) []) "==" []
    ,eqTest (map (+1) [1,2,3]) "==" [2,3,4]
    ,eqTest (map (*10) [1,2,3]) "==" [10,20,30]
    ,eqTest (map (*10) [2,3]) "==" [20,30]
    ,eqTest (map (*10) [1 .. 10]) "==" [10,20 .. 100]
    ,eqTest (map (\i -> i*10) [1 .. 10]) "==" [10,20 .. 100]
    ]

