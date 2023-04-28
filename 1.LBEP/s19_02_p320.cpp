#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
Write a C program to store the names and scores of 5 students in a structure array. Sort the structure array in descending order of scores. Display the top 3 scores.*/

// dinh nghia kieu du lieu cau truc sinh vien STUDENT
struct STUDENT
{
    char id[10], name[31];
    int mark;
};

// dinh nghia them ten moi cho kieu du lieu struct STUDENT  -> HOCSINH
typedef struct STUDENT HOCSINH;

int main()
{
    system("cls");

    int n;
    while (1 == 1)
    {
        printf(" >> nhap so sinh vien muon quan ly [3-10]: ");
        scanf("%d", &n);
        if (n >= 3 && n <= 10)
        {
            break;
        }
        printf(" >> LOI: du lieu ko hop le !!!\n\n");
    }

    // khai bao mang ds chua n-hoc sinh
    HOCSINH ds[n];

    // 1. vong lap nhap thong tin cua n-sinh vien
    for (int i = 0; i < n; i++)
    {
        printf("\n >> nhap thong tin sinh vien thu %d: \n", i + 1);
        fseek(stdin, 0, SEEK_END);

        printf("\t nhap id: ");
        gets(ds[i].id);
        printf("\t nhap ho ten: ");
        gets(ds[i].name);

        printf("\t nhap diem cuoi khoa: ");
        scanf("%d", &ds[i].mark);
    }

    // 2.vong lap in ra ds sinh vien
    printf("\n\n >> DANH SACH SINH VIEN \n");
   
    for (int i = 0; i < n; i++)
    {
        printf("%3d. ", i + 1);
        printf("%-5s ", ds[i].id);
        printf("%-20s ", ds[i].name);
        printf("%6d \n", ds[i].mark);
        
    }

    // 3.sap xe ds sv theo cot dien
    HOCSINH temp;
    for (int i = 0; i < n - 1; i++)
    {
        for (int k = i + 1; k < n; k++)
        {
            if (ds[i].mark < ds[k].mark)
            {
                temp = ds[i];
                ds[i] = ds[k];
                ds[k] = temp;
            }
        }
    }

    // 4.vong lap in ra top 3 sinh vien co diem cao nhat
    printf("\n\n >> DANH SACH TOP 3 SINH VIEN \n");
    for (int i = 0; i < 3; i++)
    {
        printf("%3d. ", i + 1);
        printf("%-5s ", ds[i].id);
        printf("%-20s ", ds[i].name);
        printf("%6d \n", ds[i].mark);
    }
}
