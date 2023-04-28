#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// dinh nghia kieu du lieu cau truc DATE
struct DATE
{
    int dd, mm, yy;
};

// dinh nghia kieu du lieu cau truc EMPLOYEE
struct EMPLOYEE
{
    char id[10], name[31];
    int salary, workedDays;
    struct DATE joinedDate;
};
/*
chuong trinh quan ly nhan vien, bao gom cac tac vu:
    - tao ds nhan vien
    - in ds nhan vien
*/
int main()
{
    int n;
    while (1 == 1)
    {
        printf(" >> nhap so nhan vien muon quan ly [3-10]: ");
        scanf("%d", &n);
        if (n >= 3 && n <= 10)
        {
            break;
        }
        printf(" >> LOI: du lieu ko hop le !!!\n\n");
    }

    // khai bao mang ds chua n-nhan vien
    struct EMPLOYEE ds[n];

    // 1. vong lap nhap du lieu cho n-nhan vien
    for (int i = 0; i < n; i++)
    {
        printf("\n >> nhap thong tin nv thu %d: \n", i + 1);
        fseek(stdin, 0, SEEK_END);

        printf("\t nhap id: ");
        gets(ds[i].id);
        printf("\t nhap ho ten: ");
        gets(ds[i].name);

        printf("\t nhap luong CB: ");
        scanf("%d", &ds[i].salary);
        printf("\t nhap so ngay lam viec: ");
        scanf("%d", &ds[i].workedDays);

        printf("\n\t * nhap ngay vao lam viec * \n");
        printf("\t nhap ngay [1-31]: ");
        scanf("%d", &ds[i].joinedDate.dd);
        printf("\t nhap thang [1-12]: ");
        scanf("%d", &ds[i].joinedDate.mm);
        printf("\t nhap nam: ");
        scanf("%d", &ds[i].joinedDate.yy);
    }

    //2. vong lap in ra danh sach nhan vien
    printf("\n\n DANH SACH NHAN VIEN \n");
    for (int i = 0; i < n; i++)
    {
        printf("%3d. ", i+1);
        printf("%-5s ", ds[i].id);
        printf("%-20s ", ds[i].name);
        printf("%6d ", ds[i].salary);
        printf("%3d ", ds[i].workedDays);
        printf("%02d-%02d-%4d \n", ds[i].joinedDate.dd, ds[i].joinedDate.mm, ds[i].joinedDate.yy);
    }
    
}
