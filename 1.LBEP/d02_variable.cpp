#include <stdio.h>
int main(){
    //chuong trinh nhap 2 so nguyen, tinh tong va in ra man hinh
    
    int a,b ; //khai bao 2 bien so nguyen a,b

    printf(" >> nhap so thu nhat : ");
    scanf("%d", &a); //lenh cho nhap 1 so nguyen -> luu vo bien [a]

    printf(" >> nhap so thu hai: ");
    scanf("%d", &b); //lenh cho nhap so nguyen thu 2 -> luu vo bien [b]

    int tong = a+b;
    int hieu = a-b;
    int tich = a*b;
    int thuong = a/b;
    int duso = a%b;

    //in ra man hinh ket qua cua cac phep toan so hoc tren 2 so a va b
    printf("\n tong 2 so : %d", tong);
    printf("\n hieu 2 so : %d", hieu);
    printf("\n tich 2 so : %d", tich);
    printf("\n thuong: %d va du so : %d", thuong, duso );
}