.MODEL small
.DATA

cadena1 DB '123$'
cadena2 DB 'ABC$'

.CODE
programa:
;Cargar programas
    Mov AX,@DATA
    MOV DS, AX
;Cargar datos
    XOR DX, DX; limpia el registro indicado
    MOV DL, offset cadena1 ; mover variable a registro
;Imprimir cadena1
    MOV AH, 09h
    INT 21h
;Imprimir cadena2
    XOR DX,DX ;limpia el registro indicado
    MOV DL, offset cadena2 ; mover variable a registro
    ;Imprimir cadena
    INT 21h
 
;Swap de las variables
    LEA SI, cadena1
    LEA DI, cadena2
    MOV CX, 3   ; se asume que cadenas1 y cadena2 son de longitud 3
;Loop que copia intercambia cada char entre cadenas
copy_char:
    MOV DL, [SI]    ; guardamos el char de cadena1
    MOV DH, [DI]    ; guardamos el char de cadena2
    MOV [SI], DH    ; copio el char de cadena2 a cadena1
    MOV [DI], DL    ; copio el char de cadena1 a cadena2
    INC SI          ; movemos el puntero al siguiente char
    INC DI          
    DEC CX          ; decremento a variable de control
    JNZ copy_char   ; cambiar siguiente bit
    ;continuar
;Cargar datos
    XOR DX, DX  ;limpia el registro indicado
    MOV DX, offset cadena1  ;Puntero al segmento de datos
;Imprimir cadena
    MOV AH, 09h
    INT 21h     ;Interrumpe el procesador y le indica que ejecute lo que esta en DX
;Imprimir cadena2
    XOR DX, DX  ;limpia el registro indicado
    MOV DX, offset cadena2  ;Puntero al segmento de datos
;Imprimir cadena
    INT 21h     ;Interrumpe el procesador y le indica que ejecute lo que esta en DX

;Finalizando el programa
    MOV AH, 4Ch
    INT 21h
.STACK
END programa  