STK SEGMENT PARA STACK 'STACK'
    db 20h dup(0)
STK ENDS

DSEG1 SEGMENT PARA PUBLIC 'DATA'
    X db 100 DUP(0)
    org 0h
    X_MAX_SIZE byte 97
    X_STRING_SIZE byte 0
    X_STRING byte '$'
DSEG1 ENDS

DSEG2 SEGMENT PARA PUBLIC 'DATA'
    ORG 100
    SUM db '$'
    
DSEG2 ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG, DS:DSEG1, SS:STK

read_string:

    mov dx, si          ; Загружаем адрес буфера
    mov ah, 0Ah         ; Системный вызов для чтения строки
    int 21h             ; Вызываем прерывание 21h
    ret

output_SUM:
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    mov dx, offset SUM ; Загружаем адрес строки
    mov ah, 09h        ; Системный вызов для вывода строки
    int 21h            ; Вызываем прерывание 21h
    ret

main:
    mov ax, DSEG1
    mov ds, ax

    ; Ввод строки цифр от 0 до 5 в первый сегмент
    mov si, offset X
    call read_string

    ; Проверяем введенные цифры на корректность и находим сумму 1-й и 3-й цифр
    mov al, [X_STRING]     ; Загружаем первую цифру
    sub al, '0'         ; Преобразуем ASCII-код цифры в число
    mov bl, [X_STRING + 2]     ; Загружаем третью цифру
    sub bl, '0'         ; Преобразуем ASCII-код цифры в число
    add al, bl          ; Складываем числа
    add al, '0'

    ; Если сумма равна 10, то заменяем ее на 'A'
    cmp al, '9'         ; Сравниваем с '9'
    jbe skip_correction ; Переходим, если меньше или равно '9'
    mov al, 'A'         ; Иначе заменяем на 'A'
skip_correction:
    ; Записываем сумму во второй сегмент
    assume ds:DSEG2
    mov [SUM], al

    call output_SUM

    mov ax, 4c00h
    int 21h
CSEG ENDS
END main
