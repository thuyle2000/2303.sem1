#include <stdio.h>
#include <stdlib.h>
/* chuong trinh demo lap trinh vong lap while */

int main()
{
    /*tinh va in ra tich cua n-so nguyen dau tien (giai thua cua n)
    vi du:  neu n = 5 => n! = 1x2x3x4x5
            voi 0! = 1! = 1
    */
    system("cls");
    int n;
    printf(" - nhap so nguyen duong n: ");
    scanf("%d", &n);
    if (n < 0)
    {
        printf(" >> LOI: gia tri nhap ko hop le !");
        exit(0);    //ket thuc chuong trinh
    }
    double gt = 1;

    printf("\t ** FOR loop ** \n");
    for (int i = 1; i <= n; i++)
    {
        gt = gt* i;
    }
    printf("\t %d! = %.0f \n\n", n, gt);
    
    printf("\t ** WHILE loop ** \n");
    gt = 1; 
    int i = 1;
    while (i <= n)
    {
        gt = gt* i;
        i++;
    }
    printf("\t %d! = %.0f \n", n, gt);
}