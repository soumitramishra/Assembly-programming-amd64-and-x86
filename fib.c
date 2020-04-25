#include <stdio.h>
#include <stdlib.h>

// Helper function declaration
long int fib(long int);
void printErrorMessage();

int
main(int argc, char* argv[])
{
    if(argc != 2) {
	    printErrorMessage();
	    return -1;
    }
    else {
    	long xx = atol(argv[1]);
    	if(xx <0) {
		printErrorMessage();
		return -1;
	}
	else{
		printf("fib(%ld) = %ld\n", xx,fib(xx));
	}
    }	
    return 0;
}


/**
 * Function to calculate xth fibonacci number
 * rtype	:	long int
 * Arguments
 * x	:	long int
 */
long int fib(long int x) {
	if(x == 0 || x == 1) {
		return x;
	}
	long int a = fib(x-1);
	long int b = fib(x-2);
	long int c = a + b;
	return c;
}

/*
 * Function to print Error message when input is invalid
 */
void printErrorMessage() {
	char *s = "Usage: ./fib N, where N >= 0\n";
	puts(s);
}
