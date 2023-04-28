#include <stdio.h>
#include <stdlib.h>

/* nhap 1 day so va in ra theo thu tu dao nguoc */
int main()
{
    system("cls");

    int n = 0;
    while (1 == 1)
    {
        printf(" >> nhap so phan tu [3-10]: ");
        scanf("%d", &n);
        if (n >= 3 && n <= 10)
        {
            break;
        }
        printf(" >> LOI: so luong ko hop le ! Vui long nhap lai. \n\n");
    }

    // khai bao mang so nguyen ds, co n-phan tu
    int ds[n];

    // vong lap FOR, nhap n so nguyen
    for (int i = 0; i < n; i++)
    {
        printf(" >> nhap so thu %d: ", i + 1);
        scanf("%d", &ds[i]);
    }

    // in day so vua nhap ra man hinh
    printf("\n\n >> day so vua nhap: \n");
    for (int i = 0; i < n; i++)
    {
        printf(" %d,", ds[i]);
    }
    printf("\b."); // \b: xoa ky tu [,] cuoi tren man hinh

    // dao nguoc day so trong mang
    int soTam;
    for (int i = 0, k = n - 1; i < n / 2; i++, k--)
    {
        soTam = ds[i];
        ds[i] = ds[k];
        ds[k] = soTam;
    }

    // in day so vua moi dao nguoc vi tri ra man hinh
    printf("\n >> day so sau khi dao nguoc vi tri: \n");
    for (int i = 0; i < n; i++)
    {
        printf(" %d,", ds[i]);
    }
    printf("\b."); // \b: xoa ky tu [,] cuoi tren man hinh
}