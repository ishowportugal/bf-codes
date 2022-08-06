[Negation. The idea with this program is to implement a "NOT" operation on the 
character that's currently pointed at the moment of executing this code. To use
this code you need to have the memory like this:
  Cell No:  ...  n
  Contents: ...  A
  Pointer:       ^
and after the execution you will probaly have the memory like this:
  Cell No:  ...   n   n+1
  Contents: ...  !A    0
  Pointer:        ^
]

[
  > +                                        If Cell No: n is not 0 then move and add 1 to Cell No: n1  
  < [-]                                      Move back to Cell No: n2 and make it's value a 0
]

The result of this loop:
Cell No : n    n1
Contents: 0   1/0
Pointer : ^
Note that in n1 there could be 1 or 0; depends wether we entered last cicle or not

>-                                           Move and substract 1 from Cell No: n1

[
  < +                                        If Cell No: n1 is not 0 move and add 1 to Cell No: n
  > +                                        Move and add 1 to Cell No: n1
]

The result of this loop:
Cell No :  n    n1
Contents: 1/0   0
Pointer :       ^
Note that now we have our answer in Cell No: n and we are pointing at Cell No: n1

<                                            Move back to Cell No: n

============================================================================================
Minified version:
[>+<[-]]>-[<+>+]<
