/**
 * This version is stamped on May 10, 2016
 *
 * Contact:
 *   Louis-Noel Pouchet <pouchet.ohio-state.edu>
 *   Tomofumi Yuki <tomofumi.yuki.fr>
 *
 * Web address: http://polybench.sourceforge.net
 */
/* jacobi-2d.c: this file is part of PolyBench/C */

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

/* Include polybench common header. */
#include "../../utilities/polybench.h"

/* Include benchmark-specific header. */
#include "jacobi-2d.h"
#include <new>
using namespace std;
unsigned long long* p0;
int amo,t2;
int v[32888];
long long q[2*161][161];
bool done[16];
/* Array initialization. */
void try_fpga()
{
	if (!p0[6])
	{
		printf("amo--%d t2:%d done[t2]:%d\n",amo,t2,done[t2]);
		if (amo==16) return;
		while (done[t2]) {t2++;t2=t2%16;}
		done[t2]=1;amo++;	
		printf("fpga processing %d done[%d]=%d\n",t2,t2,done[t2]);
    	p0[1] = (unsigned long long)u[t2];//ReadBase
		p0[2] = (unsigned long long)u[t2];//WriteBase
			
  		p0[6]=0;p0[6]=1;
		
	}
}
/* Array initialization. */
static
void init_array_jacobi (int n,long long A[161][161],long long B[161][161])
{
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      {
	A[i][j] = ((DATA_TYPE) i*(j+2) + 2) ;
	B[i][j] = ((DATA_TYPE) i*(j+3) + 3) ;
      }
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */

void kernel_jacobi_2d(long long A[2*161][161])
{
  int t, i, j;
  int tsteps=40;
  int n=161;
#pragma scop
  for (t = 0; t < 40; t++)
    {
      try_fpga();
	  if (amo==16) return;
      for (i = 1; i < n - 1; i++)
	kernel_jacobi_2d_label0:for (j = 1; j < n - 1; j++)
	  A[i+n][j] =  (A[i][j] + A[i][j-1] + A[i][1+j] + A[1+i][j] + A[i-1][j])/5;
      for (i = 1; i < N - 1; i++)
	kernel_jacobi_2d_label1:for (j = 1; j < n - 1; j++)
	  A[i][j] =  (A[i+N][j] + A[i+N][j-1] + A[i+N][1+j] + A[1+i+N][j] + A[i-1+N][j])/5;
    }
#pragma endscop

}

int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  printf("here\n");
  int n = N;
  int tsteps = TSTEPS;

  int (*A)[N];
  /* Variable declaration/allocation. */

  /* Initialize array(s). */
	t2=8;amo=0;
	int i;
	for (i=1;i<3;i++)
{
  printf("%d\n",i);
	A=u[i];
  init_array_jacobi (161, (long long (*)[161])A[0], (long long (*)[161])A[161]);
  
}
	p0 =(unsigned long long *) new((unsigned long long *)0xffff00000000) unsigned long long[10];//Contro Port
	//printf("111111");
	p0[0] = 81;	
	p0[8] = 1;
	p0[3] = 9;//CurrentThreadID
	p0[4] = 2*N*N;//Memory Range
	p0[5] = 4;//MemorySize
	p0[7] = 0;//Terminat

  /* Start timer. */
  polybench_start_instruments;

  /* Run kernel. */
memset(done,0,sizeof(done));
  int tmpp,tmp=0;
for (i=2;i>=1;i--)
	{
    	p0[1] = (unsigned long long)u[i];//ReadBase
		p0[2] = (unsigned long long)u[i];//WriteBase
  		p0[6]=0;p0[6]=1;
		while(p0[6]) {tmpp=(tmp+17)%(32888);v[tmp]=v[tmpp]+21;tmp=tmpp;}
	}
  //p0[6]=0;p0[6]=1;while(p0[6]);
  /* Stop and print timer. */
  polybench_stop_instruments;
  polybench_print_instruments;

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  //polybench_prevent_dce(print_array(A));



  return 0;
}
