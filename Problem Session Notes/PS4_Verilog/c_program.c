# include <stdio.h>
int add (int a, int b, int c)
{
	int x = a + b;
	int y = c - 1;
	int z = y + b;
	a = z - x;
	return x + y;
} 
 
int main()
{
	int a, b, c;
	a = 13;
	b = 12;
	c = 4;// c 1 den büyük olmalı
	d = add(a,b,c);
	printf("result is %d\n", c);
	return 0;
}
