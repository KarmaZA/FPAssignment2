--Define a more general function gf that uses bf,df as such that
--propgf xs == bs xs == gf abs xs
--	&& df xs == gf (+1) xs
--bf,df :: [Int] -> [Int]
--bf [] = []
--bf [x] = [abs x]
--bf (x:y::xs) = (abs x) : y : bf xs

--df [] = []
--df [x] = [x+1]
--df (x:y:xs) = (x+1) : y : df xs

-- gf +1 x returns the same properties as df
-- gf abs x returns the same properties as bf

gf :: (a -> a) -> [a] -> [a]
gf g [x] = [g x]
gf g (x:y:xs) = (g x) : y : gf g xs
