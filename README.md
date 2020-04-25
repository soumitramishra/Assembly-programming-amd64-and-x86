# Assembly-programming-amd64-and-x86
A. Simple programs Fibonacci and Calculator in Assembly

The Fibonacci function is defined as:

fib(0) = 0
fib(1) = 1
fib(x) = fib(x-1) + fib(x-2) when x > 1

B. Simple Arithmetic Calculator
Example
$ ./calc32 1 + 4
1 + 4 = 5

$ ./ccalc 2 "*" 7
2 * 7 = 14

$ ./calc64 2 / 70
2 / 70 = 0

$ ./ccalc
Usage:
  ./ccalc N op N
$ ./calc32 2 AND 7
Usage:
  ./acalc N op N
  
Implemented the above functions in C, AMD64(64-bit) assembly as well as x86(32-bit) assembly.
