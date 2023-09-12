.data
mensaje1: .asciiz "Serie Fibonacci"
numero1: .word 0
numero2: .word 1
suma: .word 0

.text
.globl main
main:
    # Se muestra al usuario el titulo de la serie
    li $v0, 4
    la $a0, mensaje1
    syscall
    
    # Imprimir un carácter de nueva línea
    li $v0, 11          # Código de operación para imprimir un carácter
    li $a0, 10          # Código ASCII para nueva línea (\n)
    syscall
    
    # Comenzamos a imprimir la serie en pantalla
    lw $a0, numero1
    li $v0, 1
    syscall 
    
    # Imprimir un carácter de nueva línea
    li $v0, 11          # Código de operación para imprimir un carácter
    li $a0, 10          # Código ASCII para nueva línea (\n)
    syscall
    
    lw $a0, numero2
    li $v0, 1
    syscall
    
    # Cargar el primer número en $t0 y $t3
    lw $t0, numero1
    lw $t3, numero1

    # Cargar el segundo número en $t1 y $t4
    lw $t1, numero2
    lw $t4, numero2

bucle:
    # $t3 es utilizado como un contador, mientras que $t4 es el paso del bucle
    add $t3, $t4, $t3
    
    # Imprimir un carácter de nueva línea
    li $v0, 11          # Código de operación para imprimir un carácter
    li $a0, 10          # Código ASCII para nueva línea (\n)
    syscall

    # Sumar $t0 y $t1 y guardar el resultado en $t2
    add $t2, $t0, $t1

    # Guardar el resultado en la variable 'suma'
    sw $t2, suma
    
    # Movemos numero para calcular el siguiente numero de la serie
    move $t0, $t1
    move $t1, $t2
    
    # Imprimimos nuevo numero de la serie
    lw $a0, suma
    li $v0, 1
    syscall
    
    # Hacemos un bucle para imprimir en pantalla 9 numeros de la serie
    blt $t3, 9, bucle
    
    # Termina el programa
    li $v0, 10
    syscall
