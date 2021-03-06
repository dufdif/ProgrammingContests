{koder: A^2P}
{PSN 2002 #66 "Comida Ol�mpica"}
{31-08-06}
{O(n)}
{$I-,Q-,R-,S-}
const
  filein = 'd.in';
  fileout = 'd.out';
  MaxN = 50000;
var
  fin,fout        : text;
  N,i             : word;
  c               : array[1..MaxN] of word;
  mark            : array[0..MaxN] of boolean;

begin
  {fload}
  assign(fin,filein); reset(fin);
  assign(fout,fileout); rewrite(fout);

  {dread}
  readln(fin,N);
  for i:=1 to N do readln(fin,c[i]);

  {solve}
  mark[0] := true;
  for i:=1 to N do
  begin
    if not mark[c[i]] then
    begin
      mark[c[i]] := true;
      if not mark[c[i] - 1] then dec(c[i]);
    end else inc(c[i]);
    mark[c[i]] := true;
  end;{for}

  {dprint}
  for i:=1 to N do writeln(fout,c[i]);

  {fclose}
  close(fin);
  close(fout);
end.{main}

{
66� Comida Ol�mpica                                         Korea 2002
����������������������������������������������������������������������

En  los Juegos Ol�mpicos hay N (3<=n<=50000) atletas, cada uno marcado
con  un  n�mero  de serie �nico en el rango de 1..N. Cada noche, ellos
hacen  cola para comer formando una l�nea (cola) con los atletas en un
relativo  orden aleatorio. Algunos ordenamientos pueden ser expresados
como un n�mero de N d�gitos en base N.

Al  comit�  organizador  no  le gusta el ordenamiendo aleatorio. Ellos
quieren  que  los atletas se ponga en l�nea de forma tal que el n�mero
que  representa  el  ordenamiento  est�  minimizado. A los atletas, no
obstante,  no  les  gusta  hacer exactamente lo que le dicen que hagan
todo  el  tiempo. El comit� organizador y los atletas han llegado a un
acuerdo:  los  atletas  se  pondr�n  en  fila y entonces se reubicar�n
ellos  m�smos  en  cierto  nuevo  orden que minimice la representaci�n
ordenada.   El  truco  es  que  cada  n�mero  de  serie  en  el  nuevo
ordenamiento  no  puede diferir por m�s de 1 de el n�mero de serie que
utiliz� para ocupar esa posici�n.

Si 8 atletas se ponen en l�nea similar a esta :�8�5�7�3�6�4�2�1�
                                               ���������������Ĵ
Entonces el nuevo ordenamiento ser�a:          �7�4�8�2�6�5�3�1�

porque:

- ning�na posici�n en la segunda lista contiene un d�gito que difiera
  del  d�gito  de  arriba por m�s de 1 (algunas veces la diferencia es
  cero)
_  este  es  el  n�mero  m�s peque�o que puede ser obtenido usando las
  reglas.

Tu tarea es decirle al comit� organizador el nuevo ordenamiento de los
atletas tal que puedan asegurarse que los atletas est�n correctamente.

Entrada

El fichero de entrada DINNER.IN contendr�:
- l�nea 1: una l�nea con un entero simple: N.
- l�nea 2.. N+1: cada l�nea contiene un entero simple que es el n�mero
  de    serie    de    un    atleta    en    la   posici�n  respectiva
- el atleta m�s a la izquierda es dado primero.

Salida

El  fichero  de  salida DINNER.OUT contendr� N l�neas, cada una con un
entero simple que dice cual atleta pertenece a la respectiva ranura.
La  primera  l�nea de salida contiene el n�mero de serie del atleta en
la ranura de hacia la izquierda y asi sucesivamente.

Ejemplo de Entrada y Salida

�����������Ŀ ������������Ŀ
� DINNER.IN � � DINNER.OUT �
�����������Ĵ ������������Ĵ
� 8         � � 7          �
� 8         � � 4          �
� 5         � � 8          �
� 7         � � 2          �
� 3         � � 6          �
� 6         � � 5          �
� 4         � � 3          �
� 2         � � 1          �
� 1         � ��������������
�������������
}
