#include <stdio.h>

int my_strlen(const char *str)
{
    int len;
    asm volatile (
        "mov x0, %[str]\n"    
        "mov x1, #0\n"        

    "1:\n"
        "ldrb w2, [x0], #1\n"  
        "cbz w2, 2f\n"          
        "add x1, x1, #1\n"    
        "b 1b\n"              

    "2:\n"
        "mov %w[len], w1\n"    
        : [len] "=r" (len)      
        : [str] "r" (str)      
        : "x0", "x1", "w2"   
    );

    return len;
}

int main()
{
    int len;
    char messg[] = "Hello, world!";
    len = my_strlen(messg);
    printf("String length = %d\n", len);

    return 0;
}