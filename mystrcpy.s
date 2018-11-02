.text
.globl _mystrcpy

_mystrcpy:
	pushl %ebp
	movl %esp, %ebp
	subl $8(%ebp), %esp
	movl 8(%ebp), %ecx
	movl 12(%ebp), %edx

.LOOP:
	movb (%edx), %al
	movb %al, (%ecx)
	incl %edx
	incl %ecx
	cmpb $0, %al
	jnz .LOOP

	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret 
.end