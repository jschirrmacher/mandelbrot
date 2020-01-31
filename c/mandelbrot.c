#include <stdio.h>
#include <sys/time.h>
#include <string.h>

#define BAILOUT 16
#define MAX_ITERATIONS 10000

int mandelbrot(double x, double y)
{
	double cr = y - 0.5;
	double ci = x;
	double zi = 0.0;
	double zr = 0.0;
	int i = 0;

	while(1) {
		i ++;
		double temp = zr * zi;
		double zr2 = zr * zr;
		double zi2 = zi * zi;
		zr = zr2 - zi2 + cr;
		zi = temp + temp + ci;
		if (zi2 + zr2 > BAILOUT)
			return i;
		if (i > MAX_ITERATIONS)
			return 0;
	}
	
}

int main (int argc, const char * argv[]) {
	struct timeval aTv;
	gettimeofday(&aTv, NULL);
	long init_time = aTv.tv_sec;
	long init_usec = aTv.tv_usec;
	char output[200*200];

	int x,y;
	for (y = -99; y < 99; y++) {
		for (x = -99; x < 99; x++) {
			int i = mandelbrot(x/100.0, y/100.0);
			if (i==0)
			  strcat(output, "*");
			else
			  strcat(output, " ");
		}	
		strcat(output, "\n");
	}
	
	gettimeofday(&aTv,NULL);
	double query_time = (aTv.tv_sec - init_time) + (double)(aTv.tv_usec - init_usec)/1000000.0;	
	printf ("%s\nC Elapsed %0.6f\n", output, query_time);
	return 0;
}
