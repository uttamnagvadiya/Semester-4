#include<stdio.h>

void selectionSort(int arr[], int n)  
{  
    int i, j, small;  
      
    for (i = 0; i < n-1; i++){  
        small = i;
          
        for (j = i+1; j < n; j++) {
        	if (arr[j] < arr[small]) {
        		small = j;	
			}		
		}   
		
	    int temp = arr[small];  
	    arr[small] = arr[i];  
	    arr[i] = temp;  
    }  
}  


void main(){
	int n,i;
	
	printf("Enter the number : ");
	scanf("%d", &n);
	
	int arr[n];
	
	for (i=0; i<n; i++) {
		printf("Enter the value at [%d] : ", i);
		scanf("%d", &arr[i]);
	}
	
	selectionSort(arr, n);
	
	for (i=0; i<n; i++) {
		printf("%d | ", arr[i]);
	}
}
