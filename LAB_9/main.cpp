#include <iostream>
#include <chrono>
#include <immintrin.h>

using namespace std;

int main()
{
    int L, M, N;

    float M1[4] = {1,5,3,4};
    float sum;
    __asm__ (
        "movups %[array], %%xmm0\n"     // Load array into xmm0
        "haddps %%xmm0, %%xmm0\n"       // Horizontally add xmm0
        "haddps %%xmm0, %%xmm0\n"       // Horizontally add xmm0
        "movss %%xmm0, %[result]\n"     // Move the lowest float of xmm0 to result
        : [result] "=m" (sum)
        : [array] "m" (M1)
        : "%xmm0", "%xmm1"
    );

    printf("Sum: %f\n", sum);
    
    std::cout << "Enter the dimensions of matrix A (LxM): ";
    cin >> L >> M;

    std::cout << "Enter the dimensions of matrix B (MxN): ";
    cin >> M >> N;

    float A[L][M];  // Mатрицы A
    float B[M][N];  // Mатрицы B
    float C[L][N];  // Mатрицы C

    #pragma region "Enter A"
    std::cout << "Enter the elements of matrix A:\n";
    for (int i = 0; i < L; i++)
        for (int j = 0; j < M; j++)
            cin >> A[i][j];
    #pragma endregion

    #pragma region "Enter B"
    std::cout << "Enter the elements of matrix B:\n";
    for (int i = 0; i < M; i++)
        for (int j = 0; j < N; j++)
            cin >> B[i][j];
    #pragma endregion

    #pragma region "A*B (c implementation)"
    for (int i = 0; i < L; i++) 
        for (int j = 0; j < N; j++)
        {
            C[i][j] = 0.0;
            for (int k = 0; k < M; k++)
                C[i][j] += A[i][k] * B[k][j];
        }
    #pragma endregion

    #pragma region "C output"
    std::cout << "Result matrix C(c-func):\n";
    for (int i = 0; i < L; i++)
    {
        for (int j = 0; j < N; j++)
            std::cout << C[i][j] << " ";  // Обращение к элементам матрицы C через одномерный массив
        std::cout << endl;
    }
    #pragma endregion

    #pragma region "C clean"
    for (int i = 0; i < L; i++)
        for (int j = 0; j < N; j++)
            C[i][j] = 0;  // Обращение к элементам матрицы C через одномерный массив
    #pragma endregion

    #pragma region "Transpose B"
    float trB[N][M]; // Создаем новый массив для транспонированной матрицы

    // Транспонируем матрицу
    for (int i = 0; i < M; ++i)
        for (int j = 0; j < N; ++j)
            trB[j][i] = B[i][j];

    std::cout << endl;
    std::cout << endl;

    std::cout << "A:\n";
    for (int i = 0; i < L; i++)
    {
        for (int j = 0; j < M; j++)
            std::cout << A[i][j] << " ";  // Обращение к элементам матрицы C через одномерный массив
        std::cout << endl;
    }
    std::cout << endl;
    std::cout << "Transposed B:\n";
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < M; j++)
            std::cout << trB[i][j] << " ";  // Обращение к элементам матрицы C через одномерный массив
        std::cout << endl;
    }
    std::cout << endl;
    std::cout << endl;
    #pragma endregion


    long long b_col = 0;
    long long a_row = 0;
    int ostatok = M%4;
    float *a_ptr, *b_ptr;
    for (int i = 0; i < L; i++)
    {
        for (int j = 0; j < N; j++)
        {
            float cur_f = 0;
            a_ptr = &A[i][0];
            b_ptr = &trB[j][0];
            for (int k = 0; k < M; k+=4)
            {
                a_ptr = &A[i][k];
                b_ptr = &trB[j][k];
                __asm__ (
                    "movups %[cur_f], %%xmm2\n"
                    "movups %[A], %%xmm0\n"
                    "movups %[B], %%xmm1\n"
                    
                    "mulps %%xmm0, %%xmm1\n"
                    "haddps %%xmm1, %%xmm1\n"
                    "addps %%xmm1, %%xmm2\n"
                    "movss %%xmm2, %[cur_f]\n"
                    : [cur_f] "=m"(cur_f)
                    : [A] "m"(*a_ptr), [B] "m"(*b_ptr), [L] "m"(L), [M] "m"(M), [ostatok] "m"(ostatok), [N] "m"(N) 
                );
            }
            for (int k = 0; k < ostatok; k++)
            {
                __asm__ (
                    "movups %[cur_f], %%xmm2\n"
                    "movss %[A], %%xmm0\n"
                    "movss %[B], %%xmm1\n"
                    "mulps %%xmm0, %%xmm1\n"
                    "addss %%xmm1, %%xmm2\n"
                    "movss %%xmm2, %[cur_f]\n"
                    : [cur_f] "=m"(cur_f)
                    : [A] "m"(*a_ptr), [B] "m"(*b_ptr)
                );
                std::cout << cur_f << endl;
                a_ptr++;
                b_ptr++;
            }
            std::cout << endl;
            C[i][j] = cur_f;
        }
    }
    // __asm__ (
    //     // "movq %[A], %%rsi\n"        // Load address of matrix A into rsi
    //     // "movq %[B], %%rdi\n"        // Load address of matrix B into rdi
    //     // "movq %[C], %%rdx\n"        // Load address of matrix C into rdx

    //     "mov $0, %%eax\n" // GO IN L
    //     "jmp first\n"
    //     "NEW_L_ROW:\n"
    //         "inc %%eax\n"
    //         "first:\n"
    //         "cmp $0, %%eax\n"
    //         "jmp WRITE\n"

    //         "mov $0, %%ebx\n" // GO IN N
    //         "mov $0, %%ecx\n" // CONCRETE ELEMS IN STR
    //         "pxor %%xmm2, %%xmm2\n"
    //         "START:\n"
    //             "add 4, %%ecx\n"
    //             "cmp %[M], %%ecx\n"
    //             "jg EXIT\n"
                

    //             "movups %[A], %%xmm0\n"
    //             "movups %[B], %%xmm1\n"
                
    //             "mulps %%xmm0, %%xmm1\n"
    //             "haddps %%xmm1, %%xmm1\n"
    //             "addps %%xmm1, %%xmm2\n"

    //             "jmp START\n"
    //         "EXIT:\n"
    //             "mov %[ostatok], %%edx\n"
    //             "cmp $0, %%edx\n"
    //             "jz after_dark\n"

    //             "leftover_start:\n"
    //                 "lea (%[A], %%ecx, 4), %%ebp\n"
    //                 "movss (%[A], %%ecx, 4), %%xmm0\n"
    //                 "movss (%[B], %%ecx, 4), %%xmm1\n"
    //                 "mulps %%xmm0, %%xmm1\n"
    //                 "addss %%xmm1, %%xmm2\n"
    //                 // shift
    //                 "inc %%ecx\n"
    //                 //
    //                 "dec %%edx\n"
    //                 "cmp $0, %%edx\n"
    //                 "jnz leftover_start\n"

    //             "after_dark:\n"
    //             "inc %%ebx\n"
    //             "cmp %[N], %%ebx\n"
    //             "je NEW_L_ROW\n"
            
    //     "WRITE:\n"
    //     "movss %%xmm2, %[C]\n"

    
    //     // "haddps %%xmm1, %%xmm1\n"
    //     // "haddps %%xmm0, %%xmm0\n"
    //     // "movss %%xmm0, %[C]\n"
    //     : [C] "=m" (C)
    //     : [A] "m"(A[0][0]), [B] "m"(trB[0][0]), [L] "m"(L), [M] "m"(M), [ostatok] "m"(ostatok), [N] "m"(N) 
    //     : "%xmm0", "%xmm1", "%xmm2"
    // );
    //     "mov $0, %%rax\n"
    //     "mov $0, %%ecx\n"         // счетчик строк матрицы A
    //     "mov $0, %%r8\n"          // счетчик столбцов матрицы A / строк матрицы B
    //     "jmp mult_inner\n"
    //     "mult_outer:\n"
    //         "add $3, %%r8\n" // M!
    //         "mov $0, %6\n"
    //         "mult_inner:\n"
    //             "mov $0, %%r9\n"          // счетчик элементов внутреннего цикла
    //             "pxor %%xmm0, %%xmm0\n"   // обнуление регистра xmm0
    //             "movd %%eax, %%xmm0\n" 
    //             "mult_inner_loop:\n"
    //                 "add %[b_col], %%r9\n"
    //                 "add %[a_row], %%r8\n"
    //                 // "movups %%xmm1, (%0, %%r9, 4)\n"
    //                 // "movups %%xmm2, (%1, %%r8, 4)\n"
    //                 "mulps %%xmm1, %%xmm2\n"
    //                 "haddps %%xmm2, %%xmm2\n"
    //                 "addps %%xmm2, %%xmm0\n"
    //                 "add $0x10, %%r9\n" // Сдвигаем указатель на 16 байт (4 float)
    //                 "add $0x10, %%r8\n"
    //                 "cmp $0x30, %%r9\n" // Проверяем, достигли ли конца строк матриц (M)
    //                 "jl mult_inner_loop\n"
                    
    //             "movss %%xmm0, (%3, %%rax, 4)\n"      // сохранение результата в C
    //             "inc %%eax\n"
    //             "inc %6\n"
    //             "cmp $0x20, %6\n" // Проверяем, достигли ли конца столбцов матриц (N)
    //             "jl mult_inner\n"
    //             "inc %7\n"
    //             "cmp $0x10, %7\n" // Проверяем, достигли ли конца строк матриц (L)
    //             "jl mult_outer\n"
    //     :
    //     : "r"(transposedB), "r"(A), "m"(N), "r"(C), "m"(L), "m"(M), [b_col] "r"(b_col), [a_row] "r"(a_row)
    //     : "%xmm0", "%xmm1", "%xmm2", "%rcx", "%rdx", "%r8", "%r9", "memory"
    // );

    #pragma region "C output"
    std::cout << "Result matrix C(asm-func):\n";
    for (int i = 0; i < L; i++)
    {
        for (int j = 0; j < N; j++)
            std::cout << C[i][j] << " ";  // Обращение к элементам матрицы C через одномерный массив
        std::cout << endl;
    }
    #pragma endregion

    return 0;
}