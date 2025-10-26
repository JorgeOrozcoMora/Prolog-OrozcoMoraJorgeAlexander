# Pruebas de Escritorio de Sistema Medico Experto
**Orozco Mora Jorge Alexander**
*NC: 22120703*

---

buscar([], _, 0).  
buscar(X, E, 1) :- sintomade(X, E).  
buscar([X|Xs], E, P) :- enfermedad(E), buscar(X, E, S1), buscar(Xs, E, S2), P is S1 + S2.

~~~
buscar([diarrea, nauseas], hepatitis, P).
   Call: (12) buscar([diarrea, nauseas], hepatitis, _16686) ? creep
   Call: (13) sintomade([diarrea, nauseas], hepatitis) ? creep
   Fail: (13) sintomade([diarrea, nauseas], hepatitis) ? creep
   Redo: (12) buscar([diarrea, nauseas], hepatitis, _16686) ? creep
   Call: (13) enfermedad(hepatitis) ? creep
   Exit: (13) enfermedad(hepatitis) ? creep
   Call: (13) buscar(diarrea, hepatitis, _22078) ? creep
   Call: (14) sintomade(diarrea, hepatitis) ? creep
   Exit: (14) sintomade(diarrea, hepatitis) ? creep
   Exit: (13) buscar(diarrea, hepatitis, 1) ? creep
   Call: (13) buscar([nauseas], hepatitis, _25328) ? creep
   Call: (14) sintomade([nauseas], hepatitis) ? creep
   Fail: (14) sintomade([nauseas], hepatitis) ? creep
   Redo: (13) buscar([nauseas], hepatitis, _25328) ? creep
   Call: (14) enfermedad(hepatitis) ? creep
   Exit: (14) enfermedad(hepatitis) ? creep
   Call: (14) buscar(nauseas, hepatitis, _30190) ? creep
   Call: (15) sintomade(nauseas, hepatitis) ? creep
   Exit: (15) sintomade(nauseas, hepatitis) ? creep
   Exit: (14) buscar(nauseas, hepatitis, 1) ? creep
   Call: (14) buscar([], hepatitis, _33440) ? creep
   Exit: (14) buscar([], hepatitis, 0) ? creep
   Call: (14) _25328 is 1+0 ? creep
   Exit: (14) 1 is 1+0 ? creep
   Exit: (13) buscar([nauseas], hepatitis, 1) ? creep
   Call: (13) _16686 is 1+1 ? creep
   Exit: (13) 2 is 1+1 ? creep
   Exit: (12) buscar([diarrea, nauseas], hepatitis, 2) ? creep
P = 2
~~~
**Explicacion de la Prueba de Escritorio:** Cuando se ejecuta la consulta, Prolog empieza intentando aplicar la primera regla, pero como la lista [diarrea, nauseas] no está vacía, pasa a la siguiente. Luego intenta la segunda regla, que verifica si el término completo [diarrea, nauseas] es un solo síntoma asociado a la enfermedad hepatitis mediante el hecho sintomade([diarrea, nauseas], hepatitis), pero esto falla porque el sistema no tiene registrado un síntoma con ese nombre exacto. Entonces, Prolog prueba con la tercera regla, donde reconoce que hepatitis es una enfermedad válida y comienza a evaluar la lista de síntomas uno por uno. Primero toma el síntoma diarrea y comprueba si está relacionado con hepatitis usando sintomade(diarrea, hepatitis), lo cual tiene éxito, por lo que asigna S1 = 1. Luego continúa con el siguiente elemento de la lista, [nauseas]. Intenta primero tratar [nauseas] como un síntoma único, pero falla nuevamente porque no existe un hecho con ese formato. Después aplica otra vez la tercera regla: verifica que hepatitis es una enfermedad y luego evalúa el síntoma nauseas, el cual sí coincide con la enfermedad, asignando S2 = 1. Cuando la lista de síntomas se vacía, el predicado devuelve 0 porque no hay más elementos que analizar. Finalmente, Prolog realiza las operaciones aritméticas: P = S1 + S2, es decir P = 1 + 1, y obtiene el resultado P = 2.

---

cantSint(E, C) :- findall(X, sintomade(X, E), L), length(L, C).

~~~
cantSint(gripe,C).
   Call: (12) cantSint(gripe, _3104) ? creep
^  Call: (13) findall(_4404, sintomade(_4404, gripe), _4412) ? creep
   Call: (17) sintomade(_4404, gripe) ? creep
   Exit: (17) sintomade(tos, gripe) ? creep
   Redo: (17) sintomade(_4404, gripe) ? creep
   Exit: (17) sintomade(cansancio, gripe) ? creep
   Redo: (17) sintomade(_4404, gripe) ? creep
   Exit: (17) sintomade(fiebre, gripe) ? creep
   Redo: (17) sintomade(_4404, gripe) ? creep
   Exit: (17) sintomade(dolorcabeza, gripe) ? creep
^  Exit: (13) findall(_4404, user:sintomade(_4404, gripe), [tos, cansancio, fiebre, dolorcabeza]) ? creep
   Call: (13) length([tos, cansancio, fiebre, dolorcabeza], _3104) ? creep
   Exit: (13) length([tos, cansancio, fiebre, dolorcabeza], 4) ? creep
   Exit: (12) cantSint(gripe, 4) ? creep
C = 4.
~~~
**Explicacion de la Prueba de Escritorio:** Cuando se ejecuta esta consulta, Prolog busca calcular la cantidad total de síntomas asociados a la enfermedad gripe. Para ello, entra en la regla de cantSint/2, donde se utiliza el predicado findall/3. Este predicado se encarga de reunir en una lista todos los elementos que cumplen una cierta condición. En este caso, busca todos los valores X tales que sintomade(X, gripe) sea verdadero. Prolog empieza entonces a revisar los hechos definidos para la enfermedad gripe y va encontrando coincidencias una por una: primero tos, luego cansancio, después fiebre y finalmente dolorcabeza. Al terminar, findall forma una lista con todos estos síntomas: [tos, cansancio, fiebre, dolorcabeza].  
Después de tener la lista completa, Prolog pasa a la siguiente parte de la regla: length/2, que sirve para calcular la longitud de una lista, es decir, cuántos elementos contiene. Al aplicarlo sobre la lista de síntomas, obtiene que su tamaño es 4. Finalmente, el valor de C se unifica con ese número, de modo que el resultado final de la consulta es C = 4.

---

diagnostico(Sintomas, E, K) :- buscar(Sintomas, E, P), cantSint(E, T), K is P * 100 / T.

~~~
diagnostico([cansancio,apatia],anemia,P).
   Call: (12) diagnostico([cansancio, apatia], anemia, _180634) ? creep
   Call: (13) buscar([cansancio, apatia], anemia, _181986) ? creep
   Call: (14) sintomade([cansancio, apatia], anemia) ? creep
   Fail: (14) sintomade([cansancio, apatia], anemia) ? creep
   Redo: (13) buscar([cansancio, apatia], anemia, _181986) ? creep
   Call: (14) enfermedad(anemia) ? creep
   Exit: (14) enfermedad(anemia) ? creep
   Call: (14) buscar(cansancio, anemia, _186848) ? creep
   Call: (15) sintomade(cansancio, anemia) ? creep
   Exit: (15) sintomade(cansancio, anemia) ? creep
   Exit: (14) buscar(cansancio, anemia, 1) ? creep
   Call: (14) buscar([apatia], anemia, _190098) ? creep
   Call: (15) sintomade([apatia], anemia) ? creep
   Fail: (15) sintomade([apatia], anemia) ? creep
   Redo: (14) buscar([apatia], anemia, _190098) ? creep
   Call: (15) enfermedad(anemia) ? creep
   Exit: (15) enfermedad(anemia) ? creep
   Call: (15) buscar(apatia, anemia, _194960) ? creep
   Call: (16) sintomade(apatia, anemia) ? creep
   Exit: (16) sintomade(apatia, anemia) ? creep
   Exit: (15) buscar(apatia, anemia, 1) ? creep
   Call: (15) buscar([], anemia, _198210) ? creep
   Exit: (15) buscar([], anemia, 0) ? creep
   Call: (15) _190098 is 1+0 ? creep
   Exit: (15) 1 is 1+0 ? creep
   Exit: (14) buscar([apatia], anemia, 1) ? creep
   Call: (14) _181986 is 1+1 ? creep
   Exit: (14) 2 is 1+1 ? creep
   Exit: (13) buscar([cansancio, apatia], anemia, 2) ? creep
   Call: (13) cantSint(anemia, _204720) ? creep
^  Call: (14) findall(_205532, sintomade(_205532, anemia), _205540) ? creep
   Call: (18) sintomade(_205532, anemia) ? creep
   Exit: (18) sintomade(cansancio, anemia) ? creep
   Redo: (18) sintomade(_205532, anemia) ? creep
   Exit: (18) sintomade(apatia, anemia) ? creep
   Redo: (18) sintomade(_205532, anemia) ? creep
   Exit: (18) sintomade(nauseas, anemia) ? creep
^  Exit: (14) findall(_205532, user:sintomade(_205532, anemia), [cansancio, apatia, nauseas]) ? creep
   Call: (14) length([cansancio, apatia, nauseas], _204720) ? creep
   Exit: (14) length([cansancio, apatia, nauseas], 3) ? creep
   Exit: (13) cantSint(anemia, 3) ? creep
   Call: (13) _180634 is 2*100/3 ? creep
   Exit: (13) 66.66666666666667 is 2*100/3 ? creep
   Exit: (12) diagnostico([cansancio, apatia], anemia, 66.66666666666667) ? creep
P = 66.66666666666667 ;
Redo: (15) buscar([], anemia, _198210) ? creep
   Call: (16) sintomade([], anemia) ? creep
   Fail: (16) sintomade([], anemia) ? creep
   Fail: (15) buscar([], anemia, _198210) ? creep
   Redo: (16) sintomade(apatia, anemia) ? creep
   Fail: (16) sintomade(apatia, anemia) ? creep
   Fail: (15) buscar(apatia, anemia, _194960) ? creep
   Fail: (14) buscar([apatia], anemia, _190098) ? creep
   Redo: (15) sintomade(cansancio, anemia) ? creep
   Fail: (15) sintomade(cansancio, anemia) ? creep
   Fail: (14) buscar(cansancio, anemia, _186848) ? creep
   Fail: (13) buscar([cansancio, apatia], anemia, _181986) ? creep
   Fail: (12) diagnostico([cansancio, apatia], anemia, _180634) ? creep
false.
~~~
**Explicacion de la Prueba de Escritorio:**  Primero, entra en la regla de diagnostico/3, que indica que debe calcular dos cosas: cuántos síntomas del usuario coinciden con los de la enfermedad (usando buscar/3), y cuántos síntomas totales tiene esa enfermedad (usando cantSint/2).

En la primera parte, Prolog evalúa buscar([cansancio, apatia], anemia, P). Al principio intenta verificar si toda la lista [cansancio, apatia] es directamente un síntoma, lo que falla. Luego revisa que anemia es efectivamente una enfermedad y procede a comparar cada síntoma por separado. Comprueba que cansancio sí es un síntoma de anemia, por lo que cuenta 1 coincidencia. Después analiza apatia, y también encuentra que pertenece a anemia, por lo que suma otra coincidencia. En total, buscar devuelve P = 2, es decir, dos síntomas coinciden con la enfermedad.

Después pasa a la segunda parte: cantSint(anemia, C). Aquí se utiliza findall para reunir todos los síntomas asociados con anemia, los cuales son [cansancio, apatia, nauseas]. Luego, con length, calcula cuántos hay en total: 3 síntomas.  
Por último, el programa aplica la fórmula del diagnóstico:  

K = (P * 100) / T

---
#### Funcion Findall
findall/3 es un predicado de Prolog que permite recopilar todas las soluciones posibles de una consulta en una lista, sin necesidad de recorrerlas una a una mediante backtracking. Su principal utilidad es agrupar resultados que cumplen un cierto predicado para poder procesarlos colectivamente.
~~~
findall(Elemento, Condición, Lista)
~~~
- Elemento: la variable o término que queremos recoger de cada solución.
- Condición: el predicado o meta que debe cumplirse; cada vez que Elemento satisface esta condición, se agrega a la lista.
- Lista: variable que recibe la lista de todos los elementos que cumplieron la condición.

#### Funcion Length
length/2 es un predicado que permite obtener o verificar la cantidad de elementos de una lista en Prolog. Es útil tanto para contar elementos como para construir listas con una longitud determinada.
~~~
length(Lista, Longitud)
~~~
- Lista: la lista que se desea analizar o crear.
- Longitud: variable o número que representará el número de elementos de la lista.