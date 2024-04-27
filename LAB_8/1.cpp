#include <stdio.h>
#include <time.h>
#include <iostream>
#include <chrono>

#define REPEATS_COUNT 1e7

// Си++
template <typename T>
void time_mesurement_cpp(int times, T a, T b)
{
    T res;
    std::chrono::duration<double> time_sum(0);
    std::chrono::duration<double> time_mul(0);

    auto start = std::chrono::high_resolution_clock::now();
    for (size_t i = 0; i < times; ++i)
        res = a + b;
    time_sum = std::chrono::high_resolution_clock::now() - start;

    start = std::chrono::high_resolution_clock::now();
    for (size_t i = 0; i < times; ++i)
        res = a * b;
    time_mul = std::chrono::high_resolution_clock::now() - start;

    std::cout << "Sum: " << time_sum.count() << "\tProd: " << time_mul.count() << std::endl;
}


// ASM-вставки
template <typename T>
void time_mesurement_asm(int times, T a, T b)
{
    T res;
    std::chrono::duration<double> time_sum(0);
    std::chrono::duration<double> time_mul(0);
    auto start = std::chrono::high_resolution_clock::now();
    for (size_t i = 0; i < times; ++i)                              // не выделяем ассемблерную вставку в обёртку, так как нам не нужно учитывать время, которое тратится на вызов обёртки
        __asm__("fld %1\n"                                          // загружаем a на вершину стека
                "fld %2\n"                                          // загружаем b на вершину стека
                "faddp\n"                                           // складываем ST(1) и ST(0), сохраняем результат в ST(1) и извлекаем из стека сопроцессора (поэтому 'p' в названии команды)
                "fstp %0\n"                                         // извлекаем число из FPU в память, в данном случае из ST(0) в res
                : "=m"(res)                                         // res - выходной параметр
                : "m"(a),                                           // a - входной параметр
                  "m"(b)                                            // b - входной параметр
                );
    time_sum = std::chrono::high_resolution_clock::now() - start;

    start = std::chrono::high_resolution_clock::now();
    for (size_t i = 0; i < times; ++i)
        __asm__("fld %1\n"                                          // загружаем a на вершину стека
                "fld %2\n"                                          // загружаем b на вершину стека
                "fmulp\n"                                           // перемножаем ST(1) и ST(0), сохраняем результат в ST(1) и извлекаем из стека сопроцессора (поэтому 'p' в названии команды)
                "fstp %0\n"                                         // извлекаем число из FPU в память, в данном случае из ST(0) в res
                : "=m"(res)                                         // res - выходной параметр
                : "m"(a),                                           // a - входной параметр
                  "m"(b)                                            // b - входной параметр
                );
    time_mul = std::chrono::high_resolution_clock::now() - start;

    std::cout << "Sum: " << time_sum.count() << "\tProd: " << time_mul.count() << std::endl;
}

#ifdef ASM
#define TIME_MEASUREMENT(T) time_mesurement_asm<T>
#else
#define TIME_MEASUREMENT(T) time_mesurement_cpp<T>
#endif

enum rc
{
    OK = 0
};

int main()
{
    double a = -1.1, b = 1234.5;
    
    printf("Float:          ");
    TIME_MEASUREMENT(float)(REPEATS_COUNT, a, b);
    printf("Double:         ");
    TIME_MEASUREMENT(double)(REPEATS_COUNT, a, b);

    return OK;
}