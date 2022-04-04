#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define size 52

void menu();

struct Node {
	char name[50];
	int quantity;
    Node *next, *prev;
}*head[size], *tail[size];

 Node* table[size];

Node* createNode(char name[],int quantity) {
	Node* newNode = (Node*)malloc(sizeof(Node));
	strcpy(newNode->name, name);
	newNode->quantity=quantity;
    newNode->next = NULL;
    newNode->prev = NULL;

	return newNode;
}

//Utility Function
void clearScreen(){
	system("cls");
}

void enterKey(){
    system("pause");
}


int hash(char name[]) {
	int key = tolower(name[0]);
	key -= 97;
	
	return key;
}

void insert(char name[],int quantity) {
	Node* toInsert = createNode(name,quantity);
	int idx = hash(name);
	if (table[idx]==NULL) table[idx] = toInsert;
	else {
		int baseIdx = idx;
		while (table[idx] != NULL) {
			idx = (idx+1) % size;
				if (idx == baseIdx) break;
						
		}
		if (idx==baseIdx)printf("Table is already full.\n");
		else if (table[idx]==NULL)table[idx]=toInsert;
		}
}

void insertBrand(){
	clearScreen();
	char tempName[50];
	
	do{printf("Enter Shoes Brand Name [3-45]:");
		scanf(" %[^\n]",&tempName);
	}while(strlen(tempName)<3||strlen(tempName)>45);
	
	int tempQty;
	
	do{
		printf("Enter quantity of the available product[>= 1]:");
		scanf("%d",&tempQty);
	}while(tempQty<1);
	
	insert(tempName,tempQty);
	printf("Item succesfully added!\n\n");
	enterKey();
	
	menu();
}

void view(){
	for (int i=0; i<size; i++) {
		if (table[i] == NULL) printf("%d. - ", i+1);
		else printf("%d. %3s	%11d", i+1, table[i]->name,table[i]->quantity);
		puts("");	
	}
	puts("");
}

void printList(){
	clearScreen();
	printf("Brand Name		QTY\n");
	view();
	enterKey();
	menu();
}

void removeConfirmation(Node *curr, int idx){
	printf("Shoe Brand: %s\n",curr->name);
	printf("Quantity: %d\n",curr->quantity);
	char choice = ' ';
	do{
		printf("Are you sure?[y/n]\n");
		scanf(" %c",&choice);
	}while(choice!='y'&& choice!='n');
	
	if(choice=='y'){
	 free(curr);
	 printf("Data succesfully removed!\n");
	}else{
		menu();
	}
}


void remove(char name[]){
		 //1. tentuin tujuan/alamatnya
		 int idx = hash(name);
		 //2. hapus dia
		 if(table[idx]!=NULL && strcmp(table[idx]->name,name)==0){
		 removeConfirmation(table[idx],idx);
		 table[idx]=NULL;
		 } else{
		 	int baseIdx = idx; // untuk nmpung idx asli
		 	do{
		 		if(table[idx]!=NULL && strcmp(table[idx]->name,name)==0){
		 		removeConfirmation(table[idx],idx);
		 		table[idx]=NULL;
		 		return;
			 }
			 idx = (idx+1)%size;
			} while (idx!=baseIdx);
		 printf("%s is not found. \n",name);
		 puts("");
	}
}


void removeBrand(){
clearScreen();
char tempName[50];
printf("Input Shoe Brand to Delete: ");
scanf(" %[^\n]",&tempName);
remove(tempName);
enterKey();
menu();
}

void menu(){
	clearScreen();
	
	printf("SAGO Shoes Brand List\n===============\n");
	printf("1. View list\n");
	printf("2. Insert Shoe Brand\n");
	printf("3. Delete Shoe Brand\n");
	printf("4. Exit\n___________________\n");
	int selection = 0;
	do{
	printf("=>");
	scanf("%d",&selection);getchar();
	}while(selection<1||selection>4);
	
	switch(selection){
		case 1:
			printList();
			break;
		case 2:
			insertBrand();
			break;
		case 3:
			removeBrand();
			break;
		case 4:
			exit(0);
	}
}

int main() {
	menu();
	return 0;
}
