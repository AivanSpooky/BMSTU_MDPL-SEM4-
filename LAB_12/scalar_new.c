#include <stdio.h>


float scalar_product_neon(float *vector1, float *vector2, int length)
{
    float result;
    asm volatile
    (
        "ld1 {v0.4s}, [x0];" // Загрузка 4-х элементов из vector1 в регистр NEON v0.
        "ld1 {v1.4s}, [x1];" // Загрузка 4-х элементов из vector2 в регистр NEON v1.
        "fmul v2.4s, v0.4s, v1.4s;" // Поэлементное умножение элементов векторов vector1 и vector2, результат сохраняется в регистре NEON v2.
        "dup v3.4s, v2.s[0];" // Копирование значения первого элемента из v2 в регистр NEON v3.
        "dup v4.4s, v2.s[1];" // Копирование значения второго элемента из v2 в регистр NEON v4.
        "fadd v3.4s, v3.4, v4.4s;" // Поэлементное сложение значений векторов v3 и v4, результат сохраняется в v3.
        "dup v4.4s, v2.s[2];" // Копирование значения третьего элемента из v2 в регистр NEON v4.
        "fadd v3.4s, v3.4s, v4.4s;" // Поэлементное сложение значений векторов v3 и v4, результат сохраняется в v3.
        "dup v4.4s, v2.s[3];" //  Копирование значения четвертого элемента из v2 в регистр NEON v4.
        "fadd v3.4s, v3.4s, v4.4s;" // Поэлементное сложение значений векторов v3 и v4, результат сохраняется в v3.
        "mov x0, #0;" // Загрузка нулевого значения в регистр общего назначения x0.
        "mov w0, v3.s[0];" // Сохранение первого элемента из v3 в регистр общего назначения w0, который будет использован для возврата результата.
        : "=r"(result) : "r"(vector1), "r"(vector2)
    );
}



int main()
{
    float vector1[] = {1.0f, 2.0f, 3.0f, 4.0f};
    float vector2[] = {5.0f, 6.0f, 7.0f, 8.0f};
    int length = sizeof(vector1) / sizeof(vector1[0]);

    float result = scalar_product_neon(vector1, vector2, length);

    printf("Scalar product: %f\n", result);

    return 0;
}