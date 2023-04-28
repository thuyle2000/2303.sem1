#include <stdio.h>
#include <stdlib.h>

/* demo doc noi dung tap tin van ban [baihat.txt] va xuat len man hinh */
int main()
{
    system("cls");
    char filename[]="baihat.txt";

    //1. open file van de doc noi dung
    FILE* f = fopen(filename,"r");

    if(f==NULL){
        printf(" LOI: tap tin [%s] ko ton tai !\n", filename);
        return 0;
    }

    //2. vong lap doc noi dung cua file va xuat len man hinh
    char kt;
    while ( (kt=fgetc(f))!=-1)
    {
        printf("%c", kt);
    }
    
    //3. dong file
    fclose(f);

    printf("\n Finish !\n");
}