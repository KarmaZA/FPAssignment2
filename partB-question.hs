--Implementation of a Turing machine for a palindrome of length 4 or less
--

--Representation of input tape for a Turing Machine
data Tape a = Tape [a] a [a]

--Operations to move left or right on the tape
moveLeft  (Tape (x:xs) y zs) = Tape xs x (y:zs)
moveRight (Tape xs y (z:zs)) = Tape (y:xs) z zs

--Operation to write the symbol on the tape
write (Tape xs y zs) a = Tape xs a zs

--implementation of the Turing machine
Palin:: Int -> Tape Char -> Maybe(Int, Tape Char)
