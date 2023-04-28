#include <stdio.h>
int main()
{
    printf("\n\t *** DEMO ham printf() *** \n\n");
    int a1 = 124, a2 = 8;
    float f1 = 12.3456;
    char c1 = 'A', c2 = '@', c3 = '5';
    char name[] = "Ha The Doanh";

    printf("\t a1 = %d \n", a1);
    printf("\t a1 = %X, a1 = %x (he hexadecimal -16)\n", a1, a1);
    printf("\t a1 = %o (he octal -8)\n\n", a1);

    printf("\t f1 = %f \n\n", f1);

    printf("\t c1 = %c [ma ascii = %d] \n", c1, c1);
    printf("\t c2 = %c [ma ascii = %d] \n", c2, c2);
    printf("\t c3 = %c [ma ascii = %d] \n\n", c3, c3);

    printf("\t name = %s \n\n", name);
}
