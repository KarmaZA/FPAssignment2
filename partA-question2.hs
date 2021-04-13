data Suit = Hearts | Clubs | Diamonds | Spades
      deriving eq
data Rank = Numeric Int | King | Queen | Jack | Ace
      deriving eq
data Card = NormalCard Rank Suit | Joker
      deriving eq


countAces :: [Card] -> Int
