int result[6]={1,2,3,4,5,6};
int temp=2;
int main()
{
	for(int i=1;i<=5;i++)
	{
		result[i]=result[i]+1;
		temp=temp*i;
	}
  putint(temp);
  putch('\n');
  for (int i = 1; i <= 5; i++) {
    putint(result[i]);
    putch('\n');
  }
	return 0;
}