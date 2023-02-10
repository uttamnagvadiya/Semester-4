#include<stdio.h>
#include<math.h>

long int equation(long int p, long int q,  long int r) {
	return (long int)(pow(10, 4) * p + (pow(10, 2) * (r - p - q)) + q);
}

long int divide_conquer (long int w, long int x, long int y, long int z) {
	long int p, q, r;
	p = w * y;
	q = x * z;
	r = (w + x) * (y + z);
	
	return equation(p, q, r);
}

void main () {
	long int num1, num2, w, x, y, z;
	
	printf("Enter the Number 1 : ");
	scanf("%d", &num1);
	printf("Enter the Number 2 : ");
	scanf("%d", &num2);
	
	w = num1 / 100;
	x = num1 % 100;
	y = num2 / 100;
	z = num2 % 100;
	
	printf("Answer = %ld", divide_conquer(w, x, y, z));
	
}
