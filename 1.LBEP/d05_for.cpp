#include <stdio.h>
#include <stdlib.h>

/* vi du ve vong lap FOR don gian */
int main(){
    system("cls"); // xoa man hinh

    //in 1 thong bao "Hello" len man hinh 10 lan
    for (int i = 0; i <10 ; i++)
    {
        printf("Hello \n");
    }
    printf("\n");

    //in 1 thong bao "Hello" len man hinh 10 lan, ket hop voi so thu tu
    for (int i = 0; i <10 ; i++)
    {
        printf("%2d. Hello \n", i+1);
    }   
    
}