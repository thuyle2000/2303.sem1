#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* demo chuong trinh ghi cac chuoi van ban vo tap tin */
int main()
{

    // 1. open file ten [baihat.txt] de ghi cac dong van ban
    FILE *f = fopen("baihat.txt", "w");

    // 2. ghi du lieu vo file
    char s[80];

    while (1 == 1)
    {
        printf("nhap van ban muon ghi: ");
        gets(s);

        if (strlen(s) > 0)
        {
            // ghi chuoi s vo file [baihat.txt]
            fputs(s, f);
            fputs("\n", f);
        }
        else
        {
            break; //neu user chi bam <enter> => ket thuc viec ghi file
        }
    }

    //3. dong file
    fclose(f);

    printf("\n Da ghi file thanh cong !");
}