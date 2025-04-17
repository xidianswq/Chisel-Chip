#include <stdio.h>
int main()
{
        int i = 0;
        int j = 0;
        int k = 0;
        for(i=0;i<100;i++){
        	for(j=100;j>0;j--){
        		for(k=0;k<100;k++){
        			if(k>=i+j)break;
        		}
        	}
        }
        asm volatile("unimp");
        return 0;
}
