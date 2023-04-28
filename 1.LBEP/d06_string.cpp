#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* demo cac ham xu ly chuoi ky tu */
int main()
{
    system("cls");

    char names[] = "Bui Tran Nguyen Hung";
    char hoten[60];
    char s1[] = "Tran";
    char s2[] = "tran";
    char s3[] = " Dang";
    char s4[] = "Bui Tran Nguyen Hung";
    char s5[] = "Bui Tran Nguyen Anh";
    char s6[] = "Phan Anh";
    char ch = 'n';

    // gan noi dung bien [names] -> [hoten]
    strcpy(hoten, names);
    printf("- ho ten = %s [after strcpy()]\n", hoten);

    // gan [hoten] = [hoten] + [s3]
    strcat(hoten, s3);
    printf("- ho ten = %s [after strcat()]\n", hoten);

    // in ra chieu dai (tong so ky tu) cua chuoi names, hoten
    printf("- [%s] co [%d] ky tu \n", names, strlen(names));
    printf("- [%s] co [%d] ky tu \n", hoten, strlen(hoten));

    //so sanh chuoi
    printf("\n So sanh chuoi: \n");
    printf("- [%s] vs [%s] = %d \n", names, s1, strcmp(names, s4));
    printf("- [%s] vs [%s] = %d \n", names, s5, strcmp(names, s5));
    printf("- [%s] vs [%s] = %d \n", names, s6, strcmp(names, s6));

    //tim kiem chuoi trong chuoi
    printf("\n Tim kiem chuoi: \n");
    printf("- [%s] co chua [%s] ? %d \n", names, s1, strstr(names, s1));
    printf("- [%s] co chua [%s] ? %d \n", names, s2, strstr(names, s2));    
}