.text
.globl _count

_count:
	# Typical Format
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp

	# Adds the string 
	movl 8(%ebp), %ecx  
	# Adds the character we are looking for
	movl 12(%ebp), %edx
	# Creates the counter
	movl $0, %eax

.LOOP:
	# Looks if string is empty 
	cmpb $0, (%ecx) 
	# Exit if string is empty 
	jz done
	# Compares the character and string 
	cmpb (%ecx), %edx

	# If Statement 
	jz .TRUE
	jnz .FALSE

# If True
.TRUE:
	# Increase the counter
	incl %eax
	# Look at the next character
	incl %ecx
	# Start the loop again 
	jmp .LOOP

# If False
.FALSE:
	# Look at the next character 
	incl %ecx
	# Start the loop again 
	jmp .LOOP

done:
	# Give EBP the value of ESP which contains EAX
	movl %ebp, %esp
	# Return the counter 
	popb %ebp
	ret
.end