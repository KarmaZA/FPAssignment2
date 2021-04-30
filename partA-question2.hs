data Suit = Hearts | Clubs | Diamonds | Spades deriving Eq
data Rank = Numeric Int | King | Queen | Jack | Ace deriving Eq
data Card = NormalCard Rank Suit | Joker deriving Eq

--Function to return a 1 for and Ace and 0 otherwise
cardValue :: Card -> Int
cardValue (NormalCard x r) | x == Ace = 1
                           | otherwise   = 0
--Essentially this is the way I think the answer should be structured there is a pattern error in the (_ _) line
countAces :: [Card] -> Int
countAces [] = 0
countAces [x] | x == Joker = 1
              | otherwise = cardValue x
countAces (x:xs) = countAces [x] + countAces xs


--Copy of possible input as an example. The input below will return 2
--countAces[Joker, (NormalCard King Spades), (NormalCard Ace Hearts), (NormalCard (Numeric 5) Clubs)]

