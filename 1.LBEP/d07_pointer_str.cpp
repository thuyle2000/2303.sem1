#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*chuong trinh nhap danh sach ho ten sv, sau do tim va in ra ten cua sv theo yeu cau */
int main(){
    system("cls");

    int n;
    while (1==1)
    {
        printf(" >> nhap so luong so luong sv [3-10]: ");
        scanf("%d", &n);
        if(n<3 || n>10){
            printf(" >> LOI: so luong ko hop le. vui long nhap lai !\n");
            continue;
        }
        break;
    }
    
    //khai bao mang ds[] chua ho ten cua n-sinh vien, ten dai toi da 39 ky tu
    char ds[n][40];
    fseek(stdin, 0, SEEK_END);
    //vong lap FOR de nhap ho ten cua n-sinh vien
    for (int i = 0; i < n; i++)
    {
        printf(" >> nhap ho ten sv thu %d: ", i+1);
        gets(ds[i]);
    }

    //vong lap FOR in ra ds sinh vien
    printf("\n Danh sach sinh vien: \n");
    for (int i = 0; i < n; i++)
    {
        printf("\t %s \n", ds[i]);
    }
    
    char tenSV[40];
    printf("\n >> nhap ten cua sv muon tim: ");
    gets(tenSV);

    //vong lap FOR, thuc hien chuc nang tim kiem
    int cnt = 0;
    for (int i = 0; i < n; i++)
    {
        if(strstr(ds[i], tenSV)){
            printf("\t %s \n", ds[i]);
            cnt++;
        }
    }//ket thuc FOR

    if(cnt==0){
        printf("\t >> KO TIM THAY !!! \n");
    }
    

}