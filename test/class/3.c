int result[5]={1,2,3,4,5};
int main()
{
	int i=0;
	for(i=0;i<5;i++)
	{
		result[i]=result[i]*i;
	}
  for (i = 0; i < 5; i++) {
    putint(result[i]);
    putch('\n');
  }
	return 0;
}

/*
lw      a4,-20(s0)
li      a5,4
blt     a5,a4,101a8 <main+0x68>
lui     a5,0x11
lw      a4,-20(s0)
slli    a4,a4,0x2
addi    a5,a5,-576 # 10dc0 <_fdata>
add     a5,a4,a5
lw      a4,0(a5)
lw      a5,-20(s0)
mulw    a4,a4,a5
lui     a5,0x11
lw      a3,-20(s0)
slli    a3,a3,0x2
addi    a5,a5,-576 # 10dc0 <_fdata>
add     a5,a3,a5
sw      a4,0(a5)
lw      a5,-20(s0)
addiw   a5,a5,1
sw      a5,-20(s0)
j       10154 <main+0x14>

*/