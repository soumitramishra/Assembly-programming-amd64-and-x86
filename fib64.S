  .global main
  .text
main:
  enter $0, $0
  /*
	%rdi is argc
	%rsi is argv
  */
  cmp $2, %rdi 
  jne print_error_message
  mov 8(%rsi), %rdi
  call atol
  cmp $0,%rax
  jl print_error_message
  mov %rax, %r11
  mov %rax, %rdi
  mov $0, %rax
  call fib
  mov $output_fmt, %rdi
  mov %r11, %rsi
  mov %rax, %rdx
  mov $0, %al
  call printf
  mov $0, %rax
  leave
  ret

print_error_message:
   mov  $error_message, %rdi
   call puts
   mov $1, %rax
   leave
   ret
fib:
  /*
	rbx is x
	r14 is a
  */
  enter $8, $0
  push %rbx // x
  push %r14 // a
  mov %rdi, %rbx
  mov $0, %rax
  cmp $0, %rbx
  //base case for zero
  je fib_done_zero
  cmp $1, %rbx
  //base case for one
  je fib_done_one
  //a(r14) = fib(x-1)
  dec %rdi
  call fib
  mov %rax, %r14
  mov %rbx, %rdi
  //b(rax) = fib(x-2)
  dec %rdi
  dec %rdi
  call fib
  //c(rax) = a(r14) + b(rax)
  add %r14, %rax

//fib(0)
fib_done_zero:
  pop %r14
  pop %rbx
  leave
  ret

//fib(1)
fib_done_one:
  mov $1, %rax
  pop %r14
  pop %rbx
  leave
  ret

  .data
output_fmt:  .string "fib(%ld) = %ld\n"
error_message: .string "Usage: ./fib N, where N >= 0"
