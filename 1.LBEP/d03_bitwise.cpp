#include <stdio.h>
int main()
{
    printf(" *** DEMO Phep toan luan ly nhi phan BITWISE *** \n");
    int a, b;
    printf(" >> nhap so nguyen thu 1: ");
    scanf("%d", &a);
    printf(" >> nhap so nguyen thu 2: ");
    scanf("%d", &b);

    printf("=================\n");
    printf(" %d & %d = %d \n", a,b, a&b);
    printf(" %d | %d = %d \n", a,b, a|b);
    printf(" %d ^ %d = %d \n", a,b, a^b);
    printf(" %d << 3 = %d \n", a,a<<3);   // a<<3 tuong duong a*(2^3)
    printf(" %d >> 2 = %d \n", b,b>>2);   // b>>2 tuong duong b/(2^2)
}