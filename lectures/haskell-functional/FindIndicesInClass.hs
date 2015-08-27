module FindIndicesInClass where

findIndices _ [] = []

findIndices pred list = [index | (element,index) <- zip list [0,1..], pred element]