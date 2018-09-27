.MODEL SMALL
.DATA
msgNum DB ' Numero: $'
msgSuma DB ' Sumar: $'
msgRestar DB ' Restar: $'
msgMult DB ' Mutl: $'
msgDiv DB ' Div: $'
msgRes DB ' Res: $'
numero1 DW ? 
numero2 DW ?
residuo DW ?
.CODE
EJERCICIO2:
    MOV AX, @DATA
    MOV DS, AX
    XOR AX, AX

    ;Mostrar mensaje de numero
    XOR DX, DX
    XOR AX, AX
    MOV DX, offset msgNum
    MOV AH, 09h
    INT 21H
    
    ; Leer dato1
    XOR AX, AX
    MOV AH, 01h
    INT 21H
    SUB AL, 30h ;usar solopp cuando se quiere el numero no el char
    SUB AH, 01h ;limpiar AH para evitar cargar a numero valores incorrectos
    MOV numero1, AX
    
    ;Mostrar mensaje de numero 
    XOR DX, DX
    XOR AX, AX
    MOV DX, offset msgNum
    MOV AH, 09h
    INT 21H
    
    ; Leer dato2
    XOR AX, AX
    MOV AH, 01h
    INT 21H
    SUB AX, 30h
    SUB AH, 01h ;limpiar AH para evitar cargar a numero valores incorrectos
    MOV numero2, AX

    
    ;Mostrar mensaje suma
    XOR DX, DX 
    XOR AX, AX
    MOV DX, offset msgSuma
    MOV AH, 09h
    INT 21H
    
    ; Sumar
    XOR DX, DX
    XOR AX, AX
    XOR BX, BX
    MOV AX, numero1
    ADD AX, numero2
    MOV residuo, AX
    
    ; obtener decimal y guardarlo en DX
    MOV BX, 0AH ; decimal 10
    DIV BX
    MOV residuo, DX ; guardo el residuo
    MOV DX, AX ; muevo el cociente a DX
    ADD DX, 30h ; Para mostrar el char del decimal
    MOV AH, 02h
    INT 21H
    ; obtener unidades y guardarlo en DX
    MOV DX, residuo
    ADD DX, 30h ; Para mostrar el char del decimal
    MOV AH, 02h
    INT 21H
    
    ;Mostrar mensaje resta 
    XOR DX, DX
    XOR AX, AX
    MOV DX, offset msgRestar
    MOV AH, 09h
    INT 21H
    
    ;Restar
    XOR DX, DX
    XOR AX, AX
    MOV DX, numero1
    SUB DX, numero2
    ADD DX, 30h
    MOV AH, 02h
    INT 21H
    
    
    ;Mostrar mensaje mult 
    XOR DX, DX
    XOR AX, AX
    MOV DX, offset msgMult
    MOV AH, 09h
    INT 21H
    
    ;Multiplicar
    XOR DX, DX
    XOR AX, AX
    MOV AX, numero1
    MUL numero2
    MOV residuo, AX
    
    ; obtener decimal y guardarlo en DX
    MOV BX, 0AH ; decimal 10
    DIV BX
    MOV residuo, DX ; guardo el residuo
    MOV DX, AX ; muevo el cociente a DX
    ADD DX, 30h ; Para mostrar el char del decimal
    MOV AH, 02h
    INT 21H
    ; obtener unidades y guardarlo en DX
    MOV DX, residuo
    ADD DX, 30h ; Para mostrar el char del decimal
    MOV AH, 02h
    INT 21H
    
    
    ;Mostrar mensaje div 
    XOR DX, DX
    XOR AX, AX
    MOV DX, offset msgDiv
    MOV AH, 09h
    INT 21H
    
    ;Dividir
    XOR DX, DX
    XOR AX, AX
    MOV AX, numero1
    DIV numero2
    MOV DX, AX
    ADD DX, 30h
    MOV AH, 02h
    INT 21H
    
    ;Mostrar mensaje res
    XOR DX, DX
    XOR AX, AX
    MOV DX, offset msgRes
    MOV AH, 09h
    INT 21H
    
    ;Dividir
    XOR DX, DX
    XOR AX, AX
    MOV AX, numero1
    DIV numero2
    ADD DX, 30h
    MOV AH, 02h
    INT 21H
 
    
    ; Fin de programa
     MOV AH,4Ch
     INT 21h
    
    ; Fin de programa
     MOV AH,4Ch
     INT 21h
     
     END EJERCICIO2
.STACK

 