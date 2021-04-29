--Implementation of a Turing machine for a palindrome of length 4 or less
--

--Representation of input tape for a Turing Machine
data Tape a = Tape [a] a [a]

--Operations to move left or right on the tape
moveLeft  (Tape (x:xs) y zs) = Tape xs x (y:zs)
moveRight (Tape xs y (z:zs)) = Tape (y:xs) z zs

--Operation to write the symbol on the tape
write (Tape xs y zs) a = Tape xs a zs

blanks = repeat ' '
--implementation of the Turing machinie
palin:: Int -> Tape Char -> Maybe(Int, Tape Char)
palin s t@(Tape _ a _) = 
   case (s,a) of
      (0,'a')  -> Just (10, moveRight (write t '_'))  -- first item a
      (0,'b')  -> Just (20, moveRight (write t '_'))  -- First item b
      (0,' ')  -> Just (30, write t 'Y')  --nothin
      (10,'a') -> Just (10, moveRight t) 
      (10,'b') -> Just (10, moveRight t)
      (10,' ') -> Just (11, moveLeft t)
      (11,'a') -> Just (12, moveLeft (write t ' '))
      (11,'b') -> Just (30, write t 'N')   -- start a end b reject
      (11,' ') -> Just (30, write t 'Y')   -- only a accept
      (12,'a') -> Just (12, moveLeft t)
      (12,'b') -> Just (12, moveLeft t)
      (12,' ') -> Just (0, moveRight t)
      (30,'Y') -> Just (30, write t 'a')
      (30,'N') -> Just (30, write t 'b')
      (30,'a') -> Nothing
      (30,'b') -> Nothing
      _        -> error (show a)
