[Fixed Array demo, author: Camilo Zambrano]
[This program emulates a fixed array in brainfuck. The way this is accomplished
is by setting the "index" of where you want to go in the array on a cell and
then moving that amount of positions to the right. Similar to other programming
languages, the index can take any value from "0" to "n-1". Where "n" is the
size of the array (so the index starts at 0). This implementation has a memory
usage of order "2n" (big O notation: O(n)). This happens because before each
cell that's part of the array, an empty cell needs to be created as a form of
marking used when moving around the array.]

-                      First we make the cell in position 0 have minus one as a marker for us to return later

>                      We move to the next cell which will be our "index" cell

                       Here we do "nothing" because that means we want to go to index 0 in the array

[-[-[-[-[-             We decrement the index and check if it reached 0
>>]>>]>>]>>]>>]>       everytime we decrement we open loops that will execute 2 movements to the right
                       this is where the empty cells come into play after the pointer moves it will
                       point to one of those cells and that won't make the cicle continue but end and
                       be followed by the next one At the end we move the pointer to the right once
                       and it will be in the respective cell of the array

+                      Since we are in the "first" cell of the array now we set it to "1"

+[-<+]-                This operation basically searches for minus one in the left side basically looks for
                       our marker on the first cell of memory

>                      From this point on we repeat the previous steps we move to the "index" cell
+                      set it to 1 because we are going to that index
[-[-[-[-[-             we move to the right until we reach the desired cell
>>]>>]>>]>>]>>]>
++                     we set the value of the cell to 2 because is our "second" position in the array
+[-<+]-                we go back to the first cell in memory

>
++                     index = 2
[-[-[-[-[-
>>]>>]>>]>>]>>]>
+++                    arr(2)=3
+[-<+]-

>
+++                    index=3
[-[-[-[-[-
>>]>>]>>]>>]>>]>
++++                   arr(3)=4
+[-<+]-

>
++++                   index=4
[-[-[-[-[-
>>]>>]>>]>>]>>]>
+++++                  arr(4)=5
+[-<+]-

>
+++++                  index=5
[-[-[-[-[-
>>]>>]>>]>>]>>]>
++++++                 arr(5)=6
+[-<+]-

>
,[-]                   we ask for input to pause the execution here and then drop the inputed byte
                       you can use this pause to look at the memory of the program at this moment

[Notice we could set the "index" to a value grater than 5 (the size of the 
fixed array is 6) and at the end it will end up pointing to the sixth
element of the array.]
+++++ +++++            index=10
[-[-[-[-[-
>>]>>]>>]>>]>>]>
[-]                    arr(5)=0
+++++ ++               arr(5)=7
+[-<+]-

>
,[-]

============================================================================================
Minified version without the debug pauses:
->[-[-[-[-[->>]>>]>>]>>]>>]>++[-<+]->+[-[-[-[-[->>]>>]>>]>>]>>]>+++[-<+]->++[-[-[-[-[->>]>>]>>]>>]>>]>++++[-<+]->+++[-[-[-[-[->>]>>]>>]>>]>>]>+++++[-<+]->++++[-[-[-[-[->>]>>]>>]>>]>>]>++++++[-<+]->+++++[-[-[-[-[->>]>>]>>]>>]>>]>+++++++[-<+]->[.]++++++++++[-[-[-[-[->>]>>]>>]>>]>>]>[-]++++++++[-<+]-
