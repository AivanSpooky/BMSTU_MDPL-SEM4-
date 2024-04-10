PUBLIC NUMBER
PUBLIC INCMD
PUBLIC INSGNOCT

DATASEG SEGMENT PARA PUBLIC 'DATA'
    NUMBER DW 0
    INMSG DB 'Enter signed octal number: $'
    INVALIDMSG DB 13, 10, 'Invalid input! Number must be in the range from -100000 to 77777 and should not contain digits 8 or 9.$'
DATASEG ENDS

CODESEG SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:CODESEG, DS:DATASEG

; Выбор команды
INCMD PROC NEAR
    MOV AH, 1
    INT 21H
    SUB AL, '0'
    ; выполняю умножение для опредедения смещения для выбора команды (размер каждой word=2)
    MOV CL, 2
    MUL CL
    MOV SI, AX
    RET
INCMD ENDP
; Ввод знакового в 8-ой с/с
INSGNOCT PROC NEAR
    ; 'Enter signed octal number: $'
    MOV AH, 9
    MOV DX, OFFSET INMSG
    INT 21H

    ; SI отвечает за количество считанных цифр
    ; DI отвечает за знак минус (есть или нет)
    ; BX отвечает за введенное число 
    MOV BX, 0
    MOV DI, 0

    MOV SI, 0

    INSYMB:
        MOV AH, 1
        INT 21H
        ; нажали ентер - вышли
        CMP AL, 13
        JE ENDINP
        ; нашли минус - надо проверить на валидность числа
        CMP AL, '-'
        JE FIND_NEG
        ; проверка на недопустимые символы
        SUB AL, '0'
        CMP AL, 8
        JGE INVALID_INPUT

        ; Сохраняем текущее значение BX
        MOV CL, 3
        SHL BX, CL
        ADD BL, AL

        INC SI
        JMP INSYMB
    ; Проверяем на выход за границы
    ENDINP:
        CMP SI, 0
        JE INVALID_INPUT
        CMP SI, 5
        JG PROG_NEG
        CHECK_NEG:
        CMP DI, 1
        JNE POS
        NEG BX
        POS:
        MOV NUMBER, BX
        RET

    FIND_NEG:
        CMP SI, 0
        JNE INVALID_INPUT
        CMP DI, 1
        JE INVALID_INPUT
        MOV DI, 1
        JMP INSYMB

    INVALID_INPUT:
        MOV AH, 9
        MOV DX, OFFSET INVALIDMSG
        INT 21H
        RET

    PROG_NEG:
        CMP DI, 0
        JE INVALID_INPUT
        CMP SI, 7
        JG INVALID_INPUT
        NEG BX
        CMP BX, 32768
        JNE INVALID_INPUT
        NEG BX
        JMP CHECK_NEG

INSGNOCT ENDP

CODESEG ENDS
END
