-- Question 3 sort a numeric list using any sort method
-- Example of io for the function
-- input:  sort [1,7,3,5,9,23,5,7,658,23,765,354,786]
-- output: [1,3,5,5,7,7,9,23,23,354,658,765,786]

sort :: [Int] -> [Int]
sort [] = []
sort (x:xs) =
     let smallSort = sort [a | a <- xs, a <= x]
         bigSort = sort [a | a <- xs, a > x]
     in smallSort ++ [x] ++ bigSort
