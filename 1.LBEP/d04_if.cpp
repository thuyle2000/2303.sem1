#include <stdio.h>
int main(){
    //kiem tra 1 so bat ky co phai la bo so cua 7 hay ko ?
    int n;
    printf(" >> vui long nhap 1 so nguyen : ");
    scanf("%d" , &n);
    if(n%7 == 0){
        printf(" >> %d la boi so cua 7 ! \n", n);
    }
    printf("\n *** Cam on ban da su dung chuong trinh ! \n");
}