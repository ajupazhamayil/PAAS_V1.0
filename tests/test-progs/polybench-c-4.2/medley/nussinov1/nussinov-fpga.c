/**
 * This version is stamped on May 10, 2016
 *
 * Contact:
 *   Louis-Noel Pouchet <pouchet.ohio-state.edu>
 *   Tomofumi Yuki <tomofumi.yuki.fr>
 *
 * Web address: http://polybench.sourceforge.net
 */
/* nussinov.c: this file is part of PolyBench/C */

#include <cstdio>
#include <unistd.h>
#include <cstring>
#include <stdint.h>

/* Include polybench common header. */
#include "../../utilities/polybench.h"

/* Include benchmark-specific header. */
#include "nussinov.h"

/* RNA bases represented as chars, range is [0,3] */
typedef char base;
#include <new>
using namespace std;
unsigned long long *p0;
#define match(b1, b2) (((b1)+(b2)) == 3 ? 1 : 0)
#define max_score(s1, s2) ((s1 >= s2) ? s1 : s2)

	
/* Array initialization. */
static
void init_array (
		 int table[N+1][N+1])
{
  int i, j;
  int *seq=&table[N][0];
  //base is AGCT/0..3
  for (i=0; i <N+1; i++) {
     seq[i] = ((i+1)%4);
  }

  for (i=0; i <N; i++)
     for (j=0; j <N+1; j++)
       table[i][j] = 0;
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int n,
		int table[N+1][N+1])

{
  int i, j;
  int t = 0;

  POLYBENCH_DUMP_START;
  POLYBENCH_DUMP_BEGIN("table");
  for (i = 0; i < N; i++) {
    for (j = i; j < N; j++) {
      if (t % 20 == 0) printf ( "\n");
      printf ("%d ",table[i][j]);
      t++;
    }
  }
  POLYBENCH_DUMP_END("table");
  POLYBENCH_DUMP_FINISH;
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
/*
  Original version by Dave Wonnacott at Haverford College <davew@cs.haverford.edu>,
  with help from Allison Lake, Ting Zhou, and Tian Jin,
  based on algorithm by Nussinov, described in Allison Lake's senior thesis.
*/
void kernel_nussinov(int table[N+1][N+1])
{
  int i, j, k;int n=N;
  int *seq=&table[N][0];
#pragma scop
  kernel_nussinov_label11:for (i = N-1; i >= 0; i--) {
	  kernel_nussinov_label13:for (j=i+1; j<N; j++) {

   if (j-1>=0)
      table[i][j] = max_score(table[i][j], table[i][j-1]);
   if (i+1<N)
      table[i][j] = max_score(table[i][j], table[i+1][j]);

   if (j-1>=0 && i+1<N) {
     /* don't allow adjacent elements to bond */
        table[i][j] =(i<j-1)?( max_score(table[i][j], table[i+1][j-1]+match(seq[i], seq[j]))):(max_score(table[i][j], table[i+1][j-1]));
   }

   kernel_nussinov_label12:for (k=i+1; k<j; k++) {
      table[i][j] = max_score(table[i][j], table[i][k] + table[k+1][j]);
   }
  }
 }
#pragma endscop

}


//int (*table)[N+1];
int n = N;
int main()
{
  /* Retrieve problem size. */
  p0 =(unsigned long long *) new((unsigned long long *)0xc0000000) unsigned long long[29];//Contro Port
	int table[N+2][N+1];
  /* Variable declaration/allocation. */
   

  /* Initialize array(s). */
  
  /* Start timer. */
  
		//printf("111111");
// 	p0[0] = 0;
//  p0[6]=0;
//     p0[1] = (unsigned long long)&table;//ReadBase
// 	p0[2] = (unsigned long long)&table;//WriteBase
// 	p0[0] = 81;	
// 	p0[8] = 1;
// 	p0[3] = 9;//CurrentThreadID
// 	p0[4] = (N+1)*(N+1);//Memory Range
// 	p0[5] = 4;//MemorySize
// 	p0[7] = 0;//Terminat
//   /* Run kernel. */
//  // kernel_nussinov (table);
//   int b[512*1024/4];
//   int pp;
// /*  for (pp=0;pp<512*1024/4;pp++)
// 	b[pp]=pp;*/
//  p0[6]=0;p0[6]=1;while(p0[6]);



	uint32_t size =n;
	uint32_t pid = getpid()*getpid();
	uint64_t r =0;
	r=r|pid;
	r=r<<32;
	r=r|size;
	p0[0] = r;
	// p0[13] = 0; 	
	printf("p00=%lu      pid=%lu    what=%d\n",p0[0],getpid()*getpid(), (p0[0] == getpid()*getpid()) );
	while(p0[0] != getpid()*getpid()); // Wait for FPGA
	p0[8] = 1;// Try to occupy the FPGA
	p0[1] = (unsigned long long)&table;//ReadBase
	p0[2] = (unsigned long long)&table;//WriteBase
	p0[3] = getpid();//CurrentThreadID
	p0[4] = (N+1)*(N+1);
	p0[5] = 4;//MemorySize
	p0[7] = 0;//Terminat
	//printf("22222");
   int b[512*1024/4];
   int pp;
  init_array (table);
  polybench_start_instruments;
	p0[6] = 0;//RunState
	p0[6]=1;
 
	while(p0[6]);



  /* Stop and print timer. */
  polybench_stop_instruments;
  //polybench_print_instruments;

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
	
  // print_array(n, table);

  /* Be clean. */
 // POLYBENCH_FREE_ARRAY(seq);
 // POLYBENCH_FREE_ARRAY(table);
  p0[8] = 0;
  printf("releasing it\n\n\n\n");
  return 0;
}




