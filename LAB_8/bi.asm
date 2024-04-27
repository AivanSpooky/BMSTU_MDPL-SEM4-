section .text
global func_asm
global bisection_method_pure_asm

func_asm:
    ; Пролог
    push    rbp
    mov     rbp, rsp

    ; Получение аргумента x из стека
    fld     dword [rbp + 8]        ; Загрузка x в стек сопроцессора
    ; Вычисление x^3 - 7
    fmul    dword [rbp + 8]        ; x^2
    fmul    dword [rbp + 8]        ; x^3
    fild    dword [add]             ; Загрузка 7 в стек сопроцессора
    faddp                           ; x^3 - 7
    ; Вычисление cos(x^3 - 7)
    fcos
    ; Сохранение результата в регистре ST(0)
    fstp    dword [res]

    ; Эпилог
    pop     rbp
    ret

bisection_method_pure_asm:
    ; Пролог
    push    rbp
    mov     rbp, rsp

    ; Загрузка a и b из стека
    fld    dword [rbp + 8]        ; a
    fld    dword [rbp + 16]        ; b

start_loop:
    ; Вычисление c = (a + b) / 2
    fadd    st0, st1                ; a + b
    fdiv                             ; (a + b) / 2
    fstp    dword [c]                ; Сохранение c

    ; Вызов функции func_asm для c
    call    func_asm

    ; Сравнение fa * fc
    fld     dword [fa]               ; fa
    fmul    dword [fc]               ; fa * fc

    ; Если fa * fc < 0, то b = c, иначе a = c
    fldz                             ; Загрузка 0 для сравнения
    fcomip  st0, st1                 ; Сравнение fa * fc с 0
    jnl     not_negative             ; Если fa * fc >= 0, то прыгаем в not_negative
    fstp    dword [fb]               ; fa * fc < 0, значит b = c
    jmp     end_condition            ; Переходим к концу цикла
not_negative:
    fstp    dword [fa]               ; fa * fc >= 0, значит a = c

end_condition:
    ; Проверка условия окончания цикла
    fld     dword [rbp + 8]         ; a
    fld     dword [rbp + 16]         ; b
    fsub                             ; b - a
    fabs                             ; |b - a|
    fld     dword [eps]              ; eps
    fcomip  st0, st1                 ; Сравнение |b - a| и eps
    jae     start_loop               ; Если |b - a| >= eps, то повторяем цикл

    ; Вычисление (a + b) / 2
    fld     dword [rbp + 8]         ; a
    fld     dword [rbp + 16]         ; b
    fadd                             ; a + b
    fdiv                             ; (a + b) / 2
    fstp    dword [result]           ; Сохранение результата

    ; Эпилог
    pop     rbp
    ret

section .data
res:    dq 0.0
add:    dq -7.0
c:      dq 0.0
fb:     dq 0.0
fa:     dq 0.0
fc:     dq 0.0
result: dq 0.0
eps:    dq 0.000001
