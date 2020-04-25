	.global main
	.text
/*
	ebx is argv
	8(ebp) is argc
	edi operand
	dl is operand character literal
*/
main:
	enter $0, $0
	push %ebx
	push %edi
	cmp $4, 8(%ebp)
	jne print_error_message
	mov 12(%ebp), %ebx
	mov $0, %ecx
	mov 8(%ebx),%edi
	mov (%edi, %ecx, 1), %dl
	# Perform the given operator
	cmp $'+, %dl
	je add
	cmp $'-, %dl
	je sub
	cmp $'*, %dl
	je mul
	cmp $'/, %dl
	je div
	// if operator is invalid print_error_message
	jmp print_error_message

/*
For all the following operations
eax is operand1
edi i operand2
*/
add: 
	mov 4(%ebx), %eax
	push %eax
	call atol
	mov %eax, %edi
	add $4, %esp
	mov 12(%ebx), %eax
	push %eax
	call atol
	add $4, %esp
	add %edi, %eax
	jmp print_result

sub:
	mov 4(%ebx), %eax
	push %eax
	call atol
	mov %eax, %edi
	add $4, %esp
	mov 12(%ebx), %eax
	push %eax
	call atol
	add $4, %esp
	sub %eax, %edi
	mov %edi, %eax
	jmp print_result
mul:
	mov 4(%ebx), %eax
	push %eax
	call atol
	mov %eax, %edi
	add $4, %esp
	mov 12(%ebx), %eax
	push %eax
	call atol
	add $4, %esp
	imul %edi, %eax
	jmp print_result
div:
	mov 12(%ebx), %eax
	push %eax
	call atol
	mov %eax, %edi
	add $4, %esp
	mov 4(%ebx), %eax
	push %eax
	call atol
	add $4, %esp
	mov $0, %edx
	idiv %edi
	jmp print_result

print_result:
	push %eax
	mov 12(%ebx), %eax
	push %eax
	mov 8(%ebx), %eax
	push %eax
	mov 4(%ebx), %eax
	push %eax
	push $print_message
	call printf
	add $16, %esp
	pop %edi
	pop %ebx
	leave
	ret

print_error_message:
	push $error_message
	call puts
	add $4, %esp
	pop %edi
	pop %ebx
	leave
	ret
	.data
error_message: .string "Usage: ./calc32 N op N"
print_message: .string "%s %s %s = %ld"
