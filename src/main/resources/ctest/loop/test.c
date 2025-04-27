#include <stdio.h>
#define NUM 10
int main()
{

        unsigned int i;
        unsigned int j;
        unsigned int k;
	for(i=0,k=0;i<NUM;i++){
		for(j=NUM;j>0;j--){
			if(j>i)k++;
			else k--;
		}
	}
        asm volatile("unimp");
        asm volatile("unimp");
        return 0;
}
