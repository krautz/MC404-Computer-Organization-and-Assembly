	@ Global symbol
	.global set_speed_motor
	.global set_speed_motors
	.global read_sonar
	.global read_sonars

	.align 4
set_speed_motor:
    stmfd sp!, {r4-r11, lr}	@ Save the callee-save registers and the return address.
	cmp r1, #0 @se o motor for o 0 chamamos a sys call para ele, caso contrario chamamos para 1
	bne write_motor1
	write_motor0:	
		mov r7, #126 @movendo para r7 a syscall de alterar a velocidade do motor 0
		b sys_call @chamando a funcao de syscall
	write_motor1:
		mov r7, #127 @movendo para r7 a syscall de alterar a velocidade do motor 1
		b sys_call @chamando a funcao de syscall

set_speed_motors:
	stmfd sp!, {r4-r11, lr}	@ Save the callee-save registers and the return address.
	mov r7, #124 @move para r7 a syscall de alterar a velociade dos 2 motores
	b sys_call @chamando a funcao syscall

read_sonar:
	stmfd sp!, {r4-r11, lr}	@ Save the callee-save registers and the return address.
	mov r7, #125 @movendo para r7 a syscall de ler um unico sonar
	b sys_call @chamando a funcao de syscall
	
sys_call:
	svc 0x0
	ldmfd sp!, {r4-r11, pc} @ Restore the registers and return

read_sonars:
	stmfd sp!, {r4-r11, lr}	@ Save the callee-save registers and the return address.
	mov r5, r0
	mov r4, #0
	loop:
		stmfd sp!, {r4-r11}	@ Save the callee-save registers and the return address.
		mov r0, r4
		mov r7, #125
		svc 0x0
		ldmfd sp!, {r4-r11} @ Restore the registers and return
		str r0, [r5], #4
		add r4, r4, #1
		cmp r4, #16
		bne loop
	ldmfd sp!, {r4-r11, pc} @ Restore the registers and return
