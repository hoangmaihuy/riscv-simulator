#include<stdio.h>

int a=1,b=2,c=3;

int main()
{
	a=b+c;
	b=a*c;
	c=b-c;
	a=b/c;
  putint(a); putch('\n');
  putint(b); putch('\n');
  putint(c); putch('\n');
	return 0;
}