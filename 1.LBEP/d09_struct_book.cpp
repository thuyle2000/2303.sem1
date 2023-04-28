#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* demo lap trinh cau truc :
    dinh nghia cau truc book, bao gom : id, title, author, price
*/

// 1. dinh nghia cau truc 'struct BOOK' - pham vi toan cuc
struct BOOK
{
    char id[11];
    char title[31];
    char author[21];
    int price;
};

int main()
{
    system("cls");

    // 2. khai bao 2 bien b1, b2 co kieu 'struct BOOK'
    // 2a. khai bao bien b1 va khoi tri ban dau
    struct BOOK b1 = {"B01", "Lap trinh C", "Truong compiler", 5};

    // 2b. khai bao bien b2 nhung ko khoi tri
    struct BOOK b2;

    // 3. khoi tri cac thanh phan cua b2
    printf(" >> nhap ma so sach: ");
    gets(b2.id);

    printf(" >> nhap tua sach: ");
    scanf("%[^\n]", b2.title);
    fseek(stdin, 0, SEEK_END);

    printf(" >> nhap tac gia: ");
    scanf("%[^\n]", b2.author);

    printf(" >> nhap don gia: ");
    scanf("%d", &b2.price);

    // 3. in thong tin sach b1, b2
    printf("\n Thong tin sach: \n");
    printf(" -%s, %s, %s, %d\n", b1.id, b1.title, b1.author, b1.price);
    printf(" -%s, %s, %s, %d\n", b2.id, b2.title, b2.author, b2.price);
}