{koder: A^2P}
{PSN 2005 #70 "Niz"}
const
  filein = 'd.in';
  fileout = 'd.out';
  MaxS = 488899;
var
  fin,fout        : text;
  N,i,j,len       : longint;
  t               : string[6];
  s               : array[1..MaxS] of char;

begin
  {fload}
  assign(fin,filein); reset(fin);
  assign(fout,fileout); rewrite(fout);

  {dread}
  read(fin,N);

  {solve}
  for i:=1 to N do
  begin
    str(i,t);
    for j:=1 to ord(t[0]) do
    begin
      inc(len); s[len] := t[j];
    end;{for}
  end;{for}

  {string-matching.naive(brute-force)}
  for i:=1 to len - ord(t[0]) + 1 do
  begin
    for j:=1 to ord(t[0]) do
      if t[j] <> s[i+j-1] then break;
    if t[j] = s[i+j-1] then break;
  end;{for}

  {dprint}
  write(fout,i);

  {fclose}
  close(fin); close(fout);
end.{main}

{
70� Niz.                                                  Polonia 2005
����������������������������������������������������������������������

Una secuencia de d�gitos  se obtiene escribiendo las  representaciones
decimales  decimales  de  todos   los  enteros  comenzando  con   1  y
continuando  consecutivamente  hasta  un  cierto  n�mero  N  de manera
similar a esta: 12345678910111213141516171819202122 ... etc.

Tarea

Escribir un programa que calcule la posici�n de la primera  ocurrencia
de la reprtesentaci�n decimal del n�mero N en la secuencia.

Entrada

La primera  y �nica  l�nea del  fichero de  entrada NIZ.IN contiene al
entero N, 1  <= N <= 100,000.

Salida

La primera y �nica l�nea  del fichero de salida NIZ.OUT  debe contener
la posici�n de la primera ocurrencia de la representaci�n decimal  del
n�mero N en la secuencia.

Ejemplo de Entrada y Salida

Ejemplo # 1        Ejemplo # 2           Ejemplo # 3

���������Ŀ        ���������Ŀ          ���������Ŀ
� NIZ.IN  �        � NIZ.IN  �          � NIZ.IN  �
���������Ĵ        ���������Ĵ          ���������Ĵ
� 15      �        � 34      �          � 142     �
�����������        �����������          �����������
���������Ŀ        ���������Ŀ          ���������Ŀ
� NIZ.OUT �        � NIZ.OUT �          � NIZ.OUT �
���������Ĵ        ���������Ĵ          ���������Ĵ
� 20      �        � 3       �          � 73      �
�����������        �����������          �����������
}
