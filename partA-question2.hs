data Suit = Hearts | Clubs | Diamonds | Spades deriving Eq
data Rank = Numeric Int | King | Queen | Jack | Ace deriving Eq
data Card = NormalCard Rank Suit | Joker deriving Eq

--Essentially this is the way I think the answer should be structured there is a pattern error in the (_ _) line
countAces :: [Card] -> Int
instance countAces Joker = 1 --if the card if a joker
instance countAces NormalCard x r | x == Ace  = 1 --elif ace +1
                         | otherwise = 0
--countAces NormalCard (_ _)   = 0 -- else plus 0
countAces (x:xs) = 0 + countAces x + countAces xs
