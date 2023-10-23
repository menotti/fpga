/*
 * Source: https://rosettacode.org/wiki/Conway%27s_Game_of_Life#C
 * Change log: global variables and 1D arrays 
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define h 30
#define w 30

#define for_x for (int x = 0; x < w; x++)
#define for_y for (int y = 0; y < h; y++)
#define for_xy for_x for_y
#define for_yx for_y for_x

#define _idx(x,y) ((((x) <<5) - ((x)<<1)) + (y)) // for 30
// #define _idx(x,y) ((((x) <<6) + ((x)<<8)) + (y)) // for 640

unsigned char univ[h*w];
unsigned char b1[w], b2[w], tail[w], head[w];
unsigned char n;

void show()
{
	printf("\033[H");
	for_y {
		for_x printf(univ[_idx(y,x)] ? "\033[07m  \033[m" : "  ");
		printf("\033[E");
	}
	fflush(stdout);
}


void evolve()
{
	// prologue
	for_x {
		head[x] = univ[_idx(0, x)]; 
		tail[x] = univ[_idx(h-1, x)]; 
	}
	// kernel
	for (int y = 0; y < h-1; y++) { 
		for_x {
			n = tail          [x ? x-1 : w-1 ] + tail     [x]      + tail          [x==w-1 ? 0 : x+1 ] +
			    univ[_idx(y  , x ? x-1 : w-1)] +                     univ[_idx(y  , x==w-1 ? 0 : x+1)] +
			    univ[_idx(y+1, x ? x-1 : w-1)] + univ[_idx(y+1,x)] + univ[_idx(y+1, x==w-1 ? 0 : x+1)]; 
			b1[x] = ((n | univ[_idx(y,x)]) == 3);
		}
		for_x {
			tail[x] = univ[_idx(y,x)];
			if (y > 0) 
				univ[_idx(y-1, x)] = b2[x];
			b2[x] = b1[x];
		}
	}
	// epilogue
	for_x {
		n = tail     [x ? x-1 : w-1] + tail   [x] + tail     [x==w-1 ? 0 : x+1] +
		    univ[_idx(h-1, x ? x-1 : w-1)] +              univ[_idx(h-1, x==w-1 ? 0 : x+1)] +
		    head     [x ? x-1 : w-1] + head   [x] + head     [x==w-1 ? 0 : x+1]; 
		b2[x] = ((n | univ[_idx(h-1, x)]) == 3);
	}
	for_x {
		univ[_idx(h-2, x)] = b1[x];
		univ[_idx(h-1, x)] = b2[x];
	}
	
}

void main(int c, char **v)
{
	for_x for_y univ[_idx(y,x)] = rand() < RAND_MAX / 10 ? 1 : 0;
	while (1) {
		show();
		evolve();
		usleep(2000);
	}
}