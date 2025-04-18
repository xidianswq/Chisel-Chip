#include <stdio.h>
int main()
{
        unsigned int i = 0;
        unsigned int j = 5;
        unsigned int k = 0;
        while(i<10){
		if(j>=i)k=k+1;
		i=i+1;
        }
        asm volatile("unimp");
        asm volatile("unimp");
        return 0;
}
