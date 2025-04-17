#include <stdio.h>
int main()
{
        unsigned int i = 0;
        unsigned int j = 0;
        for(i=0;i<10;i=i+1){
        	for(j=0;j<10;j=j+2){
			if(j>=i)break;
        	}
        }
        asm volatile("unimp");
        asm volatile("unimp");
}
