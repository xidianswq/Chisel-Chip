#include <stdio.h>
#define NUM 15
int main()
{

        unsigned int i;
        unsigned int j;
        unsigned int k;
	for(i=0,k=0;i<NUM;i++){
		for(j=0;j<NUM;j++){
			if(j>i)k++;
		}
	}
        asm volatile("unimp");
        asm volatile("unimp");
        return 0;
}
