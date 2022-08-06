[greater than or ">". This is my way to implement that function on brainfuck to calculate "A > B". If you want to use it
then have your data in this way:
  Cell No:  ...   n   n+1
  Contents: ...   A    B
  Pointer:        ^
if you do it correctly then after the execusion the memory will look like this:
  Cell No:  ...    n    n+1  n+2  n+3  n+4
  contents: ...   1/0    0    0    0    0
  pointer:         ^
This means that you will be pointing at the Cell you were before you executed this code and the answer will also be there
as a 1 or a 0. as you can see this program requires 5 Cells to use and does cleans them.
]

[
  >>+                                      Every iteration it moves to Cell No: n2 and adds 1 to it
  <<-                                      and moves back to Cell No: n and substracts 1 to it
]

The result of this loop:
Cell No : n   n1   n2
Contents: 0   B    A
Pointer : ^

>                                          Moves to Cell No: n1

[
  >> +                                     Every iteration it moves to Cell No: n3 and adds 1 to it
  << -                                     and moves back to Cell No: n1 and substracts 1 to it
]

The result of this loop:
Cell No :  n   n1   n2   n3
Contents:  0   0    A    B
Pointer :      ^

<                                          Moves to Cell No: n

+                                          Adds 1 to Cell No: n
>>+                                        Moves to Cell No: n2 and adds 1
>+                                         Moves to Cell No: n3 and adds 1
<                                          Moves back to Cell No: n2

before the loop the memory looks like this:
Cell No :  n   n1      n2         n3
Contents:  1   0    A plus 1   B plus 1
Pointer :               ^

notice that we dont have A and B but (A plus 1) and (B plus 1) instead

[
  -                                        In every iteration substracts 1 to Cell No: n2
  >-                                       then moves right and substracts 1 to Cell No: n3
  [>]                                      if Cell No: n3 is greater than 1 (or is not 0) move right
  <<                                       here we move back to Cell No: n1 or Cell No: n2
]

The result of this loop:
Cell No : n    n1    n2    n3    n4
Contents: 1    0     x/0   y/0   0
Pointer :             ^     ^

here there are 2 pointers because in the last loop there could be 2 posible
places the pointer could be

<                                          Moves to Cell No: n or Cell No: n1
[+>]                                       if the pointer is in Cell No: n 
                                           then adds 1 to it and pointer moves to Cell No: n1

>[-]                                       Moves to Cell No: n2 and makes it value 0
>[-]                                       Moves to Cell No: n3 and makes it value 0
<<<-                                       Moves back and substracts 1 to Cell No: n


============================================================================================
Minified version:
[>>+<<-]>[>>+<<-]<+>>+>+<[->-[>]<<]<[+>]>[-]>[-]<<<-
