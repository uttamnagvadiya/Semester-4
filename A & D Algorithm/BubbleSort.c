#include<stdio.h>
void main() {
	
	int n, i, j, temp;
	
	printf("Enter the Number : ");
	scanf("%d", &n);
	
	int arr[n];
	
	for(i=0; i<n; i++){
		printf("Enter the value at index [%d] : ", i);
		scanf("%d", &arr[i]);	
	}
	
	for(i=0; i<n; i++){
		for(j=0; j<n-1-i; j++){
			if (arr[j]>arr[j+1]){
				temp = arr[j];
				arr[j] = arr[j+1];
				arr[j+1] = temp;
			}
		}
	}
	
	for(i=0; i<n; i++){
		printf("%d , ", arr[i]);
	}
}
