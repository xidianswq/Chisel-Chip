#include <stdio.h>
int main()
{
        int i = 0;
        int j = 0;
        for(i=0;i<10;i++){
        	for(j=0;j<10;j=j+2){
			if(j>i)break;
        	}
        }
        asm volatile("unimp");
        asm volatile("unimp");
        return 0;
}
