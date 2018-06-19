/*
 * Implementar:
 	- verificação se um ponto informado está dentro de um triângulo,
 	  composto por três pontos de par ordenado (x,y).
 	- impressão do triângulo na tela 

	---------------------------------
	Aluno (s): Douglas Rosa, ...
	E-mail(s): douglasrosa0110@gmail.com, ...
	---------------------------------
	
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h> // fabs(x) = |x|

#include "funcoes.h"

int main(int argc, char **argv)
{
	int x = 0; // contador
	int y = 0; // contador

	observacoes();

	// lendo e criando pontos
    printf("\n\n\tP1 (x,y): ");
    scanf("%d%d",&x,&y);
    Ponto * p1 = cria_ponto(x,y);
    // --
    printf("\tP2 (x,y): ");
    scanf("%d%d",&x,&y);
    Ponto * p2 = cria_ponto(x,y);
    // --
    printf("\tP3 (x,y): ");
    scanf("%d%d",&x,&y);
    Ponto * p3 = cria_ponto(x,y);
    // --
    printf("\t--\n");
    printf("\tP4 (x,y): ");
    scanf("%d%d",&x, &y);
    Ponto * p4 = cria_ponto(x,y);

    // criando triangulos utilizando os pontos criados para posterior cálculo das áreas
    Triangulo * t1 = cria_triangulo(p1,p2,p3);
    // --
    Triangulo * t2 = cria_triangulo(p1,p2,p4);
    Triangulo * t3 = cria_triangulo(p1,p3,p4);
    Triangulo * t4 = cria_triangulo(p2,p3,p4);

    float a1 = area_triangulo(t1);
    // --
    float a2 = area_triangulo(t2);
    float a3 = area_triangulo(t3);
    float a4 = area_triangulo(t4);

    // cálculo das áreas, as quais serão necessárias para verificação de 
    // 'se o ponto está dentro ou fora do triângulo principal (p1,p2,p3)'
    printf( "\n\t\tÁrea do triângulo (p1,p2,p3): %.2f\n", a1 );
    // --
    printf("\t\t--\n");
    printf( "\t\tÁrea do triângulo (p1,p2,p4): %.2f\n", a2 );
    printf( "\t\tÁrea do triângulo (p1,p3,p4): %.2f\n", a3 );
    printf( "\t\tÁrea do triângulo (p2,p3,p4): %.2f\n", a4 );

    printf("\n\t\t\t--\n");
    if(ponto_dentro(t1,p4)) printf("\t\t\tPonto dentro.\n");
    else                    printf("\t\t\tPonto fora.\n\n\n");

    limpa_matriz();
    preenche_matriz(t1,p4);
    imprime_triangulo();

	return 0;
}
