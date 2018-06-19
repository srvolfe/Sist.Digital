#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h> // fabs(x) = |x|
// --
#include "funcoes.h" 
// --
#define altura  30 // linhas da matriz  (tamanho da tela)
#define largura 30 // colunas da matriz (tamanho da tela)

int i = 0; // contador
int j = 0; // contador

char matriz[altura][largura];

bool p1_na_matriz = false;
bool p2_na_matriz = false;
bool p3_na_matriz = false;
bool p4_na_matriz = false; 

//
Ponto* cria_ponto(int x, int y) {
	Ponto *ponto = (Ponto*) malloc(sizeof(Ponto));
	ponto->x = x;
	ponto->y = y;
	return ponto;
}

//
Triangulo * cria_triangulo(Ponto * p1, Ponto * p2, Ponto * p3){
     Triangulo* t = (Triangulo*)malloc(sizeof(Triangulo));
     t->p1 = p1;
     t->p2 = p2;
     t->p3 = p3;
     t->area = 0.0; // float
     return t;
}

//
float area_triangulo(Triangulo * t){ //
/*
	a área de um triângulo(que possui 3 pontos)
	pode ser calculada pelo cálculo da determinante de uma matriz de ordem 3
	Obs.: necessário última coluna ser igual a 1

	determinante
	| x1 y1  1 | // ponto 1
	| x2 y2  1 | // ponto 2
	| x3 y3  1 | // ponto 3 /*

	// --

	/* diagonais principais (linha*coluna)
		[ x1 x2 x3 ]* [ y2 ]
		 			  [ y3 ]
		 			  [ y1 ] */
	int diagonais_principais  =  
		// módulo(distância em relação a zero)
		(t->p1)->x * (t->p2)->y + // x1*y2
		(t->p2)->x * (t->p3)->y + // x2*y3
		(t->p3)->x * (t->p1)->y // x3*y1
	;

	// --

	/* diagonal secundária (linha*coluna)
		[ x3 x2 x1 ]* [ y2 ]
		 			  [ y1 ]
	    			  [ y3 ] */
	int diagonais_secundarias = 
	
		(t->p3)->x * (t->p2)->y + // x3*y2
		(t->p2)->x * (t->p1)->y + // x2*y1
		(t->p1)->x * (t->p3)->y  // x1*y3
	;	

	t->area = fabs(diagonais_principais - diagonais_secundarias);
	// fabs() = módulo(valor positivo)
	return t->area;
}

void limpa_matriz() { // limpeza matriz

    for(i = 0; i <= altura; i++){
      for(j=0; j <= largura; j++){
        matriz[i][j] = '.';
      }
    }

}

void imprime_triangulo(){ // impressão da matriz
 	
 	printf("\n\t\t\t");

    for(i = 0; i <= altura; i++) {
      for(j=0; j <= largura; j++){
         printf("%c ",matriz[i][j]);
      }
      printf("\n\t\t\t");
    }

    printf("\n\n");

}

bool ponto_dentro(Triangulo * t1, Ponto * p4){

	Ponto * p1 = t1->p1;
	Ponto * p2 = t1->p2;
	Ponto * p3 = t1->p3;

	Triangulo * t2 = cria_triangulo(p1,p2,p4);
    Triangulo * t3 = cria_triangulo(p1,p3,p4);
    Triangulo * t4 = cria_triangulo(p2,p3,p4);

    float a1 = area_triangulo(t1);
    // --
    float a2 = area_triangulo(t2);
    float a3 = area_triangulo(t3);
    float a4 = area_triangulo(t4);

    return (a1 == a2+a3+a4);
}

void preenche_matriz(Triangulo * t1, Ponto * p4){ // preenchimento da matriz

    Ponto * ponto_matriz;
    for(i = 0; i <= altura; i++) {
      for(j = 0; j <= largura; j++){

        ponto_matriz = cria_ponto(j,i); // x = j, y = i
        if( ponto_dentro( t1 ,ponto_matriz) ) matriz[i][j] = '#';
        // armazena na posição da matriz se estiver dentro do triangulo


        if(  !p1_na_matriz && j == ( (t1->p1->x) ) && i == ( (t1->p1->y) )  ){
            matriz[i][j] = '1', p1_na_matriz = true;
        }

        if(  !p2_na_matriz && j == ( (t1->p2->x) ) && i == ( (t1->p2->y) )  ){
            matriz[i][j] = '2', p2_na_matriz = true;
        }

        if(  !p3_na_matriz && j == ( (t1->p3->x) ) && i == ( (t1->p3->y) )  ){
            matriz[i][j] = '3', p3_na_matriz = true;
        }

        if(!p4_na_matriz && j == ( (p4->x) ) && i == ( (p4->y) )
        ){
            matriz[i][j] = '4';
            p4_na_matriz = true;
        }


      } // end j
    } // end i

}

void observacoes(){
	printf("\n\n\t"
		"SISTEMA DESENVOLVIDO PARA:\n\t"
	 	"- Verificação se um ponto informado está dentro de um triângulo(informado),\n\t"
	 	"  composto por três pontos de pares ordenados (x,y).\n\t"
	 	"- Impressão do triângulo informado na tela\n\n\t"
	 	"--\n\t"
		"Observações:\n\t"
		" - Ordem da matriz = 30\n\t"
		" - Informe somente números inteiros para os pontos,\n\t"
		"   separando-os por espaços (Ex.: 1 1)"
	);
}