    .global main

    .text
/*
8(%ebp) = argc
12(%ebp) = argv
ebx is x
*/
main:
    enter $0, $0
    cmp $2,8(%ebp)
    jne print_error_message
    push %ebx // ebx is x
    mov 12(%ebp), %ecx // Get the whole argv string array
    mov 4(%ecx), %eax  // Get argv[1]
    push %eax	
    call atol	// convert argv[1] to long int xx = atol(argv[1])
    cmp $0, %eax
    jl print_error_message
    mov %eax, %ebx	//	x is ebx
    add $4, %esp	
    push %eax
    call fib	// Call fib with x fib(x)
    add $4, %esp
    push %eax	// result fib(x) in %eax
    push %ebx	// x
    push $output_fmt
    call printf	// print the result
    add $12, %esp
    pop %ebx
    mov $0, %eax
    leave
    ret

print_error_message:
    push $error_message
    call puts
    add $4, %esp
    mov $-1, %eax
    leave
    ret
    .data

fib:
    enter $0, $0
    push %ebx // ebx is x
    push %edi // edi is a
    mov 8(%ebp), %ebx 
    mov $0, %eax
    cmp $0, %ebx
    je fib_done_zero
    cmp $1, %ebx
    je fib_done_one
    mov %ebx, %ecx
    dec %ecx
    push %ecx
    call fib	// call a = fib(x-1)
    add $4, %esp
    mov %eax, %edi
    mov %ebx, %ecx
    dec %ecx
    dec %ecx
    push %ecx // Calling b = fib(x-2)
    call fib //result in eax
    add $4, %esp
    add %edi,%eax // int c = a + b == eax = eax + edi

// Base condition fib(0)
fib_done_zero:
    pop %edi
    pop %ebx
    leave
    ret

// Base condition fib(1)
fib_done_one:
    pop %edi
    pop %ebx
    mov $1, %eax
    leave
    ret

	.data 
output_fmt:  .string "fib(%ld) = %ld\n"
error_message: .string "Usage: ./fib N, where N >= 0"
