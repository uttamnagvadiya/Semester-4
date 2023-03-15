#include<stdio.h>

void insertionSort(int a[], int n)
{  
    int i, j, temp;  
    for (i = 1; i < n; i++) {  
        temp = a[i];  
        j = i - 1;  
  
        while(j>=0 && temp <= a[j]){    
            a[j+1] = a[j];     
            j = j-1;    
        }    
        a[j+1] = temp;    
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
	
	insertionSort(arr, n);
	
	for (i=0; i<n; i++) {
		printf("%d | ", arr[i]);
	}
}
