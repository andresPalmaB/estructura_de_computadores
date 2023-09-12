.data
mensaje1: .asciiz "Por favor, ingresa el primer número: "
mensaje2: .asciiz "Por favor, ingresa el segundo número: "
mensaje3: .asciiz "Por favor, ingresa el tercer número: "
respuesta: .asciiz "El número mayor es: "
numero1: .word 0
numero2: .word 0
numero3: .word 0
mayor: .word 0

.text
.globl main
main:
    # Pide al usuario que ingrese el primer número
    li $v0, 4
    la $a0, mensaje1
    syscall

    # Lee el primer número ingresado por el usuario
    li $v0, 5
    syscall
    sw $v0, numero1

    # Pide al usuario que ingrese el segundo número
    li $v0, 4
    la $a0, mensaje2
    syscall

    # Lee el segundo número ingresado por el usuario
    li $v0, 5
    syscall
    sw $v0, numero2

    # Pide al usuario que ingrese el tercer número
    li $v0, 4
    la $a0, mensaje3
    syscall

    # Lee el tercer número ingresado por el usuario
    li $v0, 5
    syscall
    sw $v0, numero3

    # Compara los números para encontrar el mayor
    lw $t0, numero1
    lw $t1, numero2
    bgt $t0, $t1, no_es_mayor1
    move $t0, $t1

no_es_mayor1:
    lw $t1, numero3
    bgt $t0, $t1, no_es_mayor2
    move $t0, $t1

no_es_mayor2:
    sw $t0, mayor

    # Imprime el resultado
    li $v0, 4
    la $a0, respuesta
    syscall

    lw $a0, mayor
    li $v0, 1
    syscall

    # Termina el programa
    li $v0, 10
    syscall
