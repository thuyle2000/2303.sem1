#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* chuong trinh sap xep thu tu cac chuoi van ban:
    1/ tao 1 mang chua cac chuoi ky tu char[][]
    2/ nhap du lieu vo mang (ie, nhap ds ten sv) : gets()/scanf("%[^\n]")
    3/ sap xep thu tu cua bang : strcmp() , strcpy() - su dung 2 loop
 */
int main()
{
    system("cls");

    int n = 0;
    while (1 == 1)
    {
        printf(" >> nhap so luong sinh vien [3-10]: ");
        scanf("%d", &n);
        if (n >= 3 && n <= 10)
        {
            break;
        }
        printf(" >> LOI: so luong ko hop le ! Vui long nhap lai. \n\n");
    }

    // 1. khai bao mang ds[], chua ho ten cua n-sinh vien
    char ds[n][40]; // ho ten la chuoi, chua toi da 39 ky tu

    fseek(stdin, 0, SEEK_END); // xoa bo dem ban phim
    // 2. nhap ho ten cho n-sinh vien, su dung lap FOR
    for (int i = 0; i < n; i++)
    {
        printf(" >> nhap ho ten cua sv thu %d: ", i + 1);
        gets(ds[i]);
    }

    // in bang ds ho ten sv ra man hinh
    printf("\n\n *** Danh sach ho ten sinh vien *** \n");
    for (int i = 0; i < n; i++)
    {
        printf("\t %s \n", ds[i]);
    }

    // 3. sap xep lai bang ten sv theo thu tu a-z
    char tenTam[40];
    for (int i = 0; i <= n - 2; i++)
    {
        for (int k = i + 1; k <= n-1; k++)
        {
            if (strcmp(ds[i], ds[k]) > 0)
            {
                strcpy(tenTam, ds[i]);
                strcpy(ds[i], ds[k]);
                strcpy(ds[k], tenTam);
            }
        }
    }

    // in lai bang ds ho ten sv - sau khi xep thu tu ra man hinh
    printf("\n\n *** Danh sach ho ten sinh vien (A-Z) *** \n");
    for (int i = 0; i < n; i++)
    {
        printf("\t %s \n", ds[i]);
    }
}