// Title  : Logic.c
// Desc   : Using C to write logic gates and adder funcitons
// Author : Trevor Ransom
// Date   : 12-08-2021

#include<stdio.h>
//functions

// AND Gate
int AND(int a, int b)
{
 if(a + b == 2)
 {
     return 1;
 }
 else
 return 0;
}

// OR Gate
int OR(int a, int b)
{
  if((a + b) > 0)
  {
    return 1;
  }
  else
  return 0;

};

// Exclusive OR Gate
int XOR (int a, int b)
{
  if((a+b) == 1)
  {
    return 1;
  }

  else
  return 0;
};

// NOT Gate
int NOT (int a)
{
  if(a == 1)
  {
    return 0;
  }

  else
  return 1;
};

// IN struct
struct FullAdderIn
{
  int a,b,x;
    
};

// out struct
struct FullAdderOut
{
 int s,c;
 char result[50];
 
};

// adder function
void FullAddr(struct FullAdderIn p)
{
  struct FullAdderOut q;
  
  //s
  q.s =XOR(XOR(p.a,p.b),p.x);
  //c
  q.c = OR(AND(p.x,OR(p.a,p.b)),AND(p.a,p.b));
   
   printf("( %d . %d )\n", q.s, q.c);
   
   

};


int main()
{
    //and gate
    printf("0 AND 0 is: %d\n",AND(0,0));
    printf("0 AND 1 is: %d\n",AND(0,1));
    printf("1 AND 0 is: %d\n",AND(1,0));
    printf("1 AND 1 is: %d\n",AND(1,1));

    printf("\n0 OR 0 is: %d\n",OR(0,0));
    printf("0 OR 1 is: %d\n",OR(0,1));
    printf("1 OR 0 is: %d\n",OR(1,0));
    printf("1 OR 1 is: %d\n",OR(1,1));

    printf("\n0 XOR 0 is: %d\n",XOR(0,0));
    printf("0 XOR 1 is: %d\n",XOR(0,1));
    printf("1 XOR 0 is: %d\n",XOR(1,0));
    printf("1 XOR 1 is: %d\n",XOR(1,1));

    printf("\n0 NOT is: %d\n",NOT(0));
    printf("1 NOT is: %d\n",NOT(1));
    
    // object of FullAdderIn
    struct FullAdderIn I;

    // tests for addrfunct with a struct passed in
    printf("\nFull addr (X,A,B) = (0,0,0): \n");
    I.x= 0; I.a =0; I.b =0;
    FullAddr(I);
    printf("Full addr (X,A,B) = (0,0,1): \n");
    I.x= 0; I.a =0; I.b =1;
    FullAddr(I);
    printf("Full addr (X,A,B) = (0,1,0): \n");
    I.x= 0; I.a =1; I.b =0;
    FullAddr(I);
    printf("Full addr (X,A,B) = (0,1,1): \n");
    I.x= 0; I.a =1; I.b =1;
    FullAddr(I);
    printf("Full addr (X,A,B) = (1,0,0): \n");
    I.x= 1; I.a =0; I.b =0;
    FullAddr(I);
    printf("Full addr (X,A,B) = (1,0,1): \n");
    I.x= 1; I.a =0; I.b =1;
    FullAddr(I);
    printf("Full addr (X,A,B) = (1,1,0): \n");
    I.x= 1; I.a =1; I.b =0;
    FullAddr(I);
    printf("Full addr (X,A,B) = (1,1,1): \n");
    I.x= 1; I.a =1; I.b =1;
    FullAddr(I);
       
    return 0;
    
}

