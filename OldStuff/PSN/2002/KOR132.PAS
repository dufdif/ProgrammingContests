{koder: A^2P}
{PSN 2002 #132 "N�mero de Valores Distintos"}
{01-09-06}
{O(n)}
const
  filein = 'd.in';
  fileout = 'd.out';
  MaxR = 10000;
var
  fin,fout        : text;
  N,i,j,k,sol     : word;
  mark            : array[1..MaxR] of boolean;

begin
  {fload}
  assign(fin,filein); reset(fin);
  assign(fout,fileout); rewrite(fout);

  {dread}
  readln(fin,N);

  {solve}
  sol := N;
  for i:=1 to N do
  begin
    readln(fin,j);
    if mark[j] then dec(sol)
      else mark[j] := true;
  end;{for}

  {dprint}
  write(fout,sol);

  {fclose}
  close(fin);
  close(fout);
end.{main}

{
132� N�mero de Valores Distintos                            Korea 2002
����������������������������������������������������������������������

Usted debe escribir un programa que, dado N  valores enteros positivos
X1, X2,..., XN, calcule el  n�mero  de  valores  distintos  en  esos N
valores enteros.

Entrada

Su  programa  leer� la entrada del fichero texto NUMBER.IN. La primera
l�nea  contiene  un  entero: el n�mero N, 2 <= N <= 1000. Las N l�neas
siguientes  representan  los  valores  X1, X2, ..., XN, y  cada uno de
estas l�neas contiene un entero: Xi, 1 = Xi <= 10000.

Salida

Su programa debe escribir la salida hacia el fichero texto NUMBER.OUT.
La  salida  contiene  un entero: el n�mero de valores distintos en X1,
X2, ..., XN.

Ejemplos de Entrada y Salida:

�����������Ŀ  ������������Ŀ     �����������Ŀ  ������������Ŀ
� NUMBER.IN �  � NUMBER.OUT �     � NUMBER.IN �  � NUMBER.OUT �
�����������Ĵ  ������������Ĵ     �����������Ĵ  ������������Ĵ
� 10        �  � 5          �     � 5         �  � 3          �
� 1         �  ��������������     � 123       �  ��������������
� 2         �                     � 321       �
� 3         �                     � 123       �
� 4         �                     � 231       �
� 5         �                     � 321       �
� 4         �                     �������������
� 3         �
� 2         �
� 1         �
� 2         �
�������������

Puntuaci�n

Si  la  salida es correcto, usted consigue puntuaci�n completa para el
caso  de  la  prueba.  Por otra parte la puntuaci�n para el caso de la
prueba ser� 0.
}
