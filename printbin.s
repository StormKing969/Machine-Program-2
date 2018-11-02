.data
output:
    .ascii "0000 0000\0"

.text
.globl _printbin

_printbin:
    pushl %ebp            
    movl %esp, %ebp       
    subl $8, %esp        
    movl 8(%ebp), %eax    
    movl %eax, -4(%ebp)  
    movl $0, -8(%ebp)	  
    movl %eax, -8(%ebp) 
    shrl $4, -8(%ebp)   
    movl $output, %edx   	  
    
    call donibble		   	 
    addl $1, %edx             	 
    movl -4(%ebp), %eax	 
    movl %eax, -8(%ebp)   	 
    
    call donibble	 	
    movl $output, %eax	 
    movl %ebp, %esp	 
    popl %ebp		  
    ret			 
    
    movl $output, %eax	 
    movl %ebp, %esp	 
    popl %ebp		  
    ret   		 	 

donibble:
    pushl %ebp          
    movl %esp, %ebp     
    subl $16, %esp       
    movl 8(%ebp), %eax  
    movb %al, -4(%ebp)	 
    movl $4, -12(%ebp)	  
    movl $3, -16(%ebp)	  
    jmp .LOOP              

.LOOP:
    movl 8(%ebp), %eax
    movl %eax, -8(%ebp)     
    movl -16(%ebp), %ecx   
    shrl %cl, -8(%ebp)     
    andl $1, -8(%ebp)        
    movzbl -8(%ebp), %eax    
    addb $0x30, %al         
    movb %al, (%edx)	     
    addl $1, %edx   	            
    decl -16(%ebp)           
    decl -12(%ebp)	      
    cmpb $0, -12(%ebp)       
    jne .LOOP		   	      
    movl %ebp, %esp        
    popl %ebp		      
    ret			      
.end