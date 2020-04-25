# Assembly-programming-amd64-and-x86
<b> A. Simple programs Fibonacci and Calculator in Assembly </b> <br>

The Fibonacci function is defined as: </br>

fib(0) = 0 </br>
fib(1) = 1 </br>
fib(x) = fib(x-1) + fib(x-2) when x > 1 </br>

<b> B. Simple Arithmetic Calculator</b> </br>
Example </br>
$ ./calc32 1 + 4 </br
1 + 4 = 5 </br>

$ ./ccalc 2 "*" 7 </br>
2 * 7 = 14 </br>

$ ./calc64 2 / 70 </br>
2 / 70 = 0 </br>

$ ./ccalc
Usage:
  ./ccalc N op N
$ ./calc32 2 AND 7
Usage:
  ./acalc N op N
  
Implemented the above functions in C, AMD64(64-bit) assembly as well as x86(32-bit) assembly.
