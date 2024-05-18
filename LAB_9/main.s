	.file	"main.cpp"
	.intel_syntax noprefix
	.text
	.section	.text$_ZNSt6chrono8durationIxSt5ratioILx1ELx1000000000EEEC1IxvEERKT_,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt6chrono8durationIxSt5ratioILx1ELx1000000000EEEC1IxvEERKT_
	.def	_ZNSt6chrono8durationIxSt5ratioILx1ELx1000000000EEEC1IxvEERKT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6chrono8durationIxSt5ratioILx1ELx1000000000EEEC1IxvEERKT_
_ZNSt6chrono8durationIxSt5ratioILx1ELx1000000000EEEC1IxvEERKT_:
.LFB2486:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR 16[rbp]
	mov	QWORD PTR [rax], rdx
	nop
	pop	rbp
	ret
	.seh_endproc
	.section	.text$_ZNKSt6chrono8durationIxSt5ratioILx1ELx1000000000EEE5countEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNKSt6chrono8durationIxSt5ratioILx1ELx1000000000EEE5countEv
	.def	_ZNKSt6chrono8durationIxSt5ratioILx1ELx1000000000EEE5countEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt6chrono8durationIxSt5ratioILx1ELx1000000000EEE5countEv
_ZNKSt6chrono8durationIxSt5ratioILx1ELx1000000000EEE5countEv:
.LFB2488:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	pop	rbp
	ret
	.seh_endproc
	.text
	.globl	_Z15matrix_multiplyPfS_S_iii
	.def	_Z15matrix_multiplyPfS_S_iii;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z15matrix_multiplyPfS_S_iii
_Z15matrix_multiplyPfS_S_iii:
.LFB7368:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	DWORD PTR 40[rbp], r9d
	mov	DWORD PTR -4[rbp], 0
	jmp	.L5
.L10:
	mov	DWORD PTR -8[rbp], 0
	jmp	.L6
.L9:
	mov	eax, DWORD PTR -4[rbp]
	imul	eax, DWORD PTR 56[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR -8[rbp]
	add	eax, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR 32[rbp]
	add	rax, rdx
	pxor	xmm0, xmm0
	movss	DWORD PTR [rax], xmm0
	mov	DWORD PTR -12[rbp], 0
	jmp	.L7
.L8:
	mov	eax, DWORD PTR -4[rbp]
	imul	eax, DWORD PTR 56[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR -8[rbp]
	add	eax, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR 32[rbp]
	add	rax, rdx
	movss	xmm1, DWORD PTR [rax]
	mov	eax, DWORD PTR -4[rbp]
	imul	eax, DWORD PTR 48[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR -12[rbp]
	add	eax, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR 16[rbp]
	add	rax, rdx
	movss	xmm2, DWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	imul	eax, DWORD PTR 56[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR -8[rbp]
	add	eax, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR 24[rbp]
	add	rax, rdx
	movss	xmm0, DWORD PTR [rax]
	mulss	xmm0, xmm2
	mov	eax, DWORD PTR -4[rbp]
	imul	eax, DWORD PTR 56[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR -8[rbp]
	add	eax, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR 32[rbp]
	add	rax, rdx
	addss	xmm0, xmm1
	movss	DWORD PTR [rax], xmm0
	add	DWORD PTR -12[rbp], 1
.L7:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR 48[rbp]
	jl	.L8
	add	DWORD PTR -8[rbp], 1
.L6:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR 56[rbp]
	jl	.L9
	add	DWORD PTR -4[rbp], 1
.L5:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR 40[rbp]
	jl	.L10
	nop
	nop
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	_Z15transposeMatrixPfii
	.def	_Z15transposeMatrixPfii;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z15transposeMatrixPfii
_Z15transposeMatrixPfii:
.LFB7369:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR 24[rbp], edx
	mov	DWORD PTR 32[rbp], r8d
	mov	eax, DWORD PTR 32[rbp]
	imul	eax, DWORD PTR 24[rbp]
	cdqe
	movabs	rdx, 2305843009213693950
	cmp	rdx, rax
	jb	.L12
	sal	rax, 2
	mov	rcx, rax
	call	_Znay
	mov	QWORD PTR -16[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L14
.L12:
	call	__cxa_throw_bad_array_new_length
.L17:
	mov	DWORD PTR -8[rbp], 0
	jmp	.L15
.L16:
	mov	eax, DWORD PTR -4[rbp]
	imul	eax, DWORD PTR 32[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR -8[rbp]
	add	eax, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR 16[rbp]
	add	rdx, rax
	mov	eax, DWORD PTR -8[rbp]
	imul	eax, DWORD PTR 24[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR -4[rbp]
	add	eax, ecx
	cdqe
	lea	rcx, 0[0+rax*4]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rcx
	movss	xmm0, DWORD PTR [rdx]
	movss	DWORD PTR [rax], xmm0
	add	DWORD PTR -8[rbp], 1
.L15:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR 32[rbp]
	jl	.L16
	add	DWORD PTR -4[rbp], 1
.L14:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR 24[rbp]
	jl	.L17
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Enter the dimensions of matrix A (LxM): \0"
	.align 8
.LC2:
	.ascii "Enter the dimensions of matrix B (MxN): \0"
	.align 8
.LC3:
	.ascii "Enter the elements of matrix A:\12\0"
	.align 8
.LC4:
	.ascii "Enter the elements of matrix B:\12\0"
.LC5:
	.ascii "Result matrix C(c-func):\12\0"
.LC6:
	.ascii " \0"
.LC7:
	.ascii "Result matrix C(asm-func):\12\0"
.LC8:
	.ascii "Time taken: \0"
.LC9:
	.ascii " ms\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB7370:
	push	rbp
	.seh_pushreg	rbp
	push	r13
	.seh_pushreg	r13
	push	r12
	.seh_pushreg	r12
	push	rdi
	.seh_pushreg	rdi
	push	rsi
	.seh_pushreg	rsi
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 168
	.seh_stackalloc	168
	lea	rbp, 160[rsp]
	.seh_setframe	rbp, 160
	.seh_endprologue
	call	__main
	lea	rax, .LC1[rip]
	mov	rdx, rax
	mov	rax, QWORD PTR .refptr._ZSt4cout[rip]
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rax, -84[rbp]
	mov	rdx, rax
	mov	rax, QWORD PTR .refptr._ZSt3cin[rip]
	mov	rcx, rax
	call	_ZNSirsERi
	mov	rcx, rax
	lea	rax, -88[rbp]
	mov	rdx, rax
	call	_ZNSirsERi
	lea	rax, .LC2[rip]
	mov	rdx, rax
	mov	rax, QWORD PTR .refptr._ZSt4cout[rip]
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	lea	rax, -88[rbp]
	mov	rdx, rax
	mov	rax, QWORD PTR .refptr._ZSt3cin[rip]
	mov	rcx, rax
	call	_ZNSirsERi
	mov	rcx, rax
	lea	rax, -92[rbp]
	mov	rdx, rax
	call	_ZNSirsERi
	mov	edx, DWORD PTR -84[rbp]
	mov	eax, DWORD PTR -88[rbp]
	imul	eax, edx
	cdqe
	movabs	rdx, 2305843009213693950
	cmp	rdx, rax
	jb	.L20
	sal	rax, 2
	mov	rcx, rax
	call	_Znay
	mov	QWORD PTR -32[rbp], rax
	mov	edx, DWORD PTR -88[rbp]
	mov	eax, DWORD PTR -92[rbp]
	imul	eax, edx
	cdqe
	movabs	rdx, 2305843009213693950
	cmp	rdx, rax
	jb	.L22
	jmp	.L46
.L20:
	call	__cxa_throw_bad_array_new_length
.L46:
	sal	rax, 2
	mov	rcx, rax
	call	_Znay
	mov	QWORD PTR -40[rbp], rax
	mov	edx, DWORD PTR -84[rbp]
	mov	eax, DWORD PTR -92[rbp]
	imul	eax, edx
	cdqe
	movabs	rdx, 2305843009213693950
	cmp	rdx, rax
	jb	.L24
	jmp	.L47
.L22:
	call	__cxa_throw_bad_array_new_length
.L47:
	sal	rax, 2
	mov	rcx, rax
	call	_Znay
	mov	QWORD PTR -48[rbp], rax
	lea	rax, .LC3[rip]
	mov	rdx, rax
	mov	rax, QWORD PTR .refptr._ZSt4cout[rip]
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	DWORD PTR -4[rbp], 0
	jmp	.L26
.L24:
	call	__cxa_throw_bad_array_new_length
.L27:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	rdx, rax
	mov	rax, QWORD PTR .refptr._ZSt3cin[rip]
	mov	rcx, rax
	call	_ZNSirsERf
	add	DWORD PTR -4[rbp], 1
.L26:
	mov	edx, DWORD PTR -84[rbp]
	mov	eax, DWORD PTR -88[rbp]
	imul	eax, edx
	cmp	DWORD PTR -4[rbp], eax
	jl	.L27
	lea	rax, .LC4[rip]
	mov	rdx, rax
	mov	rax, QWORD PTR .refptr._ZSt4cout[rip]
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	DWORD PTR -8[rbp], 0
	jmp	.L28
.L29:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	mov	rdx, rax
	mov	rax, QWORD PTR .refptr._ZSt3cin[rip]
	mov	rcx, rax
	call	_ZNSirsERf
	add	DWORD PTR -8[rbp], 1
.L28:
	mov	edx, DWORD PTR -88[rbp]
	mov	eax, DWORD PTR -92[rbp]
	imul	eax, edx
	cmp	DWORD PTR -8[rbp], eax
	jl	.L29
	mov	r8d, DWORD PTR -92[rbp]
	mov	ecx, DWORD PTR -88[rbp]
	mov	r9d, DWORD PTR -84[rbp]
	mov	r10, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR 40[rsp], r8d
	mov	DWORD PTR 32[rsp], ecx
	mov	r8, r10
	mov	rcx, rax
	call	_Z15matrix_multiplyPfS_S_iii
	lea	rax, .LC5[rip]
	mov	rdx, rax
	mov	rax, QWORD PTR .refptr._ZSt4cout[rip]
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	DWORD PTR -12[rbp], 0
	jmp	.L30
.L33:
	mov	DWORD PTR -16[rbp], 0
	jmp	.L31
.L32:
	mov	eax, DWORD PTR -92[rbp]
	imul	eax, DWORD PTR -12[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR -16[rbp]
	add	eax, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx
	movss	xmm0, DWORD PTR [rax]
	movaps	xmm1, xmm0
	mov	rax, QWORD PTR .refptr._ZSt4cout[rip]
	mov	rcx, rax
	call	_ZNSolsEf
	mov	rcx, rax
	lea	rax, .LC6[rip]
	mov	rdx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	add	DWORD PTR -16[rbp], 1
.L31:
	mov	eax, DWORD PTR -92[rbp]
	cmp	DWORD PTR -16[rbp], eax
	jl	.L32
	mov	rax, QWORD PTR .refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_[rip]
	mov	rdx, rax
	mov	rax, QWORD PTR .refptr._ZSt4cout[rip]
	mov	rcx, rax
	call	_ZNSolsEPFRSoS_E
	add	DWORD PTR -12[rbp], 1
.L30:
	mov	eax, DWORD PTR -84[rbp]
	cmp	DWORD PTR -12[rbp], eax
	jl	.L33
	cmp	QWORD PTR -48[rbp], 0
	je	.L34
	mov	rax, QWORD PTR -48[rbp]
	mov	rcx, rax
	call	_ZdaPv
.L34:
	mov	edx, DWORD PTR -84[rbp]
	mov	eax, DWORD PTR -92[rbp]
	imul	eax, edx
	cdqe
	movabs	rdx, 2305843009213693950
	cmp	rdx, rax
	jb	.L35
	sal	rax, 2
	mov	rcx, rax
	call	_Znay
	mov	QWORD PTR -48[rbp], rax
	mov	ecx, DWORD PTR -92[rbp]
	mov	edx, DWORD PTR -88[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8d, ecx
	mov	rcx, rax
	call	_Z15transposeMatrixPfii
	mov	QWORD PTR -56[rbp], rax
	mov	DWORD PTR -60[rbp], 0
	mov	DWORD PTR -64[rbp], 0
	call	_ZNSt6chrono3_V212system_clock3nowEv
	mov	QWORD PTR -104[rbp], rax
	mov	r11d, DWORD PTR -92[rbp]
	mov	esi, DWORD PTR -84[rbp]
	mov	edi, DWORD PTR -88[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	r10, QWORD PTR -32[rbp]
	mov	rbx, QWORD PTR -48[rbp]
	mov	r12d, DWORD PTR -60[rbp]
	mov	r13d, DWORD PTR -64[rbp]
/APP
 # 94 "main.cpp" 1
	mov $0, %rax
mov $0, %ecx
mov $0, %r8
mult_outer:
add $3, %r8
mov $0, r12d
mult_inner:
mov $0, %r9
pxor %xmm0, %xmm0
mult_inner_loop:
mov r12d, %ebx
add %rbx, %r9
mov r13d, %ebx
add %rbx, %r8
movups (rax, %r9, 4), %xmm1
movups (r10, %r8, 4), %xmm2
mulps %xmm1, %xmm2
haddps %xmm2, %xmm2
addps %xmm2, %xmm0
add $0x1, %r9
add $0x1, %r8
cmp $0x3, %r9
jl mult_inner_loop
movss %xmm0, (rbx, %rax, 4)
inc %rax
inc r12d
cmp $0x2, r12d
jl mult_inner
inc r13d

 # 0 "" 2
/NO_APP
	call	_ZNSt6chrono3_V212system_clock3nowEv
	mov	QWORD PTR -112[rbp], rax
	cmp	QWORD PTR -56[rbp], 0
	je	.L37
	jmp	.L48
.L35:
	call	__cxa_throw_bad_array_new_length
.L48:
	mov	rax, QWORD PTR -56[rbp]
	mov	rcx, rax
	call	_ZdaPv
.L37:
	lea	rax, .LC7[rip]
	mov	rdx, rax
	mov	rax, QWORD PTR .refptr._ZSt4cout[rip]
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	DWORD PTR -20[rbp], 0
	jmp	.L38
.L41:
	mov	DWORD PTR -24[rbp], 0
	jmp	.L39
.L40:
	mov	eax, DWORD PTR -92[rbp]
	imul	eax, DWORD PTR -20[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR -24[rbp]
	add	eax, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx
	movss	xmm0, DWORD PTR [rax]
	movaps	xmm1, xmm0
	mov	rax, QWORD PTR .refptr._ZSt4cout[rip]
	mov	rcx, rax
	call	_ZNSolsEf
	mov	rcx, rax
	lea	rax, .LC6[rip]
	mov	rdx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	add	DWORD PTR -24[rbp], 1
.L39:
	mov	eax, DWORD PTR -92[rbp]
	cmp	DWORD PTR -24[rbp], eax
	jl	.L40
	mov	rax, QWORD PTR .refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_[rip]
	mov	rdx, rax
	mov	rax, QWORD PTR .refptr._ZSt4cout[rip]
	mov	rcx, rax
	call	_ZNSolsEPFRSoS_E
	add	DWORD PTR -20[rbp], 1
.L38:
	mov	eax, DWORD PTR -84[rbp]
	cmp	DWORD PTR -20[rbp], eax
	jl	.L41
	lea	rax, .LC8[rip]
	mov	rdx, rax
	mov	rax, QWORD PTR .refptr._ZSt4cout[rip]
	mov	rcx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rbx, rax
	lea	rdx, -104[rbp]
	lea	rax, -112[rbp]
	mov	rcx, rax
	call	_ZNSt6chronomiINS_3_V212system_clockENS_8durationIxSt5ratioILx1ELx1000000000EEEES6_EENSt11common_typeIJT0_T1_EE4typeERKNS_10time_pointIT_S8_EERKNSC_ISD_S9_EE
	mov	QWORD PTR -72[rbp], rax
	lea	rax, -72[rbp]
	mov	rcx, rax
	call	_ZNSt6chrono13duration_castINS_8durationIxSt5ratioILx1ELx1000EEEExS2_ILx1ELx1000000000EEEENSt9enable_ifIXsrNS_13__is_durationIT_EE5valueES8_E4typeERKNS1_IT0_T1_EE
	mov	QWORD PTR -80[rbp], rax
	lea	rax, -80[rbp]
	mov	rcx, rax
	call	_ZNKSt6chrono8durationIxSt5ratioILx1ELx1000EEE5countEv
	mov	rdx, rax
	mov	rcx, rbx
	call	_ZNSolsEx
	mov	rcx, rax
	lea	rax, .LC9[rip]
	mov	rdx, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	rcx, rax
	mov	rax, QWORD PTR .refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_[rip]
	mov	rdx, rax
	call	_ZNSolsEPFRSoS_E
	cmp	QWORD PTR -32[rbp], 0
	je	.L42
	mov	rax, QWORD PTR -32[rbp]
	mov	rcx, rax
	call	_ZdaPv
.L42:
	cmp	QWORD PTR -40[rbp], 0
	je	.L43
	mov	rax, QWORD PTR -40[rbp]
	mov	rcx, rax
	call	_ZdaPv
.L43:
	cmp	QWORD PTR -48[rbp], 0
	je	.L44
	mov	rax, QWORD PTR -48[rbp]
	mov	rcx, rax
	call	_ZdaPv
.L44:
	mov	eax, 0
	add	rsp, 168
	pop	rbx
	pop	rsi
	pop	rdi
	pop	r12
	pop	r13
	pop	rbp
	ret
	.seh_endproc
	.section	.text$_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIxSt5ratioILx1ELx1000000000EEEEE16time_since_epochEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIxSt5ratioILx1ELx1000000000EEEEE16time_since_epochEv
	.def	_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIxSt5ratioILx1ELx1000000000EEEEE16time_since_epochEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIxSt5ratioILx1ELx1000000000EEEEE16time_since_epochEv
_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIxSt5ratioILx1ELx1000000000EEEEE16time_since_epochEv:
.LFB7626:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	pop	rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt6chronomiINS_3_V212system_clockENS_8durationIxSt5ratioILx1ELx1000000000EEEES6_EENSt11common_typeIJT0_T1_EE4typeERKNS_10time_pointIT_S8_EERKNSC_ISD_S9_EE,"x"
	.linkonce discard
	.globl	_ZNSt6chronomiINS_3_V212system_clockENS_8durationIxSt5ratioILx1ELx1000000000EEEES6_EENSt11common_typeIJT0_T1_EE4typeERKNS_10time_pointIT_S8_EERKNSC_ISD_S9_EE
	.def	_ZNSt6chronomiINS_3_V212system_clockENS_8durationIxSt5ratioILx1ELx1000000000EEEES6_EENSt11common_typeIJT0_T1_EE4typeERKNS_10time_pointIT_S8_EERKNSC_ISD_S9_EE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6chronomiINS_3_V212system_clockENS_8durationIxSt5ratioILx1ELx1000000000EEEES6_EENSt11common_typeIJT0_T1_EE4typeERKNS_10time_pointIT_S8_EERKNSC_ISD_S9_EE
_ZNSt6chronomiINS_3_V212system_clockENS_8durationIxSt5ratioILx1ELx1000000000EEEES6_EENSt11common_typeIJT0_T1_EE4typeERKNS_10time_pointIT_S8_EERKNSC_ISD_S9_EE:
.LFB7658:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	rcx, rax
	call	_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIxSt5ratioILx1ELx1000000000EEEEE16time_since_epochEv
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	_ZNKSt6chrono10time_pointINS_3_V212system_clockENS_8durationIxSt5ratioILx1ELx1000000000EEEEE16time_since_epochEv
	mov	QWORD PTR -8[rbp], rax
	lea	rdx, -16[rbp]
	lea	rax, -8[rbp]
	mov	rcx, rax
	call	_ZNSt6chronomiIxSt5ratioILx1ELx1000000000EExS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt6chrono13duration_castINS_8durationIxSt5ratioILx1ELx1000EEEExS2_ILx1ELx1000000000EEEENSt9enable_ifIXsrNS_13__is_durationIT_EE5valueES8_E4typeERKNS1_IT0_T1_EE,"x"
	.linkonce discard
	.globl	_ZNSt6chrono13duration_castINS_8durationIxSt5ratioILx1ELx1000EEEExS2_ILx1ELx1000000000EEEENSt9enable_ifIXsrNS_13__is_durationIT_EE5valueES8_E4typeERKNS1_IT0_T1_EE
	.def	_ZNSt6chrono13duration_castINS_8durationIxSt5ratioILx1ELx1000EEEExS2_ILx1ELx1000000000EEEENSt9enable_ifIXsrNS_13__is_durationIT_EE5valueES8_E4typeERKNS1_IT0_T1_EE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6chrono13duration_castINS_8durationIxSt5ratioILx1ELx1000EEEExS2_ILx1ELx1000000000EEEENSt9enable_ifIXsrNS_13__is_durationIT_EE5valueES8_E4typeERKNS1_IT0_T1_EE
_ZNSt6chrono13duration_castINS_8durationIxSt5ratioILx1ELx1000EEEExS2_ILx1ELx1000000000EEEENSt9enable_ifIXsrNS_13__is_durationIT_EE5valueES8_E4typeERKNS1_IT0_T1_EE:
.LFB7659:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	_ZNSt6chrono20__duration_cast_implINS_8durationIxSt5ratioILx1ELx1000EEEES2_ILx1ELx1000000EExLb1ELb0EE6__castIxS2_ILx1ELx1000000000EEEES4_RKNS1_IT_T0_EE
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section	.text$_ZNKSt6chrono8durationIxSt5ratioILx1ELx1000EEE5countEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNKSt6chrono8durationIxSt5ratioILx1ELx1000EEE5countEv
	.def	_ZNKSt6chrono8durationIxSt5ratioILx1ELx1000EEE5countEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt6chrono8durationIxSt5ratioILx1ELx1000EEE5countEv
_ZNKSt6chrono8durationIxSt5ratioILx1ELx1000EEE5countEv:
.LFB7660:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	pop	rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt6chronomiIxSt5ratioILx1ELx1000000000EExS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_,"x"
	.linkonce discard
	.globl	_ZNSt6chronomiIxSt5ratioILx1ELx1000000000EExS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_
	.def	_ZNSt6chronomiIxSt5ratioILx1ELx1000000000EExS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6chronomiIxSt5ratioILx1ELx1000000000EExS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_
_ZNSt6chronomiIxSt5ratioILx1ELx1000000000EExS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_:
.LFB7776:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 72
	.seh_stackalloc	72
	lea	rbp, 64[rsp]
	.seh_setframe	rbp, 64
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	QWORD PTR 40[rbp], rdx
	mov	rax, QWORD PTR 32[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, -16[rbp]
	mov	rcx, rax
	call	_ZNKSt6chrono8durationIxSt5ratioILx1ELx1000000000EEE5countEv
	mov	rbx, rax
	mov	rax, QWORD PTR 40[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, -8[rbp]
	mov	rcx, rax
	call	_ZNKSt6chrono8durationIxSt5ratioILx1ELx1000000000EEE5countEv
	sub	rbx, rax
	mov	rdx, rbx
	mov	QWORD PTR -24[rbp], rdx
	lea	rdx, -24[rbp]
	lea	rax, -32[rbp]
	mov	rcx, rax
	call	_ZNSt6chrono8durationIxSt5ratioILx1ELx1000000000EEEC1IxvEERKT_
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 72
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt6chrono20__duration_cast_implINS_8durationIxSt5ratioILx1ELx1000EEEES2_ILx1ELx1000000EExLb1ELb0EE6__castIxS2_ILx1ELx1000000000EEEES4_RKNS1_IT_T0_EE,"x"
	.linkonce discard
	.globl	_ZNSt6chrono20__duration_cast_implINS_8durationIxSt5ratioILx1ELx1000EEEES2_ILx1ELx1000000EExLb1ELb0EE6__castIxS2_ILx1ELx1000000000EEEES4_RKNS1_IT_T0_EE
	.def	_ZNSt6chrono20__duration_cast_implINS_8durationIxSt5ratioILx1ELx1000EEEES2_ILx1ELx1000000EExLb1ELb0EE6__castIxS2_ILx1ELx1000000000EEEES4_RKNS1_IT_T0_EE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6chrono20__duration_cast_implINS_8durationIxSt5ratioILx1ELx1000EEEES2_ILx1ELx1000000EExLb1ELb0EE6__castIxS2_ILx1ELx1000000000EEEES4_RKNS1_IT_T0_EE
_ZNSt6chrono20__duration_cast_implINS_8durationIxSt5ratioILx1ELx1000EEEES2_ILx1ELx1000000EExLb1ELb0EE6__castIxS2_ILx1ELx1000000000EEEES4_RKNS1_IT_T0_EE:
.LFB7777:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	_ZNKSt6chrono8durationIxSt5ratioILx1ELx1000000000EEE5countEv
	mov	rcx, rax
	movabs	rdx, 4835703278458516699
	mov	rax, rcx
	imul	rdx
	mov	rax, rdx
	sar	rax, 18
	sar	rcx, 63
	mov	rdx, rcx
	sub	rax, rdx
	mov	QWORD PTR -8[rbp], rax
	lea	rdx, -8[rbp]
	lea	rax, -16[rbp]
	mov	rcx, rax
	call	_ZNSt6chrono8durationIxSt5ratioILx1ELx1000EEEC1IxvEERKT_
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt6chrono8durationIxSt5ratioILx1ELx1000EEEC1IxvEERKT_,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt6chrono8durationIxSt5ratioILx1ELx1000EEEC1IxvEERKT_
	.def	_ZNSt6chrono8durationIxSt5ratioILx1ELx1000EEEC1IxvEERKT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6chrono8durationIxSt5ratioILx1ELx1000EEEC1IxvEERKT_
_ZNSt6chrono8durationIxSt5ratioILx1ELx1000EEEC1IxvEERKT_:
.LFB7857:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR 16[rbp]
	mov	QWORD PTR [rax], rdx
	nop
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE:
	.byte	1
_ZNSt8__detail30__integer_to_chars_is_unsignedImEE:
	.byte	1
_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE:
	.byte	1
	.ident	"GCC: (Rev5, Built by MSYS2 project) 13.2.0"
	.def	_Znay;	.scl	2;	.type	32;	.endef
	.def	__cxa_throw_bad_array_new_length;	.scl	2;	.type	32;	.endef
	.def	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc;	.scl	2;	.type	32;	.endef
	.def	_ZNSirsERi;	.scl	2;	.type	32;	.endef
	.def	_ZNSirsERf;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEf;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEPFRSoS_E;	.scl	2;	.type	32;	.endef
	.def	_ZdaPv;	.scl	2;	.type	32;	.endef
	.def	_ZNSt6chrono3_V212system_clock3nowEv;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEx;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, "dr"
	.globl	.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	.linkonce	discard
.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_:
	.quad	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	.section	.rdata$.refptr._ZSt3cin, "dr"
	.globl	.refptr._ZSt3cin
	.linkonce	discard
.refptr._ZSt3cin:
	.quad	_ZSt3cin
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
