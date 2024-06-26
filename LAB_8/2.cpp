#include <iostream>
#include <cmath>

double sin_pi()
{
    double res;

    __asm__("fldpi\n"                     // загружаем константу пи на вершину стека сопроцессора
            "fsin\n"                      // считаем синус числа, находящегося в ST(0) (на вершине стека сопроцессора); операнд считается заданным в радианах
            "fstp %0\n"                   // извлекаем число из FPU в память, в данном случае из ST(0) в res
            : "=m" (res)                    // res - выходной параметр
            );

    return res;
}

double sin_half_pi()
{
    double res;
    const int div = 2;
    
    __asm__("fldpi\n"                     // загружаем константу пи на вершину стека сопроцессора
            "fild %1\n"                   // загружаем divider (целое число, поэтому 'i' в названии команды) на вершину стека
            "fdivp\n"                     // делим ST(1) на ST(0), сохраняем результат в ST(1) и извлекаем из стека сопроцессора (поэтому 'p' в названии команды)
            "fsin\n"                      // считаем синус числа, находящегося в ST(0) (на вершине стекасопроцессора); операнд считается заданным в радианах
            "fstp %0\n"                   // извлекаем число из FPU в память, в данном случае из ST(0) в res
            : "=m" (res)                  // res - выходной параметр
            : "m" (div)                   // divider - входной параметр; да-да, я послал сюда число 2 через переменную, чтобы не возиться с загрузкой числа в стек сопроцессора
            );

    return res;
}

enum rc
{
    OK = 0
};

int main()
{
    printf("\n---Test PI:---\n");
    
    printf("c++: sin(3.14) =     %.20f\n", sin(3.14));
    printf("c++: sin(3.141596) = %.20f\n", sin(3.141596));
    printf("c++: sin(M_PI) =     %.20f\n", sin(M_PI));
    printf("asm: sin(PI) =       %.20f\n", sin_pi());
    
    printf("\n---Test PI / 2:---\n");

    printf("c++: sin(3.14 / 2) =     %.20f\n", sin(3.14 / 2));
    printf("c++: sin(3.141596 / 2) = %.20f\n", sin(3.141596 / 2));
    printf("c++: sin(M_PI / 2) =     %.20f\n", sin(M_PI / 2));
    printf("asm: sin(PI / 2) =       %.20f\n", sin_half_pi());
    
    return OK;
}