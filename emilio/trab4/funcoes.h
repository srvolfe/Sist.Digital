#ifndef _FUNCOES_H_
#define _FUNCOES_H_

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h> // fabs(x) = |x|

// 
struct ponto {
	int x;
	int y;
}; typedef struct ponto Ponto;

struct triangulo {
	Ponto * p1;
	Ponto * p2;
	Ponto * p3;
	float area;
}; typedef struct triangulo Triangulo;

// 
Ponto * cria_ponto(int x, int y);

//
Triangulo * cria_triangulo(Ponto * p1, Ponto * p2, Ponto * p3);

// 
float area_triangulo(Triangulo * t);

void limpa_matriz();
void imprime_triangulo();
bool ponto_dentro();
void preenche_matriz(Triangulo * t1, Ponto * p4);
void observacoes();

#endif
