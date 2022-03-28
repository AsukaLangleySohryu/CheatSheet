#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct merch{

    char nama[25];
    char tipebarang[25];
    int jumlahbarang;
    merch *next, *prev;

}*head, *tail;

struct promo{

    char kode[10];
    promo *next;

}; promo *awal={NULL}, *akhir={NULL};

merch *createmerch(char nama[], char tipebarang[], int jumlahbarang){

    merch *newitem = (merch*)malloc(sizeof(merch));
    strcpy(newitem->nama, nama);
    strcpy(newitem->tipebarang, tipebarang);
    newitem->jumlahbarang = jumlahbarang;
    newitem->next = newitem->prev = NULL;
    return newitem;

}

promo *createpromo(char kode[]){

    promo *newkode = (promo*)malloc(sizeof(promo));
    strcpy(newkode->kode, kode);
    newkode->next = NULL;
    return newkode;

}

void pushtail(char nama[], char tipebarang[], int jumlahbarang){

    //bikin node baru
    merch* toinsert = createmerch(nama, tipebarang, jumlahbarang);

    //masukan ke dalam linked list
    if (head == NULL){//jika linked list masih kosong

    head = toinsert;
    tail = toinsert;
    } 
    
    else{

        tail ->next = toinsert;//tail lama nunjuk ke tail baru
        toinsert->prev = tail;
        tail = toinsert;//node baru menjadi tail yang baru

    }
}

void pushstack(char kode[]){

    promo *toinsert = createpromo(kode);

    if(awal == NULL){

        awal = toinsert;

    }
    else{

        toinsert->next = awal;
        awal = toinsert;

    }
}

void pophead(){

    merch* todelete = head;//bikin node pointer yang nunjuk ke head

    if (head!=NULL){//pastiin agar tidak delete yang NULL  
        if (head == tail)//data hanya 1
        {
            free(head);
            head = tail = NULL;
        }
        
        else//data lebih dari satu
        {
            merch *todelete = head;
            todelete->next->prev = NULL;
            free(todelete);
        }
    }
    else{

        return;

    }
}

void popstack(){

    if(awal == NULL){

        printf("No Coupon Available");
    }

    else{ 

        if(awal == akhir){

            free(awal);
            awal = akhir = NULL;

        }

        else{

            promo *todelete = awal;
            awal = todelete->next;
            free(todelete);

        }
    }
}

void send(){

    if(!head){

        printf("No item need to be inputted\n");
        getchar();
        return;
    }

    printf("\n\n%s's item has been inputted");

}

void viewqueue(){

    merch* curr = head;
    int x = 0;
    printf("        Input List\n");
    printf("==================================\n");
    while(curr != NULL){
        printf("%d |%s      %s      %d\n", x+1, curr->nama, curr->tipebarang, curr->jumlahbarang);
        getchar();
        curr = curr->next;
        x++;
    }
}

void viewstack(){

    promo* curr = awal;
    int x = 0;
    printf("        Promo Used\n");
    printf("==================================\n");
    while(curr != NULL){
        printf("%d |%s      \n", x+1, curr->kode);
        curr = curr->next;
        x++;
    }
}

void insertdata(){

  char nama[25];
  char tipebarang[25];
  int jumlahbarang;
  int leng1;
  int leng2;
  
  do
  {
   printf("What's the customer Name?\n");
   scanf("%s", &nama);
   leng1 = strlen(nama);
   getchar();
  }while(leng1 < 4 || leng1 > 25);
  
  do
  {
   printf("What's the item type?\n");
   scanf("%s", &tipebarang);
   while(getchar() != '\n');
   leng2 = strlen(tipebarang);
  }while(leng2 < 6 || leng2 > 25);
  
  do
  {
   printf("How many items?\n");
   scanf("%d", &jumlahbarang);
   getchar();
  }while(jumlahbarang < 0);

  pushtail(nama, tipebarang, jumlahbarang);
  printf("Success!\n");
  printf("Press Enter to Continue...");
  getchar();
}

void DisplayMenu(){
 
 printf("Menu\n");
 printf("1. Insert\n");
 printf("2. Promo Code\n");
 printf("3. View queue\n");
 printf("4. View promo\n");
 printf("5. Remove queue\n");
 printf("6. Remove promo\n");
 printf("7. Exit\n");
 printf(">> ");

}

void insertpromo(){

    char kode[10];
    getchar();
    printf("Please input promo code: ");
    scanf("%[^\n]", kode);
    pushstack(kode);
    printf("Success!\n");
    printf("Press Enter to Continue...\n");
    getchar(); 
}

int main()
{
 int choice;
 while(true)
 {

  DisplayMenu();
  scanf("%d", &choice);
 
  switch(choice)
  {
   case 1:
    insertdata();
    break;

   case 2:
    insertpromo();
    break;

   case 3:
    viewqueue();
    break;

   case 4:
    viewstack();
    break;

   case 5:
    pophead();
    break;

   case 6:
    popstack();
    break;

   case7:
    exit(0);
  }

 }

 return 0;
}