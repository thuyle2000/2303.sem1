#include <stdio.h>
#include <stdlib.h>

int main()
{
    system("cls");

    int n = 120;
    int *p;

    printf(" n = %d, dia chi cua n = %X \n", n, &n);
    printf(" p = %X \n\n", p);

    p = &n;
    printf(" p = %X , sau lenh p = &n \n", p);
    printf(" *p = %d \n\n", *p);

    //thay doi gia tri cua bien n = 40
    *p=40;
    printf(" n = %d, sau lenh *p=40 \n", n);
}