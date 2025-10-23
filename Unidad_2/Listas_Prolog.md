# Listas en Prolog
**Orozco Mora Jorge Alexander**
*NC: 22120703*

---
- Ejercicio 1: Cabeza y cola de una lista
	~~~
	% ejemplo: cabeza_y_cola([a,b,c,d], C, T).
	cabeza_y_cola([Cabeza|Cola], Cabeza, Cola).
	~~~
	**Explicacion del Codigo:** El operador [Cabeza|Cola] separa la lista en su primer elemento (Cabeza) y el resto de la lista (Cola).
	
- Ejercicio 2: Verificar si un elemento pertenece a una lista
	~~~
	% ejemplo: pertenece(b, [a,b,c]).
	pertenece(X, [X|_]).
	pertenece(X, [_|Resto]) :- pertenece(X, Resto).
	~~~
	**Explicacion del Codigo:** La primera regla dice que X pertenece a la lista si es el primer elemento. La segunda regla recorre recursivamente el resto de la lista hasta encontrar X. Esto permite verificar si un elemento está en cualquier posición de la lista.
	
- Ejercicio 3: Calcular la longitud de una lista
	~~~
	% ejemplo: longitud([a,b,c,d], N).
	longitud([], 0).
	longitud([_|Resto], N) :- longitud(Resto, M), N is M + 1.
	~~~
	**Explicacion del Codigo:** Si la lista está vacía, su longitud es 0.
Si tiene elementos, se descarta la cabeza (_) y se calcula la longitud del resto recursivamente, sumando 1 por cada elemento.
	
- Ejercicio 4: Concatenar dos listas
	~~~
	% ejemplo: concatenar([1,2], [3,4], R).
	concatenar([], L, L).
	concatenar([X|R1], L2, [X|R3]) :- concatenar(R1, L2, R3).
	~~~
	**Explicacion del Codigo:** Si la primera lista está vacía, el resultado es la segunda lista. xSi no, se toma la cabeza de la primera lista y se concatena recursivamente el resto de la lista con la segunda, formando la lista final.
	
- Ejercicio 5: Invertir una lista
	~~~
	% ejemplo: invertir([a,b,c,d], R).
	invertir([], []).
	invertir([X|Resto], R) :- invertir(Resto, R1), concatenar(R1, [X], R).
	~~~
	**Explicacion del Codigo:** La lista vacía invertida sigue siendo vacía. Para invertir, se invierte recursivamente el resto de la lista y luego se añade la cabeza al final, usando concatenación.
	
- Ejercicio 6: Obtener el último elemento
	~~~
	% ejemplo: ultimo([a,b,c,d], X).
	ultimo([X], X).
	ultimo([_|Resto], X) :- ultimo(Resto, X).
	~~~
	**Explicacion del Codigo:** Si la lista tiene un solo elemento, ese es el último. Si no, se ignora la cabeza y se aplica recursivamente al resto hasta llegar al último elemento.
	
- Ejercicio 7: Sumar los elementos de una lista numérica
	~~~
	% ejemplo: suma_lista([2,4,6,8], S).
	suma_lista([], 0).
	suma_lista([X|Resto], S) :- suma_lista(Resto, S1), S is X + S1.
	~~~
	**Explicacion del Codigo:** La suma de una lista vacía es 0. Se suma recursivamente cada cabeza al resultado de sumar el resto de la lista, obteniendo la suma total.
	
- Ejercicio 8: Eliminar un elemento de una lista
	~~~
	% ejemplo: eliminar(c, [a,b,c,d,c], R).
	eliminar(_, [], []).
	eliminar(X, [X|Resto], Resto) :- !.
	eliminar(X, [Y|Resto], [Y|R]) :- eliminar(X, Resto, R).
	~~~
	**Explicacion del Codigo:** Si la lista está vacía, no hay nada que eliminar. Si la cabeza es el elemento a eliminar, se descarta y se usa ! para detener la búsqueda (elimina solo la primera aparición).
Si no, se conserva la cabeza y se aplica recursivamente al resto.
	
- Ejercicio 9: Duplicar los elementos de una lista
	~~~
	% ejemplo: duplicar([a,b,c], R).
	duplicar([], []).
	duplicar([X|Resto], [X,X|R]) :- duplicar(Resto, R).
	~~~
	**Explicacion del Codigo:** La lista vacía se mantiene vacía. Cada cabeza se duplica ([X,X|R]) y se aplica recursivamente al resto de la lista, generando la lista final con elementos repetidos.
	
- Ejercicio 10: Intercalar dos listas
	~~~
	% ejemplo: intercalar([1,3,5], [2,4,6], R).
	intercalar([], L, L).
	intercalar(L, [], L).
	intercalar([X|R1], [Y|R2], [X,Y|R]) :- intercalar(R1, R2, R).
	~~~
	**Explicacion del Codigo:** Si una lista está vacía, el resultado es la otra lista. Si ambas listas tienen elementos, se toman las cabezas de ambas y se colocan alternadas en la lista resultado, aplicando recursión al resto de las listas.