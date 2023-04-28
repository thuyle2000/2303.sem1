#include <stdio.h>
#include <stdlib.h>

/*
demo mang so nguyen, voi so phan tu va du lieu do nguoi chay chuong trinh cung cap.
sau do tinh va in ra so lon nhat, nho nhat va binh quan
*/
int main()
{
    system("cls");

    // khai bao bien n - se chua tong so pt cua mang so nguyen
    int n;
    printf(" >> nhap tong so phan tu : ");
    scanf("%d", &n);

    // khai bao mang so nguyen a[], chua n-phan tu
    int a[n];

    // vong lap, nhap du lieu cho cac phan tu trong mang a[]
    for (int i = 0; i < n; i++)
    {
        printf(" - nhap so nguyen thu [%d]: ", i + 1);
        scanf("%d", &a[i]);
    }

    // vong lap, xuat du lieu trong mang a[]
    int min, max, total;
    min = max = a[0];
    total = 0;

    printf("\n day so vua nhap: \n");
    for (int i = 0; i < n; i++)
    {
        printf(" %d,", a[i]);
        min = (min > a[i]) ? a[i] : min;
        max = (max < a[i]) ? a[i] : max;
        total += a[i];
    }
    printf("\b.\n");
    printf(" >> so nho nhat: %d \n", min);
    printf(" >> so lon nhat: %d \n", max);
    printf(" >> binh quan: %.2f \n", (float)total/n);
}
