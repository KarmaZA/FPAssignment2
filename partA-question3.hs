--Question 3 sort a numeric list using any sort method
--
sort :: [Int] -> [Int]
sort [] = []
sort (x:xs) =
     let smallSort = sort [a | a <- xs, a <= x]
         bigSort = sort [a | a <- xs, a > x]
     in smallSort ++ [x] ++ bigSort
