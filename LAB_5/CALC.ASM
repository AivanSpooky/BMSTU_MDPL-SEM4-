EXTRN NUMBER : WORD

PUBLIC UHEX
PUBLIC SBIN
PUBLIC SIGN
PUBLIC MASK2

PUBLIC TOUHEX

DATASEG SEGMENT PARA PUBLIC 'DATA'
    MASK16 DW 15 ; 000F
    MASK2 DW 1 ; 0001
    UHEX DB 4 DUP('0'), '$'
    SBIN DB 16 DUP('0'), '$'
    SIGN DB ' '
DATASEG ENDS

CODESEG SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:CODESEG, DS:DATASEG

TOUHEX PROC NEAR
    MOV AX, NUMBER
    ; Задаем номер текущей заполняемой в 16-ой системе цифре (их всего 4) 
    MOV BX, 3
    GETHEX:
        MOV DX, AX
        ; Применяем побитовую операцию AND между значением в DX и маской MASK16, которая содержит 15 в двоичном виде.
        ; Это приводит к тому, что в DX остается только младшие 4 бита, что является значением текущей шестнадцатеричной цифры.
        AND DX, MASK16
        ; Сравниваем с 10, если больше или равно, то прибавляем 7, чтобы представить числа в виде A, B, C, D, E, F
        CMP DL, 10
        JB ISDIGIT
        ADD DL, 7

        ISDIGIT:
        ; Запись текущей цифры
        ADD DL, '0'
        MOV UHEX[BX], DL
        ; Сдвигаем число на 4 бита вправо (эквивалентно делению на 16)
        MOV CL, 4
        SAR AX, CL
        ; Уменьшаем значение BX, чтобы указать на следующий элемент массива. Продолжаем двигаться, пока не обработаем все 4 цифры
        DEC BX
        CMP BX, -1
        JNE GETHEX
    RET
TOUHEX ENDP

TOSBIN PROC NEAR
    MOV CL, ' '
    MOV SIGN, CL
    MOV AX, NUMBER

    TEST AX, 80h
    JZ NOTOVERFLOW
    ; NEG AX
    
    
    ; XOR AX, 0FFFFh
    NEG AX
    CMP DI, 1
    JNE NEXT
    ; INC AX
    

    NEXT:
    
    MOV CL, '-'
    MOV SIGN, CL
    ; JMP ENDPTR

    NOTOVERFLOW:
    MOV BX, 15
    MOV CL, 1
    GETBIN:
        ; записываем результат поразрядной конъюнкции числа и маски
        MOV DX, AX
        AND DX, MASK2
        ADD DL, '0'
        MOV SBIN[BX], DL

        ; сдвигаем число вправо на 1 разряд
        SAR AX, CL
        DEC BX
        CMP BX, 7
        JNE GETBIN
    ENDPTR:
    RET
TOSBIN ENDP

CODESEG ENDS
END