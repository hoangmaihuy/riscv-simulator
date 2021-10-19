#include<stdio.h>
int a=1,b=2,c=3;

void test()
{
	a=b+c;
	b=a*c;
	c=b-c;
	a=b/c;
}

int main()
{
	test();
  putint(a); putch('\n');
  putint(b); putch('\n');
  putint(c); putch('\n');
	return 0;
}