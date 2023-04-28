#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void Q1();
void Q2();

int main()
{
    system("cls");
    int op = 0;
    while (1 == 1)
    {
        printf("\n\n");
        printf("**************************************************\n");
        printf("* Selecting appropriate action:                  *\n");
        printf("* 1. Question 1                                  *\n");
        printf("* 2. Question 2                                  *\n");
        printf("* 3. Quit program                                *\n");
        printf("**************************************************\n");
        printf("  plz choice [1-3]: ");
        scanf("%d", &op);
        switch (op)
        {
        case 1:
            Q1();
            break;
        case 2:
            Q2();
            break;
        case 3:
            return 0;
        default:
            printf(" >> ERROR: invalid choice !!!\n");
            break;
        }
    }
}

// tinh tong boi cua n2 < n1
void Q1()
{
    printf("\n\n Tinh tong boi\n");
    int n1, n2;
    while (1 == 1)
    {
        printf(">> nhap so nguyen n1 [1-100]: ");
        scanf("%d", &n1);
        if (n1 >= 1 && n1 <= 100)
        {
            break;
        }
    }

    while (1 == 1)
    {
        printf(">> nhap so nguyen n2 [<%d]: ", n1);
        scanf("%d", &n2);
        if (n2 >= 1 && n2 < n1)
        {
            break;
        }
    }

    int sum = 0;
    printf("\n Boi so cua %d (<=%d): ", n2, n1);
    for (int i = n2; i <= n1; i += n2)
    {
        printf(" %d ", i);
        sum += i;
    }
    printf("\n >> Tong = %d\n", sum);
}

// quan ly ds cac quoc gia -> in ra nuoc o dt lon nhat
struct NATION
{
    char name[31], capital[31];
    int area;
};

void Q2()
{
    printf("\n\n Quan ly danh sach cac quoc gia\n");

    int n;
    while (1 == 1)
    {
        printf(" >> nhap so quoc gia muon quan ly [3-10]: ");
        scanf("%d", &n);
        if (n >= 3 && n <= 10)
        {
            break;
        }
        printf(" >> LOI: du lieu ko hop le !!!\n\n");
    }

    // khai bao mang ds chua n-quoc gia
    struct NATION ds[n];

    // 1. vong lap nhap thong tin cua n-quoc gia
    for (int i = 0; i < n; i++)
    {
        printf("\n >> nhap thong tin quoc gia thu %d: \n", i + 1);
        fseek(stdin, 0, SEEK_END);

        printf("\t nhap ten: ");
        gets(ds[i].name);
        printf("\t nhap thu do: ");
        gets(ds[i].capital);

        printf("\t nhap dien tich: ");
        scanf("%d", &ds[i].area);
    }

    // 2.vong lap in ra ds quoc gia
    printf("\n\n >> DANH SACH QUOC GIA \n");

    for (int i = 0; i < n; i++)
    {
        printf("%3d. ", i + 1);
        printf("%-20s ", ds[i].name);
        printf("%-20s ", ds[i].capital);
        printf("%9d \n", ds[i].area);
    }

    // 3. vong lap tim quoc gia co dien tich lon nhat
    struct NATION QGmax;
    QGmax = ds[0];
    for (int i = 1; i < n; i++)
    {
        if (QGmax.area < ds[i].area)
        {
            QGmax = ds[i];
        }
    }

    printf("\n >> Quoc gia co dien tich lon nhat : \n");
    printf(" - Ten: %s,", QGmax.name);
    printf(" - Thu do: %s, ", QGmax.capital);
    printf(" - Dien tich: %d \n", QGmax.area);
}