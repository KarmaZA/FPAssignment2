--Define a function cp that returns the cartesian product of a list
--

cp :: [[a]] -> [[a]]
cp [] = [[]]
cp xss = sequence xss 
