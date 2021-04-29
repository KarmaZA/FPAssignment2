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

gf :: (a -> a) -> [a] -> [a]
gf g [x] = [g x]
gf g (x:y:xs) = (g x) : y : gf g xs

--gf _ [] = []
--gf abs [x] = [abs x]
--gf abs (x:y:xs) = (abs x) : y : gf abs xs
--gf _ [x] = [(+1) x]
--gf _ (x:y:xs) = (add x 1) : y : gf f (+1) xs
