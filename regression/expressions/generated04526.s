	.global	main
	.data
global_x0:	.int	0
global_x1:	.int	0
global_y:	.int	0
	.text
main:
	pushl	%ebp
	movl	%esp,	%ebp
	subl	$0,	%esp
# READ
	call	Lread
	movl	%eax,	%ebx
# ST x0
	movl	%ebx,	global_x0
# READ
	call	Lread
	movl	%eax,	%ebx
# ST x1
	movl	%ebx,	global_x1
# CONST 17
	movl	$17,	%ebx
# CONST 23
	movl	$23,	%ecx
# CONST 29
	movl	$29,	%esi
# BINOP /
	movl	%ecx,	%eax
	cltd
	idivl	%esi
	movl	%eax,	%ecx
# LD x0
	movl	global_x0,	%esi
# BINOP *
	imull	%esi,	%ecx
# BINOP +
	addl	%ecx,	%ebx
# DUP
	movl	%ebx,	%ecx
# ST y
	movl	%ecx,	global_y
# DROP
# LD y
	movl	global_y,	%ebx
# WRITE
	pushl	%ebx
	call	Lwrite
	popl	%eax
	movl	%ebp,	%esp
	popl	%ebp
	xorl	%eax,	%eax
	ret
