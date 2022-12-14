#include<stdio.h>
void main() {
	long int i=0, num;
	
	FILE *fp, *fptr;
		
//	fp = fopen("jingalala.txt", "w");
	fptr = fopen("jingalala.txt", "r");
	
//	for (i=1; i<=200; i++){
//		fprintf(fp, "%d\n", rand());
//	}
	
	fscanf (fptr, "%d", &i);    
  	while (!feof (fptr))
    {  
      printf ("%d\n ", i);
      fscanf (fptr, "%d", &i);      
    }
  	fclose (fptr);  
	
	
}
