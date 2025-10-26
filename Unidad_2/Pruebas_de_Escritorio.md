# Pruebas de Escritorio
**Orozco Mora Jorge Alexander**
*NC: 22120703*

---

size([],0).  
size([X|Y], N):-size(Y, N1), N is N1+1.
~~~
size([1,2,3,4,5],N).
   Call: (12) size([1, 2, 3, 4, 5], _7170) ? creep
   Call: (13) size([2, 3, 4, 5], _8540) ? creep
   Call: (14) size([3, 4, 5], _9352) ? creep
   Call: (15) size([4, 5], _10164) ? creep
   Call: (16) size([5], _10976) ? creep
   Call: (17) size([], _11788) ? creep
   Exit: (17) size([], 0) ? creep
   Call: (17) _10976 is 0+1 ? creep
   Exit: (17) 1 is 0+1 ? creep
   Exit: (16) size([5], 1) ? creep
   Call: (16) _10164 is 1+1 ? creep
   Exit: (16) 2 is 1+1 ? creep
   Exit: (15) size([4, 5], 2) ? creep
   Call: (15) _9352 is 2+1 ? creep
   Exit: (15) 3 is 2+1 ? creep
   Exit: (14) size([3, 4, 5], 3) ? creep
   Call: (14) _8540 is 3+1 ? creep
   Exit: (14) 4 is 3+1 ? creep
   Exit: (13) size([2, 3, 4, 5], 4) ? creep
   Call: (13) _7170 is 4+1 ? creep
   Exit: (13) 5 is 4+1 ? creep
   Exit: (12) size([1, 2, 3, 4, 5], 5) ? creep
N = 5.
~~~
**Explicacion de la Prueba de Escritorio:** Cuando se ejecuta la consulta size([1,2,3,4,5], N)., Prolog empieza analizando la lista para determinar cuántos elementos tiene. Primero observa que la lista no está vacía, así que aplica la regla recursiva y vuelve a llamar al predicado con la cola de la lista, es decir, [2,3,4,5]. Este proceso se repite una y otra vez, quitando el primer elemento en cada paso, hasta que finalmente llega a una lista vacía []. En ese punto, se cumple el caso base y Prolog sabe que el tamaño de una lista vacía es 0.  
A partir de ahí, el programa comienza a regresar en la recursión. En cada retorno, suma 1 al resultado anterior: de la lista vacía obtiene 0, luego suma 1 para la lista [5], obteniendo 1; suma otro 1 para [4,5], obteniendo 2; y así sucesivamente hasta llegar de nuevo a la lista original [1,2,3,4,5]. Finalmente, el resultado acumulado es 5, por lo que Prolog concluye que la lista tiene cinco elementos y muestra la respuesta N = 5.

---

(Primer Enfoque)  
rotar(X,X,0).
rotar([X|Y], L, N):-N1 is N-1, append(Y,[X],Y1), rotar(Y1, L, N1).
~~~
rotar([1,2,3,4],L,2). 
   Call: (12) rotar([1, 2, 3, 4], _9840, 2) ? creep 
   Call: (13) _11212 is 2+ -1 ? creep 
   Exit: (13) 1 is 2+ -1 ? creep 
   Call: (13) lists:append([2, 3, 4], [1], _12840) ? creep 
   Exit: (13) lists:append([2, 3, 4], [1], [2, 3, 4, 1]) ? creep 
   Call: (13) rotar([2, 3, 4, 1], _9840, 1) ? creep 
   Call: (14) _15332 is 1+ -1 ? creep 
   Exit: (14) 0 is 1+ -1 ? creep 
   Call: (14) lists:append([3, 4, 1], [2], _16960) ? creep 
   Exit: (14) lists:append([3, 4, 1], [2], [3, 4, 1, 2]) ? creep 
   Call: (14) rotar([3, 4, 1, 2], _9840, 0) ? creep 
   Exit: (14) rotar([3, 4, 1, 2], [3, 4, 1, 2], 0) ? creep 
   Exit: (13) rotar([2, 3, 4, 1], [3, 4, 1, 2], 1) ? creep 
   Exit: (12) rotar([1, 2, 3, 4], [3, 4, 1, 2], 2) ? creep 
L = [3, 4, 1, 2] ;
~~~
**Explicacion de la Prueba de Escritorio:** Cuando se ejecuta la consulta rotar([1,2,3,4], L, 2)., Prolog recibe la lista [1,2,3,4] y la instrucción de rotarla dos veces hacia la izquierda. Lo primero que hace el programa es calcular el nuevo valor del contador de rotaciones, restándole 1 al número total (2 - 1 = 1). Luego utiliza el predicado append para mover el primer elemento de la lista (el 1) al final, quedando así [2,3,4,1]. Después de esta operación, Prolog vuelve a llamar recursivamente al predicado rotar, ahora con la lista [2,3,4,1] y el nuevo número de rotaciones restante, que es 1.  
En esta nueva llamada, repite el mismo proceso: resta 1 al contador (1 - 1 = 0), toma el primer elemento de la lista (el 2) y lo mueve al final con append, obteniendo la lista [3,4,1,2]. Dado que el contador de rotaciones ahora llegó a 0, Prolog ya no hace más llamadas recursivas y devuelve el resultado final.  
Así, después de realizar dos rotaciones completas, la lista original [1,2,3,4] se transforma en [3,4,1,2], y Prolog muestra la respuesta L = [3,4,1,2].

---

(Segundo Enfoque)  
rotar(X,X,0).  
rotar(L,R, N):-append(X, Y, L), size(X, N), append(Y, X, R).
~~~
rotar([1,2,3,4],R,2).
   Call: (12) rotar([1, 2, 3, 4], _27474, 2) ? creep
   Call: (13) lists:append(_28840, _28842, [1, 2, 3, 4]) ? creep
   Exit: (13) lists:append([], [1, 2, 3, 4], [1, 2, 3, 4]) ? creep
   Call: (13) size([], 2) ? creep
   Fail: (13) size([], 2) ? creep
   Redo: (13) lists:append(_28840, _28842, [1, 2, 3, 4]) ? creep
   Exit: (13) lists:append([1], [2, 3, 4], [1, 2, 3, 4]) ? creep
   Call: (13) size([1], 2) ? creep
   Call: (14) size([], _34584) ? creep
   Exit: (14) size([], 0) ? creep
   Call: (14) 2 is 0+1 ? creep
   Fail: (14) 2 is 0+1 ? creep
   Fail: (13) size([1], 2) ? creep
   Redo: (13) lists:append([1|_32946], _28842, [1, 2, 3, 4]) ? creep
   Exit: (13) lists:append([1, 2], [3, 4], [1, 2, 3, 4]) ? creep
   Call: (13) size([1, 2], 2) ? creep
   Call: (14) size([2], _41110) ? creep
   Call: (15) size([], _41922) ? creep
   Exit: (15) size([], 0) ? creep
   Call: (15) _41110 is 0+1 ? creep
   Exit: (15) 1 is 0+1 ? creep
   Exit: (14) size([2], 1) ? creep
   Call: (14) 2 is 1+1 ? creep
   Exit: (14) 2 is 1+1 ? creep
   Exit: (13) size([1, 2], 2) ? creep
   Call: (13) lists:append([3, 4], [1, 2], _27474) ? creep
   Exit: (13) lists:append([3, 4], [1, 2], [3, 4, 1, 2]) ? creep
   Exit: (12) rotar([1, 2, 3, 4], [3, 4, 1, 2], 2) ? creep
R = [3, 4, 1, 2] ;
~~~
**Explicacion de la Prueba de Escritorio:** Cuando ejecutamos rotar([1,2,3,4], R, 2)., Prolog intenta mover los primeros 2 elementos de la lista al final. Primero, el predicado append(X, Y, [1,2,3,4]) trata de dividir la lista en dos partes X y Y. Prolog prueba primero X = [] y Y = [1,2,3,4], pero al verificar size([], 2) falla porque el tamaño de X no coincide con 2. Luego intenta X = [1] y Y = [2,3,4], pero size([1], 2) también falla. Finalmente encuentra X = [1,2] y Y = [3,4], y size([1,2], 2) es correcto.  
Con estas dos sublistas válidas, Prolog usa append(Y, X, R) para unirlas, obteniendo [3,4] ++ [1,2] = [3,4,1,2]. Así, la lista original [1,2,3,4] se ha rotado 2 posiciones a la izquierda y el resultado R es [3,4,1,2]. El motor de Prolog muestra todo el proceso de prueba y error hasta encontrar la división correcta que cumpla con el tamaño solicitado.