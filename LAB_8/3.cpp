#include <iostream>
#include <assert.h>
#include <cmath>
#include <iomanip>
#include <cstdio>

#define EPS 1e-8 // Точность

extern "C"
{
    double bisection_method_pure_asm(double a, double b);
}

double func_cpp(double x)
{
    return cos(x*x*x + 7);
}

double bisection_method_cpp(double a, double b)
{
    double fa = func_cpp(a);
    double fb = func_cpp(b);
    // std::cout << fa << "  " << fb << std::endl;
    // std::cout << fa << " " << fb << std::endl;

    // Неопределенное значение (необходимо, чтобы концы интервала отличались по знаку)
    assert((fa * fb <= 0));
    
    double fc, c;
    do {
        c = (a + b) / 2.0;
        fc = func_cpp(c);
        
        if (fa * fc < 0) {
            b = c;
            fb = fc;
        } else {
            a = c;
            fa = fc;
        }
    } while (fabs(b - a) > EPS);
    
    return (a + b) / 2.0;
}

double func_asm(double x)
{
    double res;
    const int add = 7;
    __asm__(
        "fld %1\n"            // Загружаем значение x на вершину стека сопроцессора
        "fld %1\n"            // Загружаем значение x на вершину стека сопроцессора
        "fmulp\n"           // x^2
        "fld %1\n"            // Загружаем значение x на вершину стека сопроцессора
        "fmulp\n"           // x^2
        "fild %2\n"            // Загружаем значение 7 на вершину стека сопроцессора
        "faddp\n"             // x^3 + 7
        "fcos\n"              // cos(x^3 + 7)
        "fstp %0\n"           // Сохраняем результат в переменную res
        : "=m" (res)          // Выходной параметр
        : "m" (x), "m" (add)  // Входной параметр
        );
    // std::cout << "f(" << x << "): " << res << std::endl; 
    return res;
}

double bisection_method_asm(double a, double b)
{
    double fa = func_asm(a), fb = func_asm(b), fc;
    double c;
    // std::cout << fa << "  " << fb << std::endl;
    // Неопределенное значение (необходимо, чтобы концы интервала отличались по знаку)
    assert((fa * fb <= 0));
    
    do {
        // std::cout << "a: " << a << " fa: " << fa << "; b : " << b << " fb: " << fb << std::endl;
        c = (a + b) / 2.0;

        fc = func_asm(c);
        
        if (fa * fc < 0) {
            b = c;
            fb = fc;
        } else {
            a = c;
            fa = fc;
        }
    } while (fabs(b - a) > EPS);
    
    return (a + b) / 2.0;
}

double bisection_method_pure_asm(double a, double b)
{
    double c;
    const int dvoika = 2;
    do
    {
        double fa = func_asm(a), fb = func_asm(b), fc;
        double a_s = a, b_s = b;
        // std::cout << "a: " << a << "; b : " << b << std::endl;
        __asm__(
            "fld %1\n"          // Загрузить a в регистр ST0 (fpu stack top)
            "fld %2\n"          // Загрузить b в ST1
            "faddp\n"            // Сложить a и b, положить результат в ST0 и вытолкнуть ST1
            "fild %3\n"
            "fdivp\n"            // Разделить a + b на 2, результат в ST0 и вытолкнуть ST1
            "fstp %0\n"         // Сохранить результат деления в c
            : "=m" (c)          // Выходное значение (c)
            : "m" (a), "m" (b), "m" (dvoika)  // Входные значения (a и b)
        );
        
        
        fc = func_asm(c);
        
        // __asm__(
        //     "fld %1\n"          // Загрузить fa в регистр ST0 (fpu stack top)
        //     "fld %2\n"          // Загрузить fc в ST1
        //     "fmulp\n"            // Умножить fa и fc, результат в ST0 и вытолкнуть ST1
        //     "fcomi\n"            // Сравнить результат с нулем
        //     "jb less\n"          // Если результат < 0, перейти к метке less
        //     "jmp greater\n"      // В противном случае перейти к метке greater
            
        //     "less:\n"
        //     "fld %4\n"          // Загрузить значение c
        //     "fstp %0\n"         // Сохранить c в a
        //     "fld %5\n"          // Загрузить значение c
        //     "fstp %2\n"         // Сохранить c в b
        //     "jmp end\n"          // Перейти к концу

        //     "greater:\n"
        //     "fld %4\n"          // Загрузить значение c
        //     "fstp %1\n"         // Сохранить c в b
        //     "fld %5\n"          // Загрузить значение c
        //     "fstp %3\n"         // Сохранить c в b

        //     "end:\n"
        //     : "=m" (a), "=m" (b), "=m" (fa), "=m" (fb)  // Выходные значения (a и b)
        //     : "m" (c), "m" (fc)   // Входные значения (fa и c)
        // );
        __asm__(
            "fld %2\n"              // Загрузить fa в регистр ST0 (fpu stack top)
            "fld %5\n"              // Загрузить fc в ST1
            "fmulp\n"               // Умножить fa и fc, результат в ST0 и вытолкнуть ST1

            "fldz\n"                // Загрузить ноль в ST1
            "fcom\n"                // Сравнить результат с нулем и изменить флаги
            "fstsw ax\n"            // Сохранить регистр статуса FPU в AX
            "sahf\n"                // Применить флаги условия к регистру флагов процессора

            "ja greater\n"          // Если флаг C1 установлен в 0, перейти к метке greater
            "jmp less\n"            // В противном случае перейти к метке less

            "less:\n"
            "fstp %0\n"             // Обновляем a
            "fstp %1\n"             // Обновляем b
            "fld %4\n"              // Загрузить значение c
            "fstp %0\n"             // Сохранить c в a
            "fld %5\n"              // Загрузить значение fc
            "fstp %2\n"             // Сохранить в fa
            "fld %7\n"              // tmp-выгруз в b
            "fstp %1\n"
            "jmp end\n"             // Перейти к концу

            "greater:\n"
            "fstp %0\n"             // Обновляем a
            "fstp %1\n"             // Обновляем b
            "fld %4\n"              // Загрузить значение c
            "fstp %1\n"             // Сохранить c в b
            "fld %5\n"              // Загрузить значение fc
            "fstp %3\n"             // Сохранить в fb
            "fld %6\n"              // tmp-выгруз в a
            "fstp %0\n"

            "end:\n"
            : "=m" (a), "=m" (b), "=m" (fa), "=m" (fb)   // Выходные значения (a и b)
            : "m" (c), "m" (fc), "m" (a_s), "m" (b_s)                        // Входные значения (c, fc)
            : "%ax"                                      // Указываем, что мы используем AX
        );
        // std::cout << " a: " << a << " fa: " << fa << "; b : " << b << " fb: " << fb << std::endl;
    } while (fabs(b - a) > EPS);
    return (a + b) / 2.0;
}

enum rc
{
    OK = 0
};


int main()
{
    double a = 0; // Начальная левая граница интервала
    double b = 0.5; // Начальная правая граница интервала
    
    printf("\n---f(x) = cos(x^3 + 7)---\n");
    double root = bisection_method_cpp(a, b);
    std::cout << "c++ root:       " << std::setprecision(20) << root << std::endl;

    root = bisection_method_asm(a, b);
    std::cout << "asm root:       " << std::setprecision(20) << root << std::endl;
    
    root = bisection_method_pure_asm(a, b);
    std::cout << "asm(pure) root: " << std::setprecision(20) << root << std::endl;
    
    return OK;
}