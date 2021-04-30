--Implementation of a Turing machine for a palindrome of length 4 or less
-- The syntax to running this Turing machine is:
-- showT (runTM (tmPal (Tape blanks 'a' ("bbb" ++ blanks))))
-- where a is the first char on the tape and bbb is the rest of the tape. if only 1 char use (Tape blanks 'a' blanks)


--Representation of input tape for a Turing Machine
data Tape a = Tape [a] a [a]

--Operations to move left or right on the tape
moveLeft  (Tape (x:xs) y zs) = Tape xs x (y:zs)
moveRight (Tape xs y (z:zs)) = Tape (y:xs) z zs

--Operation to write the symbol on the tape
write (Tape xs y zs) a = Tape xs a zs

data TM a s = TM [a] 
                 [s] 
                 s 
                 (Tape a) 
                 (s -> Tape a -> Maybe (s, Tape a))

runTM :: TM a s -> Tape a
runTM (TM as ss s0 t0 tf) =
  case tf s0 t0 of
      Nothing       -> t0
      Just (s1,t1) -> runTM (TM as ss s1 t1 tf)

showT (Tape xs y zs) = y

blanks = repeat ' '
--implementation of the Turing machine
palin:: Int -> Tape Char -> Maybe(Int, Tape Char)
palin s t@(Tape _ a _) = 
   case (s,a) of
      (0,'a')  -> Just (10, moveRight (write t ' '))  -- first item a
      (0,'b')  -> Just (20, moveRight (write t ' '))  -- First item b
      (0,' ')  -> Just (30, write t 'a')  --nothin
      (10,'a') -> Just (10, moveRight t) 
      (10,'b') -> Just (10, moveRight t)
      (10,' ') -> Just (11, moveLeft t)
      (11,'a') -> Just (12, moveLeft (write t ' '))
      (11,'b') -> Just (30, write t 'b')   -- start a end b reject
      (11,' ') -> Just (30, write t 'a')   -- only a accept
      (12,'a') -> Just (15, moveLeft (write t ' '))
      (12,'b') -> Just (16, moveLeft (write t ' '))
      (12,' ') -> Just (0, moveRight t)
      (15,'a') -> Just (30, write t 'a')
      (15,'b') -> Just (30, write t 'b')
      (15,' ') -> Just (30, write t 'a')
      (16,'a') -> Just (30, write t 'b')
      (16,'b') -> Just (30, write t 'a')
      (16,' ') -> Just (30, write t 'a')
      (20,'a') -> Just (20, moveRight t)
      (20,'b') -> Just (20, moveRight t)
      (20,' ') -> Just (21, moveLeft t)
      (21,'b') -> Just (22, moveLeft (write t ' '))
      (21,'a') -> Just (30, write t 'b')   -- start a end b reject
      (21,' ') -> Just (30, write t 'a')   -- only a accept
      (22,'b') -> Just (16, moveLeft (write t ' '))
      (22,'a') -> Just (15, moveLeft (write t ' '))
      (22,' ') -> Just (0, moveRight t)
      (30,'a') -> Nothing
      (30,'b') -> Nothing
      _        -> error (show s ++ show a)

tmPal :: Tape Char -> TM Char Int
tmPal t = TM " ab" [0,10,11,12,15,16,20,21,22,30] 0 t palin
