EXTRN input_digit_from_stdin: near
EXTRN print_str_to_stdout: near
EXTRN print_char_to_stdout: near
EXTRN print_space_to_stdout: near
EXTRN print_newline_to_stdout: near

STACKSEG SEGMENT PARA STACK 'STACK'
	DB 100h dup(0)
STACKSEG ENDS

DATASEG SEGMENT 'matrix'
    mess_input_count_rows DB 10, 'Input rows count: ', '$'
	mess_input_count_cols DB 10, 'Input columns count: ', '$'
	mess_input_matrix DB 10, 10, 'Input matrix:', 13, 10, '$'
	mess_result DB 10, 10, 'Result:', 13, 10, '$'
	mess_empty_res DB 10, 'Empty result', 10, '$'
	mess_error_input_rows DB 10, 10, 'Rows count must be a positive number', 10, '$'
	mess_error_input_cols DB 10, 10, 'Columns count must be a positive number', 10, '$'
	max_sum DB ?
	ind_col DB ?
	count_rows DB ?
	count_columns DB ?
	STEP DW 0
	beger DB 40
	matrix DB 9 * 9 dup (0)
	ender DB 40
DATASEG ENDS

CODESEG SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:CODESEG, DS:DATASEG

error_input_count_rows:
	mov bx, OFFSET mess_error_input_rows        
	call print_str_to_stdout

	mov ah, 4Ch
	int 21h  

error_input_count_cols:
	mov bx, OFFSET mess_error_input_cols        
	call print_str_to_stdout

	mov ah, 4Ch
	int 21h    

empty_res:
    lea bx, mess_empty_res        
	call print_str_to_stdout

	mov ah, 4Ch
	int 21h 

main:
	mov ax, DATASEG
    mov ds, ax 
	
	; ВВОД КОЛИЧЕСТВА СТРОК
	mov bx, OFFSET mess_input_count_rows         
	call print_str_to_stdout
	; считывание символа и запись в кол-во строк
	call input_digit_from_stdin           
	mov count_rows, al
	; проверка на входимость значения в диапазон (0, 9)
	cmp count_rows, 0
	jle error_input_count_rows
	cmp count_rows, 9 
	jg error_input_count_rows
	
	; ВВОД КОЛИЧЕСТВА СТОЛБЦОВ
	mov bx, OFFSET mess_input_count_cols        
	call print_str_to_stdout
	; считывание символа и запись в кол-во столбцов
	call input_digit_from_stdin 
	mov count_columns, al  
	; проверка на входимость значения в диапазон (0, 9)
	cmp count_columns, 0                  
	jle error_input_count_cols
	cmp count_columns, 9 
	jg error_input_count_cols

	; ВВОД МАТРИЦЫ
	mov bx, OFFSET mess_input_matrix            
	call print_str_to_stdout

	mov ch, 0 ; ch - счетчик по строкам
	mov si, 0 ; si - счетчик по строкам (в формате ind + 9 * ch)
	input_row: 
		mov bx, 0  ; bx - счетчик по столбцам
		mov cl, 0  ; cl - счетчик по столбцам
		input_col:
			; считывание элемента
			mov ah, 1                     
			int 21h
			; запись элемента в матрицу
			mov matrix[si][bx], al
			inc bx

			call print_space_to_stdout

			; бегаем в цикле, пока не заполнили текущую строку (по столбцам)
			inc cl
			cmp cl, count_columns
			jne input_col

		call print_newline_to_stdout

		add si, 9

		inc ch
		cmp ch, count_rows
		jne input_row

	; обработка пустого результата
	cmp count_columns, 1                  
	je empty_res
	
	; ПОИСК СТОЛБЦА С МАКСИМАЛЬНОЙ СУММОЙ ЭЛЕМЕНТОВ
	mov si, 0               ; si - индекс строки в исходной матрице
	mov bx, 0
	mov al, matrix[si][bx]  ; al - текущий элемент матрицы
	mov max_sum, 0          ; Инициализация максимальной суммы наименьшим значением

	mov ch, 0       ; ch - индекс столбца с максимальной суммой элементов
	mov ind_col, 0  ; ind_col - индекс столбца с максимальной суммой элементов

	find_max_sum_col:   ; Цикл по столбцам
		mov cl, 0       ; cl - индекс элемента в столбце
		mov ah, 0       ; ah - сумма элементов в столбце

		sum_col_elements:                   ; Цикл суммирования элементов в столбце
			; Суммируем элемент данной строки в сумму этого столбца
			mov al, matrix[si][bx]          
            sub al, '0'
			add ah, al

			; Переход к следующему элементу в столбце
			add si, 9

			; Итерируемся, пока не достигнут конец столбца
			inc cl
			cmp cl, count_rows              
			jne sum_col_elements            ; Если нет, продолжаем суммирование элементов

		; Если текущая сумма меньше или равна максимальной, переходим к следующему столбцу
		cmp ah, max_sum
		jle next_col                        

		; Обновление максимальной суммы
		mov max_sum, ah  
		mov ind_col, ch  

		next_col:
			; Переход к следующему столбцу
			mov si, 0                     
			inc ch                              
			inc bx              

			; Продолжаем поиск максимальной суммы в столбц, пока не прошлись по всем столбцам 
			cmp ch, count_columns   
			jne find_max_sum_col      


    ; УДАЛЯЕМ СТОЛБЕЦ С МАКСИМАЛЬНОЙ СУММОЙ ЭЛЕМЕНТОВ
	mov cx, 0
	mov ch, 0 ; ch - счетчик по строкам
	mov bx, 0 ; bx - счетчик по столбцам
	mov si, 0 ; si - индекс строки в исходной матрице
    ;mov bp, 0

	del_col_loop:
		cmp ind_col, ch ; Проверяем, равен ли текущий столбец тому, который нужно удалить
		je add_step ; Если да, увеличиваем смещение
        mov cl, 0

		copy_elem_loop:
			add bx, STEP 
			mov al, matrix[si][bx]      ; Загружаем элемент из исходной матрицы
			sub bx, STEP
			mov matrix[si][bx], al      ; Записываем элемент в новую матрицу

			add si, 9                       ; Переходим к следующему элементу в строке
			inc cl
			cmp cl, count_rows        ; Проверяем, достигли ли конца строки
			jne copy_elem_loop           ; Если нет, продолжаем копировать элементы

		inc ch
		jmp column_processed

        add_step:
			add STEP, 1
			jmp copy_elem_loop

		column_processed:
			; Переходим к следующей строке в исходной матрице
			mov si, 0                       
            inc bx
			; Проверяем, достигли ли конца матрицы. Если нет, продолжаем проходить по строкам
            cmp ch, count_columns            
            jne del_col_loop

	; уменьшаем кол-во столбцов для корректного вывода
    dec count_columns                        

	; ВЫВОД МАТРИЦЫ
	mov bx, OFFSET mess_result          
	call print_str_to_stdout

	mov ch, 0   ; ch - счетчик по строкам
	mov si, 0   ; si - индекс  строки
	print_row: 
		mov bx, 0    ; bx - индекс столбца
		mov cl, 0    ; сl - счетчик по столбцам
		print_col:
			mov ah, 2
			mov dl, matrix[si][bx]
			int 21h

			call print_space_to_stdout

			inc bx

			inc cl
			cmp cl, count_columns
			jne print_col

		add si, 9

		call print_newline_to_stdout

		inc ch
		cmp ch, count_rows
		jne print_row

	; завершаем программу
	mov ah, 4Ch
	int 21h            
	
CODESEG ENDS
END main