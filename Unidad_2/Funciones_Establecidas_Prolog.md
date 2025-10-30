# Funciones Establecidas por Prolog
**Orozco Mora Jorge Alexander**
*NC: 22120703*

---
**write/1**: Muestra texto o valores en pantalla.
~~~
?- write('Hola mundo').
Hola mundo
~~~

**writeln/1**: Igual que write/1, pero hace salto de línea al final.
~~~
?- writeln('Hola mundo').
Hola mundo
~~~

**nl/0**: Inserta una nueva línea en la consola.
~~~
?- write('Hola'), nl, write('Mundo').
Hola
Mundo
~~~

**tab/1**: Imprime un número dado de espacios.
~~~
?- write('Hola'), tab(4), write('Mundo').
Hola    Mundo
~~~

**read/1**: Lee un valor ingresado por el usuario.
~~~
?- read(X).
hola.
X = hola.
~~~

**get_char/1**: Lee un solo carácter del teclado.
~~~
?- get_char(C).
a
C = 'a'.
~~~

**put_char/1**: Imprime un solo carácter.
~~~
?- put_char('A').
A
~~~

**true/0**: Siempre se cumple, se usa para validación básica.
~~~
?- true.
true.
~~~

**fail/0**: Siempre falla, se usa para forzar backtracking.
~~~
?- fail.
false.
~~~

**not/1**: Niega una condición (si es verdadera, falla).
~~~
?- not(5 > 10).
true.
~~~

**!/0 (cut)**: Detiene el backtracking para fijar una decisión.
~~~
max(A,B,A) :- A >= B, !.
max(_,B,B).
?- max(5,3,X).
X = 5.
~~~

**;/2**: Operador lógico OR, prueba alternativas.
~~~
?- X = 1 ; X = 2.
X = 1 ;
X = 2.
~~~

**->/2**: If-then (si se cumple, ejecuta algo).
~~~
?- (5 > 3 -> writeln('Mayor')).
Mayor
~~~

**->/3**: If-then-else (elige entre dos opciones).
~~~
?- (5 < 3 -> writeln('Menor') ; writeln('Mayor')).
Mayor
~~~

**is/2**: Calcula una expresión matemática y la asigna.
~~~
?- X is 3 + 4.
X = 7.
~~~

**>/2**: Comprueba si el valor izquierdo es mayor.
~~~
?- 7 > 4.
true.
~~~

**</2**: Comprueba si el valor izquierdo es menor.
~~~
?- 2 < 5.
true.
~~~

**>=/2**: Mayor o igual.
~~~
?- 5 >= 5.
true.
~~~

**=</2**: Menor o igual.
~~~
?- 4 =< 6.
true.
~~~

**=:=/2**: Iguales aritméticamente (después de calcular).
~~~
?- 2 + 2 =:= 4.
true.
~~~

**==/2**: Diferentes aritméticamente.
~~~
?- 2 == 2.
true.
~~~

**=/2**: Intenta unificar dos valores (igualar).
~~~
?- X = hola.
X = hola.
~~~

**sort/2**: Ordena y elimina duplicados.
~~~
?- sort([3,1,2,3],L).
L = [1,2,3].
~~~

**forall/2**: Verdadero si todas las soluciones satisfacen condición.
~~~
?- forall(member(X,[1,2,3]), X > 0).
true.
~~~

**assert/1**: Agrega un hecho o regla al programa.
~~~
?- assert(animal(perro)).
true.
~~~

**assertz/1**: Agrega un hecho al final de la base de datos.
~~~
?- assertz(animal(gato)).
true.
~~~

**asserta/1**: Agrega un hecho al inicio de la base de datos.
~~~
?- asserta(animal(loro)).
true.
~~~

**retract/1**: Borra un único hecho que coincida.
~~~
?- retract(animal(gato)).
true.
~~~

**retractall/1**: Borra todos los hechos que coincidan.
~~~
?- retractall(animal(_)).
true.
~~~

**member/2**: Verifica si un elemento está en una lista.
~~~
?- member(a,[a,b,c]).
true.
~~~

**append/3**: Une dos listas o las divide.
~~~
?- append([1,2],[3,4],R).
R = [1,2,3,4].
~~~

**length/2**: Obtiene o verifica la longitud de una lista.
~~~
?- length([a,b,c],N).
N = 3.
~~~

**reverse/2**: Invierte el orden de una lista.
~~~
?- reverse([1,2,3],R).
R = [3,2,1].
~~~

**atom/1**: Verifica si algo es un átomo.
~~~
?- atom(hola).
true.
~~~

**integer/1**: Verifica si algo es un número entero.
~~~
?- integer(5).
true.
~~~

**number/1**: Verifica si es un número (entero o decimal).
~~~
?- number(5.3).
true.
~~~

**var/1**: Verifica si el valor es una variable sin asignar.
~~~
?- var(X).
true.
~~~

**nonvar/1**: Verifica que NO sea variable.
~~~
?- X=3, nonvar(X).
true.
~~~

**between/3**: Genera números en un rango.
~~~
?- between(1,3,X).
X = 1 ; X = 2 ; X = 3.
~~~

**msort/2**: Ordena lista manteniendo repetidos.
~~~
?- msort([3,1,3],X). 
X=[1,3,3].
~~~