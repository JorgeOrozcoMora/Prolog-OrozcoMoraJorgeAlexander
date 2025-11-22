# Series Matematicas Mapcar
**Orozco Mora Jorge Alexander**
*NC: 22120703*

---

1. 8, 3, -2,-7,-12
	~~~
	serie1(N, X) :- X is 8 - 5*(N-1).
	~~~
	**Explicacion de la serie:** Esta serie empieza en 8 y cada vez baja 5.
2. 3, 6, 12, 24, 48
	~~~
	serie2(N, X) :- X is 3 * 2**(N-1).
	~~~
	**Explicacion de la serie:** Aquí el número se va duplicando cada vez, empezando desde 3.
3. 4, 9, 16, 25, 36, 49
	~~~
	serie3(N, X) :- X is (N+1)**2.
	~~~
	**Explicacion de la serie:** Son cuadrados perfectos empezando desde 2² (4), luego 3² (9), 4² (16), etc.
4. 5, 10, 17, 26, 37, 50
	~~~
	serie4(N, X) :- X is N*N + 2*N + 2.
	~~~
	**Explicacion de la serie:** La serie aumenta de manera curva. Crece cada vez más porque viene de una fórmula cuadrática (N² + 2N + 2).
5. 6, 11, 18, 27, 38, 51
	~~~
	serie5(N, X) :- X is N*N + 2*N + 3.
	~~~
	**Explicacion de la serie:** Es igual que la anterior, pero todos los valores están aumentados en 1. Viene de N² + 2N + 3.
6. 3, 8, 15, 24, 35, 48
	~~~
	serie6(N, X) :- X is N*N + 2*N.
	~~~
	**Explicacion de la serie:** También es una fórmula cuadrática, pero más pequeña que las dos anteriores (N² + 2N).
7. -4, 9, -16, 25, -36, 49
	~~~
	serie7(N, X) :- Signo is (-1)**N, X is Signo * (N+1)**2.
	~~~
	**Explicacion de la serie:** Aquí los números son cuadrados (4, 9, 16, 25, 36, 49), pero cambian entre negativo y positivo con cada paso.
8. 4, -9, 16, -25, 36, -49
	~~~
	serie8(N, X) :- Signo is (-1)**(N-1), X is Signo * (N+1)**2.
	~~~
	**Explicacion de la serie:** Es igual que la serie anterior, pero empieza con positivo y el segundo es negativo. La alternancia empieza al revés.
9. 2/4, 5/9, 8/16, 11/25, 14/36
	~~~
	serie9(N, X) :- Num is 3*N - 1, Den is (N+1)**2, X is Num / Den.
	~~~
	**Explicacion de la serie:** En esta serie el numerador crece de 3 en 3, y el denominador son numeros al cuadrado. Los números se hacen cada vez más pequeños.
10. −5, 7/2, −9/3, 11/4, −13/5
	~~~
	serie10(N, X) :- Signo is (-1)**N, Num is Signo*(2*N + 3), X is Num / N.
	~~~
	**Explicacion de la serie:** Los signos van cambiando, y arriba se usa una expresión que crece (2N+3), mientras que abajo solo es N. Por eso unos valores son negativos y otros positivos.


**Funcion Mapcar**  
El predicado *mapcar(F, Nmax, Lista)* sirve para generar una lista aplicando una función a una secuencia de números consecutivos. Para lograrlo, utiliza *findall*, que permite reunir en una sola lista todos los valores producidos por una expresión. Dentro de findall, se generan los números del 1 hasta *Nmax* mediante *between(1, Nmax, N)*. Por cada valor de *N*, se llama a la función *F* usando *call(F, N, X)*, obteniendo así un resultado X. Todos esos valores X se recopilan automáticamente y se devuelven como la lista final.
~~~
mapcar(F, Nmax, Lista) :- findall(X, (between(1, Nmax, N), call(F, N, X)), Lista).
~~~


**Funcion que se ejecuta para obtener la serie**  
Donde *N* es el numero que elementos que tendra la serie y *Lista* es la variable donde se imprime la serie.
~~~
serie1_lista(N, Lista) :- mapcar(serie1, N, Lista).
serie2_lista(N, Lista) :- mapcar(serie2, N, Lista).
serie3_lista(N, Lista) :- mapcar(serie3, N, Lista).
serie4_lista(N, Lista) :- mapcar(serie4, N, Lista).
serie5_lista(N, Lista) :- mapcar(serie5, N, Lista).
serie6_lista(N, Lista) :- mapcar(serie6, N, Lista).
serie7_lista(N, Lista) :- mapcar(serie7, N, Lista).
serie8_lista(N, Lista) :- mapcar(serie8, N, Lista).
serie9_lista(N, Lista) :- mapcar(serie9, N, Lista).
serie10_lista(N, Lista) :- mapcar(serie10, N, Lista).
~~~