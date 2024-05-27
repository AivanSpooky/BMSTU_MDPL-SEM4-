// компиляция
// gcc -O3 -march=armv8-a -o neon_scalar_product neon_scalar_product.c


#include <stdio.h>
#include <arm_neon.h>

float32_t scalar_product_neon(float32_t* vector1, float32_t* vector2, int length)
{
    float32x4_t vec1, vec2, prod, sum;
    int i;
    // Функция vdupq_n_f32 представляет собой инструкцию SIMD (Single Instruction, Multiple Data) 
    // в ассемблере ARM для дублирования значения типа float32 (32-битного числа с плавающей запятой) 
    // во всех элементах вектора.
    sum = vdupq_n_f32(0.0f); // Инициализация суммы нулями

    for (i = 0; i < length; i += 4) {
        // Загрузка 4 значений из вектора 1 и вектора 2
        // Подробнее, vld1q_f32 загружает значения из памяти, начиная с указанного адреса, 
        // в регистр float32x4_t. Она обычно используется для эффективной загрузки четырех 
        // значений с плавающей запятой из памяти одновременно, чтобы проводить параллельные вычисления 
        // с использованием расширения NEON.
        vec1 = vld1q_f32(vector1 + i);
        vec2 = vld1q_f32(vector2 + i);

        //  vmulq_f32 выполняет элементарное умножение четырех значений типа float32x4_t и возвращает 
        // результат в виде нового регистра float32x4_t. Это позволяет выполнять параллельные вычисления 
        // над четырьмя значениями с плавающей запятой одновременно с использованием расширения NEON.
        // Вычисление произведения элементов векторов
        prod = vmulq_f32(vec1, vec2);

        // Сложение произведений
        sum = vaddq_f32(sum, prod);
    }

    // Сложение всех элементов в сумме
    sum = vpaddq_f32(sum, sum);
    sum = vpaddq_f32(sum, sum);

    // Возвращение результата
    return vgetq_lane_f32(sum, 0);
}

int main()
{
    float32_t vector1[] = {1.0f, 2.0f, 3.0f, 4.0f};
    float32_t vector2[] = {5.0f, 6.0f, 7.0f, 8.0f};
    int length = sizeof(vector1) / sizeof(vector1[0]);

    float32_t result = scalar_product_neon(vector1, vector2, length);

    printf("Scalar product: %f\n", result);

    return 0;
}
