	.global main
	.global calc
	.text
/*
	argv in r15
	operand1 in r12
	operator in r13
*/
main:
	enter $20, $0
	cmp $4, %rdi
	jne print_error_message
	push %r15 //argv
	push %r14 // op2
	push %r13 //op
	push %r12 // op1
	mov %rsi, %r15
	# Operand1 : Convert to long and save in r12
	mov 8(%r15), %rdi
	call atol
	mov %rax, %r12
	# Operator : save in r13
	mov 16(%r15), %r13
	mov $0, %rcx
	mov (%r13, %rcx, 1), %dl
	# Operand2 : Convert to long and save in r14
	mov 24(%r15), %rdi
	call atol
	mov %rax, %r14
	mov %r12, %rdi
	mov %r13, %rsi
	mov %r14, %rdx
	call calc // long int result = calc(op1, op, op2)
	cmp $'O,%rax 
	je dont_print_result
	mov $print_message, %rdi
	mov %r12, %rsi
	mov %r13, %rdx
	mov %r14, %rcx
	mov %rax, %r8
	mov $0, %al
	call printf // printf("%ld %c %ld = %ld", op1, op, op2, result);
	pop %r12
	pop %r13
	pop %r14
	pop %r15
	mov $0, %rax
	leave 
	ret
dont_print_result:
	pop %r12
	pop %r13
	pop %r14
	pop %r15
	mov $1, %rax
	leave 
	ret
	
calc:
	enter $0, $0
	push %r12 # operand1
	push %r13 # operator
	push %r14 # operand2
	mov %rdi, %r12 
	mov %rsi, %r13
	mov %rdx, %r14
	mov $0, %rcx
	mov (%r13, %rcx, 1), %dl // Get the first byte from operator string to convert it into character - Eg-dl = '+'
	cmp $'+, %dl 
	je add	
	cmp $'-, %dl # if op == '-'
	je sub
	cmp $'*, %dl # if op == '*'
	je mul
	cmp $'/, %dl # if op == '/'
	je div
	mov $error_message, %rdi # if op is invalid, print error message
	call puts
	mov $'O, %rax #Setting rax to O(big-oh) which will be used as an indication in main function that operator is invalid
	pop %r14
	pop %r13
	pop %r12
	leave
	ret

add: # rax = r12 + r14 :: ans = op1 + op2
	add %r12, %r14
	mov %r14, %rax
	pop %r14
	pop %r13
	pop %r12
	leave 
	ret
sub: # rax = r12 - r14 :: ans = op1 - op2
	sub %r14, %r12
	mov %r12, %rax
	pop %r14
	pop %r13
	pop %r12
	leave 
	ret
mul: # rax = r12 * r14 :: ans = op1 * op2
	mov %r12, %rax
	imul %r14
	pop %r14
	pop %r13
	pop %r12
	leave 
	ret
div:	# rax = r12 * r14 :: ans = op1 * op2
	mov $0, %rdx
	mov $12, %rax
	idiv %r14
	pop %r14
	pop %r13
	pop %r12
	leave 
	ret
#print_error_message()
print_error_message:
	mov $error_message, %edi
	call puts
	mov $'O, %rax
        leave
	ret

	.data
error_message: .string "Usage:\n ./calc N op N\n"
print_message: .string "%ld %s %ld = %ld"

