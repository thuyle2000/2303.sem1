#include <stdio.h>
#include <stdlib.h>

/*  chuong trinh tinh va in ra tong cua N-so nguyen dau tien
    vi du : neu N=10 => 1+2+3+4+5+6+7+8+9=10 = 55
*/
int main(){
    system("cls");
    int n;

    printf(" - nhap so nguyen N: ");
    scanf("%d", &n);

    int sum =0;
    for (int i = 1; i <= n; i++)
    {
        sum += i;
        printf(" %d +", i);
    }
    
    printf("\b = %d \n", sum);
}