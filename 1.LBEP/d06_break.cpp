#include <stdio.h>
#include <stdlib.h>

/* demo lenh break ket thuc vong lap */
int main(){
    system("cls");
    int n;
    int count =10;

    //doan code yeu cau nhap 10 so nguyen duong
    for (int i = 0; i < count; i++)
    {
        printf(" - nhap so nguyen duong thu %d: ", i+1);
        scanf("%d", &n);
        if(n<=0){
            break;  //dung vong luon !!!
        }
    }
    
}