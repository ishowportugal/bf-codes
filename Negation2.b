[This program does the same as the one in Negation.b. The main difference 
is that it's a bit easier to follow since the pointer is not on two
different positions in the middle of the program depending on the input.
As a summary, the idea is to provide a way to negate the current cell,
that means you need to have the memory like this:
  Cell No:  ...  n
  Contents: ...  A
  Pointer:       ^
before executing this program and after the execution you will have the
memory like this:
  Cell No:  ...   n   n+1
  Contents: ...  !A    0
  Pointer:        ^

NOTE: this program takes 5 more steps when the input cell n has the
value of "1" and 5 fewer steps when the input cell has the value of "0".
If you want to have a more "consistent" behaviour when it comes to
performance, I recommend you use the Negation.b version. If you think
you need to negate a lot of "false" values then I recommend this version
]


[
    > +                                         If Cell No: n is not 0 then move and add 1 to Cell No: n1 
    < [-]                                       Move back to Cell No: n2 and make it's value a 0
]

The result of this loop:
Cell No : n    n1
Contents: 0   1/0
Pointer : ^
Note that in n1 there could be 1 or 0; depends wether we entered last cicle or not

>                                               Move rigt to Cell No: n1

[
    < -                                         If Cell No: n1 is not 0 then Move left to Cell No: n and substract 1
    > -                                         Move right to Cell No: n1 and also substract 1 This will make it a 0
]

The result of this loop:
Cell No :   n     n1
Contents: 255/0    0
Pointer :          ^
Note that 255 is the same as "negative 1" and we are pointing to Cell No: n1

< +                                             Move left to Cell No: n and add 1 to it

============================================================================================
Minified version:
[>+<[-]]>[<->-]<+
