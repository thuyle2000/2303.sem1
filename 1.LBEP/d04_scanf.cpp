#include <stdio.h>

int main()
{
    printf("\n DEMO HAM NHAP DU LIEU scanf() \n");
    int a, b;
    float x;
    char yesno;
    char fullname[60];

    printf("nhap 2 so nguyen a: ");
    scanf("%d", &a);
    printf("nhap 2 so nguyen b: ");
    scanf("%d", &b);

    printf("nhap so thuc x: ");
    scanf("%f", &x);

    // fflush(stdin); // xoa het du lieu trong bo dem ban phim
    fseek(stdin, 0, SEEK_END);
    printf("nhap ho ten cua ban: ");
    // gets(fullname);
    // scanf("%s", fullname);
    scanf("%[^\n]", fullname); // cho phep nhap tat ca ky tu ngoai tu enter

    printf("ban co muon tiep tuc chuong trinh ko ? [y/n] : ");
    fseek(stdin, 0, SEEK_END); // xoa het du lieu trong bo dem ban phim
    scanf("%c", &yesno);

    printf("\n====== cac gia tri vua nhap =========\n");
    printf(" a= %d, b=%d \n", a, b);
    printf(" x= %.2f \n", x);
    printf(" ho ten= %s \n", fullname);
    printf(" yesno= %c \n", yesno);
}