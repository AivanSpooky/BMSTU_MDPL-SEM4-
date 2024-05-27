#include <stdio.h>
#include <arm_neon.h>

float scalar_product_neon(float *vector1, float *vector2, int lenght)
{
    float result = 0.0f;

    asm volatile (
        "mov w2, %w[length]\n"     
        "uxtw x2, w2\n"           
        "dup v3.4s, wzr\n"           
        "1:\n"
            "subs x2, x2, #4\n"           
            "ld1 {v0.4s}, [%[v1]], #16\n" 
            "ld1 {v1.4s}, [%[v2]], #16\n"
            "fmla v3.4s, v0.4s, v1.4s\n"  
            "b.gt 1b\n"                   
        "faddp v3.4s, v3.4s, v3.4s\n" 
        "faddp v3.4s, v3.4s, v3.4s\n"
        "fmov %w[result], s3\n"      
        : [result] "=r" (result)
        : [v1] "r" (vector1), [v2] "r" (vector2), [length] "r" (lenght)
        : "x2", "v0", "v1", "v3"
    );

    return result;
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