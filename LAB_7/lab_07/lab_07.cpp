// lab_07.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
//

#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <string.h>
#include <cstring>
#define BUFFER 100
#define OK 0
#include <locale.h>
#include <thread>
#include <chrono>

#define STR "I$hate%dnb"

extern "C" // импортируем функцию, написанную на другом языке, но соответсвующую соглашениям о вызове Си
{
    void strcopy(char* dst, char* src, int len);
}

__declspec(naked) size_t asm_strlen(const char* str) // по сути __declspec(naked) это inline assembler (ставится в том случае, когда вся функция написана на ассемблере)
{ // модификатор не добавляет ненужного кода вокруг ассемблерного кода
    __asm
    {
        mov eax, 0; Обнуляем eax(регистр - аккумулятор);
        mov edi, [esp + 4]; Загружаем адрес строки в edi;
        mov ecx, -1; Устанавливаем ecx в - 1 (максимальное количество);
        repne scasb; Сканируем байт по адресу edi, сравниваем с al, уменьшаем ecx, повторяем, пока ecx не станет 0 или ZF = 1 repeat while not equal
        not ecx ; Инвертируем счетчик, чтобы получить длину строки вместе с нулевым символом;
        dec ecx ; Вычитаем для коррекции на завершающий нулевой символ;
        mov eax, ecx; Перемещаем длину в eax для возврата;
        ret; Возвращаем;
    }
}

void test_strlen()
{
    const char* test_str = "TeSt StRiNg!";

    printf("\n---Подсчёт длины строки: %s---\n\nasm_strlen: %lu\nstrlen: %lu\n",
        test_str, asm_strlen(test_str), strlen(test_str));
}

void test_strcopy()
{
    printf("\n---strcopy:---\n");

    #pragma region static
    /*char src[] = "I$hate%dnb";
    char dst[BUFFER] = "..........";*/
    #pragma endregion
    #pragma region dynamic
    char* sm = (char *)calloc(strlen(STR) + 100, sizeof(char));
    if (!sm)
        return;
    strcopy(sm, (char *)STR, strlen(STR));
    char* src = sm;
    char* dst = sm + 2;
    #pragma endregion
    
    int len, i_s, i_d;

    len = strlen(STR);
    i_s = 0;
    i_d = 0;
    printf("\nsource      - \t%s\ndstination - \t%s\nlength      - \t%d\n"
        "index_src   - \t%d\nindex_dst  - \t%d\n", src, dst, len, i_s, i_d);
    strcopy(dst + i_d, src + i_s, len);
    printf("result      - \t%s\n", dst);
    #pragma region dynamic
    free(sm);
    #pragma endregion
}

int main()
{
    setlocale(LC_ALL, "Russian");
    test_strlen();
    test_strcopy();

    return OK;
}

// Запуск программы: CTRL+F5 или меню "Отладка" > "Запуск без отладки"
// Отладка программы: F5 или меню "Отладка" > "Запустить отладку"

// Советы по началу работы 
//   1. В окне обозревателя решений можно добавлять файлы и управлять ими.
//   2. В окне Team Explorer можно подключиться к системе управления версиями.
//   3. В окне "Выходные данные" можно просматривать выходные данные сборки и другие сообщения.
//   4. В окне "Список ошибок" можно просматривать ошибки.
//   5. Последовательно выберите пункты меню "Проект" > "Добавить новый элемент", чтобы создать файлы кода, или "Проект" > "Добавить существующий элемент", чтобы добавить в проект существующие файлы кода.
//   6. Чтобы снова открыть этот проект позже, выберите пункты меню "Файл" > "Открыть" > "Проект" и выберите SLN-файл.
