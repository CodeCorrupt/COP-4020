-- $Id: FindIndiciesTests.hs,v 1.1 2013/02/21 22:14:53 leavens Exp leavens $
module FindIndicesTests where
import FindIndicesInClass
import Testing

main = dotests "FindIndiciesTests $Revision: 1.1 $" tests

tests :: [TestCase [Int]]
tests = [(eqTest (findIndices even [4..9]) "==" [0,2,4])
        ,(eqTest (findIndices odd []) "==" [])
        ,(eqTest (findIndices odd [3,5,2,0,3]) "==" [0,1,4])
        ,(eqTest (findIndices odd [8,3,5,2,0,3]) "==" [1,2,5])
        ]
