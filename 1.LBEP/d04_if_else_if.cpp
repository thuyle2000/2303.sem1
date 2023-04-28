#include <stdio.h>
int main()
{
    /* chuong trinh phan loai ket qua thi:
        100-90: xep loai Xuat sac
        89-75: xep loai Gioi
        74-65: xep loai Kha
        64-40: Trung binh
        <40: Ko dat
    */
    int diem;
    printf("\n Chuong trinh phan loai ket qua thi \n");
    printf(" >> nhap diem ket qua [0-100]: ");
    scanf("%d", &diem);

    if (diem > 100 || diem < 0)
    {
        printf("\t LOI: diem nhap KO hop le !!! \n");
    }
    else if (diem >= 90)
    {
        // diem >= 90 va diem <= 100
        printf("\t Xuat sac !!! \n");
    }
    else if (diem >=75)
    {
        // diem >= 75 va diem <= 89
        printf("\t Gioi !! \n");
    }
    else if (diem >=65)
    {
        // diem >= 65 va diem <= 74
        printf("\t Kha ! \n");
    }
    else if (diem >=40)
    {
        // diem >= 40 va diem <= 64
        printf("\t Trung binh. \n");
    }
    else{
        // diem >=0 va diem <= 39
        printf("\t Khong Dat !!! \n");
    }
}