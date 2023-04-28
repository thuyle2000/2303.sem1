#include <stdio.h>
#include <stdlib.h>
/*tinh giai thua cua so nguyen n [0-20]*/
int main(){
    printf("\n chuong trinh tinh n! \n");
    int n=-1;

    while (n<0 || n>20)
    {
        printf(" - nhap so nguyen n [0-20]: ");
        scanf("%d", &n);
    }
    
    printf("=> n = %d \n", n);
    double gt = 1;
    int i = n;
    while(i>0){
        gt *= i;    //tuong duong lenh gt = gt*i;
        i--;
    }

    printf("=> %d! = %.0f \n",n, gt);
}