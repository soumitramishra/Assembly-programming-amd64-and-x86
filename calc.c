#include<stdio.h>
#include<stdlib.h>

// Helper function declaration
long int calc(char, char, char);
void print_error_message();


int main(int argc, char *argv[]) {
	// Check if the number of arguments is 4
	if(argc != 4) {
		print_error_message();
		return 1;
	}
	//Get the operand and operator from command line arguments
	char *operand1 = argv[1];
	char *operator = argv[2];
	char *operand2 = argv[3];
	// Convert operands to long integer using atol function
	long int op1 = atol(operand1);
	char op = operator[0];
	long int op2 = atol(operand2);
	// Verify if the operand is valid, print the error message if it is invalid
	if (op != '+' && op != '-' && op != '/' && op != '*') {
		print_error_message();
		return 1;
	}
	// Invoke the calc function with operand1 op1, operand2 op2 and operator op
	// The result is saved in result variable
	long int result = calc(op1, op, op2);
	// Print the result in format "op1 operand op2 = result"
	printf("%ld %c %ld = %ld", op1, op, op2, result);
	return 0;
}

/*
 * Helper function to calculate the given expression
 * rtype : long int
 * Arguments
 * op1	:	operand1
 * op	:	operator(+, -, *, /)
 * op2	:	operand2
 */
long int calc(char op1, char op, char op2) {
	long int ans;
	if (op == '+') {
		ans = op1 + op2;
	}
	else if (op == '-') {
		ans = op1 - op2;
	}
	else if (op == '*') {
		ans = op1 * op2;
	}
	else if (op == '/'){
		ans = op1 / op2;
	}
	else {
		
	}
	return ans;
}
/*
 * Helper function to print error message if the input is invalid.
 */
void print_error_message() {
	char *error_message = "Usage:\n./ccalc N op N\n";
	puts(error_message);
}
