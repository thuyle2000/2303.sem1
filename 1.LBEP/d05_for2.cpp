#include <stdio.h>
#include <stdlib.h>

/* demo vong lap FOR */
int main(){
    system("cls"); //xoa man hinh

    int age;
    char name[31];

    printf(">> nhap tuoi cua ban: ");
    scanf("%d", &age);

    fseek(stdin, 0, SEEK_END);
    
    printf(">> nhap ho ten cua ban: ");
    gets(name); //hoac lenh scanf("%[^\n]", name);



    //in ra ten cua nguoi dung ra man hinh, 1 so lan bang voi so tuoi
    for (int i = 0; i < age; i++)
    {
        printf("%3d. %s \n", i+1, name);
    }
    
}