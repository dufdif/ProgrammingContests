/*
Alfonso Alfonso Peterssen
2 - 8 - 2007
PSN 2007 #65 "Saltando el Tablero!"
*/
#include <cstdio>

#define problem "d"
#define MAXN 110
#define MAXLEN 100

int N, i, j;
int jmp[MAXN][MAXN];

struct big_num {

  int len;
  int dig[MAXLEN];

  void operator += ( const big_num &x ) {
    int i, r = 0, t;
    len >?= x.len;
    for ( i = 0; i <= len; i++ ) {
      t = dig[i] + x.dig[i] + r;
      dig[i] = t % 10;
      r = t / 10;
    }
    if ( r ) dig[ ++len ] = r;
  }

  void print() {
    for ( int i = len; i >= 0; i-- )
      printf( "%d", dig[i] );
  }

  void operator = ( int x ) {
    dig[ len = 0 ] = 0;
    for ( ; x; x /= 10 ) dig[ len++ ] = x % 10;
    if ( len ) len--;
  }

} dp[MAXN][MAXN];

int main() {

  freopen( problem ".in", "r", stdin );
  freopen( problem ".out", "w", stdout );

  scanf( "%d", &N );

  for ( i = 0; i < N; i++ )
    for ( j = 0; j < N; j++ )
      scanf( "%d", &jmp[i][j] );

  dp[0][0] = 1;
  for ( i = 0; i < N; i++ )
    for ( j = 0; j < N; j++ )
      if ( jmp[i][j] ) {
        dp[ i + jmp[i][j] ][j] += dp[i][j];
        dp[i][ j + jmp[i][j] ] += dp[i][j];
      }

  dp[N - 1][N - 1].print();
  printf( "\n" );

  return 0;
}

/*
65� Saltando el Tablero!.                                 Croacia 2007
����������������������������������������������������������������������

Un juego  de  tablero  n x  n es  popular con  enteros,  un  entero no
negativo  en  cada  cuadrado.  La meta  es  saltar  hacia  adelante en
cualquier camino leg�timo desde la esquina superior izquierda hasta la
esquina inferior derecha del tablero. Un entero en cualquier  cuadrado
dicta cuan  largo es  el paso  fuera desde  posici�n puede  ser. Si el
tama�o del paso queda fuera  del tablero de juego, entonces  este paso
en esa particular direcci�n est� prohibido. Todos los pasos pueden ser
cualquiera  hacia  la derecha  o  hacia abajo.  Note  que un  0  es un
cuadrado sin salida la cual impide seguir progresando.

Considere  el tablero  de 4  x 4  mostrado en  la Figure  1, donde  el
c�rculo  s�lido  identifica  la posici�n  de  comienzo  y el   c�rculo
discontinuo  identifica  el  destino.  La  Figura 2  muestra  los tres
caminos leg�timos desde el comienzo hacia el destino, con los
irrelevantes n�meros en cada removida.

                    ���������������Ŀ
                    ��Ŀ�   �   �   �
                    ��2�� 3 � 3 � 1 �
                    ���ٳ   �   �   �
                    ���������������Ĵ
                    � 1 � 2 � 1 � 3 �
                    ���������������Ĵ
                    � 1 � 2 � 3 � 1 �
                    ���������������Ĵ
                    �   �   �   �� ��
                    � 3 � 1 � 1 � 0 �
                    �   �   �   �� ٳ
                    �����������������
                        Figura 1

     ���������������Ŀ  ����������������Ŀ  ���������������Ŀ
     ��Ŀ�   �� ��   �  ��Ŀ�   �    �   �  ��Ŀ�   �   �   �
     ��2��   � 3 �   �  ��2��   �    �   �  ��2��   �   �   �
     ���ٳ   �� ٳ   �  ���ٳ   �    �   �  ���ٳ   �   �   �
     ���������������Ĵ  ����������������Ĵ  ���������������Ĵ
     �   �   �   �   �  �   �   �    �   �  �   �   �   �   �
     �   �   �   �   �  �   �   �    �   �  �   �   �   �   �
     �   �   �   �   �  �   �   �    �   �  �   �   �   �   �
     ���������������Ĵ  ����������������Ĵ  ���������������Ĵ
     �   �   �   �   �  �� ��� ��    �� ��  �� ��   �   �   �
     �   �   �   �   �  � 1 � 2 �    � 1 �  � 1 �   �   �   �
     �   �   �   �   �  �� ٳ� ٳ    �� ٳ  �� ٳ   �   �   �
     ���������������Ĵ  ����������������Ĵ  ���������������Ĵ
     �   �   �� ��� ��  �   �   �    �� ��  �� ��   �   �� ��
     �   �   � 1 � 0 �  �   �   �    � 0 �  � 3 �   �   � 0 �
     �   �   �� ٳ� ٳ  �   �   �    �� ٳ  �� ٳ   �   �� ٳ
     �����������������  ������������������  �����������������
                          Figura 2


Tu tarea es escribir un  programa que determines el n�mero  de caminos
leg�timos desde esquina superior  izquierda hasta la esquina  inferior
derecha.

ENTRADA

El fichero de  entrada JUMP.IN contiene en la primera l�nea un  simple
entero positivo n, 4 <=  n <= 100, el cual  es el n�mero de filas  del
tablero. Las siguientes  n filas  contienen n enteros, cada uno  en el
rango de  0 .. 9.

SALIDA

La salida ser� hacia el  fichero texto JUMP.OUT el cual  debe contener
una  simple l�nea conteniendo un  simple entero, el cual es  el n�mero
de  caminos leg�timos  desde la  esquina superior  izquierda hasta  la
esquina inferior derecha

Ejemplo de Entrada y Salida:

JUMP.IN          JUMP.OUT

4                3
2 3 3 1
1 2 1 3
1 2 3 1
3 1 1 0

Evaluaci�n

El n�mero de caminos leg�timos puede  ser muy grande. Solo el 70%  de
los puntos pueden  ser archivado usando un entero de 64-bit (Int64 en
Pascal). Le garantizamos que todas las entradas tendr�n un n�mero de
caminos leg�timos que puede ser con no m�s de 100 d�gitos.
*/
