/*
 * Source: https://rosettacode.org/wiki/Conway%27s_Game_of_Life#C
 * Change log: unrolling inner loops
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define for_x for (int x = 0; x < w; x++)
#define for_y for (int y = 0; y < h; y++)
#define for_xy for_x for_y
#define for_yx for_y for_x

void show(void *u, int w, int h)
{
	char (*univ)[w] = u;
	printf("\033[H");
	for_y {
		for_x printf(univ[y][x] ? "\033[07m  \033[m" : "  ");
		printf("\033[E");
	}
	fflush(stdout);
}

void evolve(void *u, int w, int h)
{
	unsigned char (*univ)[w] = u;
	unsigned char new[h][w];

	for_yx {
		unsigned char n = univ[(y-1+h)%h][(x-1+w)%w] + univ[(y-1+h)%h][(x  +w)%w] + univ[(y-1+h)%h][(x+1+w)%w] +
		                  univ[(y  +h)%h][(x-1+w)%w] +                              univ[(y  +h)%h][(x+1+w)%w] +
		                  univ[(y+1+h)%h][(x-1+w)%w] + univ[(y+1+h)%h][(x  +w)%w] + univ[(y+1+h)%h][(x+1+w)%w]; 
		new[y][x] = ((n | univ[y][x]) == 3);
	}
	for_yx univ[y][x] = new[y][x];
}

void game(int w, int h)
{
	unsigned char univ[h][w];
	for_xy univ[y][x] = rand() < RAND_MAX / 10 ? 1 : 0;
	while (1) {
		show(univ, w, h);
		evolve(univ, w, h);
		usleep(200000);
	}
}

int main(int c, char **v)
{
	int w = 0, h = 0;
	if (c > 1) w = atoi(v[1]);
	if (c > 2) h = atoi(v[2]);
	if (w <= 0) w = 30;
	if (h <= 0) h = 30;
	game(w, h);
}

