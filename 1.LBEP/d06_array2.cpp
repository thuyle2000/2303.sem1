#include <stdio.h>
#include <stdlib.h>

/*
demo mang so nguyen, voi so phan tu va du lieu do nguoi chay chuong trinh cung cap
*/
int main(){
    system("cls");

    //khai bao bien n - se chua tong so pt cua mang so nguyen
    int n; 
    printf(" >> nhap tong so phan tu : ");
    scanf("%d", &n);

    //khai bao mang so nguyen a[], chua n-phan tu
    int a[n];

    //vong lap, nhap du lieu cho cac phan tu trong mang a[]
    for (int i = 0; i < n; i++)
    {
        printf(" - nhap so nguyen thu [%d]: ", i+1);
        scanf("%d", &a[i]);
    }

    //vong lap, xuat du lieu trong mang a[]
    printf("\n day so vua nhap: \n");
    for (int i = 0; i < n; i++)
    {
        printf(" %d,", a[i]);
    }
    printf("\b.");
    

}
