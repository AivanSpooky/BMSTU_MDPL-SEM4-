EXTRN NUMBER : WORD
EXTRN TOSBIN : NEAR

PUBLIC FINDMINPOW

DATASEG SEGMENT PARA PUBLIC 'DATA'
    OUTMINPOWMSG DB 'Minimum power of 2 exceeding input: $'
DATASEG ENDS

CODESEG SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:CODESEG
FINDMINPOW PROC NEAR
    ; 'Minimum power of 2 exceeding input: $'
    MOV AH, 9
    MOV DX, OFFSET OUTMINPOWMSG
    INT 21H

    CALL TOSBIN

    ; С самого начала задаем маску для числа с левым битом
    MOV AX, NUMBER
    MOV BX, 8000h
    MOV CX, 15
    GETBIN:
        ; каждый раз делаем конъюнкцию с числом и маской
        ; если результат 1 - нашли старший бит
        MOV DX, AX
        AND DX, BX
        CMP DX, 0
        JG FIND_TWO

        ; сдвигаем бит маски на один разряд вправо и уменьшаем счетчик цифры
        SAR BX, 1
        DEC CX
        CMP CX, -1
        JNE GETBIN


    FIND_TWO:
    CMP DI, 1
    JNE ENDLOOP ; обработка отриц. числа
    MOV CX, 16
    DEC CX

    ENDLOOP: ; вывод инфы эхом е-мае
    INC CX
    MOV AH, 2
    MOV DL, '2'
    INT 21H
    MOV AH, 2
    MOV DL, '^'
    INT 21H
    ; степень
    MOV DX, 0
    mov AX, CX
    CMP AX, 10
    JL onnes
    ; степень больше 10 => выводим сначала десятки, потом единицы
    MOV DX, 0
    MOV BX, CX
    MOV AX, BX
    MOV BX, 10
    DIV BX
    MOV BL, DL

    MOV DL, AL
    ADD DX, '0'
    MOV AH, 2
    INT 21H
    MOV AL, BL

    onnes:
    MOV DL, AL
    ADD DX, '0'
    MOV AH, 2
    INT 21H

    RET
FINDMINPOW ENDP
CODESEG ENDS
END