EXTRN INCMD: NEAR
EXTRN INSGNOCT: NEAR
EXTRN OUTUHEX: NEAR
EXTRN OUTSBIN: NEAR
EXTRN FINDMINPOW: NEAR

EXTRN CRLF: NEAR

STACKSEG SEGMENT PARA STACK 'STACK'
    DB 200H DUP(0)
STACKSEG ENDS

DATASEG SEGMENT PARA PUBLIC 'DATA'
    MENU DB 13, 10, 'Available actions:', 13, 10, 10
        DB '0. Input signed octal number;', 13, 10
        DB '1. Convert to unsigned hexadecimal;', 13, 10
        DB '2. Convert to signed binary;', 13, 10
        DB '3. Output minimum power of 2 exceeding input;', 13, 10, 10
        DB '4. Exit program.', 13, 10, 10
        DB 'Choose action: $'
    ACTIONS DW INSGNOCT, OUTUHEX, OUTSBIN, FINDMINPOW, EXIT
DATASEG ENDS

CODESEG SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:CODESEG, DS:DATASEG, SS:STACKSEG

; ВЫВЕСТИ МЕНЮ
OUTMENU PROC NEAR
    MOV AH, 9
    MOV DX, OFFSET MENU
    INT 21H
    RET
OUTMENU ENDP
; ВЫХОД ИЗ ПРОГРАММЫ
EXIT PROC NEAR
    MOV AX, 4C00H
    INT 21H
EXIT ENDP

MAIN:
    MOV AX, DATASEG
    MOV DS, AX
    ; main - вывод меню и выбор действия
    MAINLOOP:
        CALL OUTMENU
        CALL INCMD
        CALL CRLF
        CALL ACTIONS[SI]
        JMP MAINLOOP

CODESEG ENDS
END MAIN