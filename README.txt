This text file contains the sequence of possible Turing machine state configurations that are used during the computation of g with the input string of "aba" 

List of configurations given as
<Current State, Input Symbol, Output Symbol, New State>

The input string on the tape can be read as " aba ". For readability sake I will write spaces as  ' '.The state numbers will also be prefixed with an S.

<CurrentState, Input, Output, NewState>

<S0 , 'a', ' ', S10>
<S10, 'b', 'b', S10>
<S10, 'a', 'a', S10>
<S10, ' ', ' ', S11>
<S11, 'a', ' ', S12>
<S12, 'b', 'b', S12>
<S12, ' ', ' ', S0>
<S0 , 'b', ' ', S20>
<S20, ' ', ' ', S21>
<S21, ' ', 'Y', S30>
<S30, 'Y', 'a', S30>
<S30, 'a', 'a', Halt>
End of the program will show the tape which will read 'a' with a number of
 spaces on either side.