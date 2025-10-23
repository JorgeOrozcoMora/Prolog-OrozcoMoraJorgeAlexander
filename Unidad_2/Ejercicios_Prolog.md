# Ejercicios Prolog (Fibonacci, Division con Restas y Potencia con Sumas)
**Orozco Mora Jorge Alexander**
*NC: 22120703*

---
1. Fibonacci  
	~~~
	% fibonacci(N, F) - Devuelve el N-ésimo número de Fibonacci
	fibonacci(0, 0).
	fibonacci(1, 1).
	fibonacci(N, F) :- N > 1, N1 is N - 1, N2 is N - 2, fibonacci(N1, F1), fibonacci(N2, F2), F is F1 + F2.
	~~~
	**Explicacion del Codigo:** Primero se comienza definiendo dos casos base: cuando el número es 0, el resultado también es 0, y cuando es 1, el resultado es 1. Estos dos casos son necesarios para evitar que el programa se llame infinitamente a sí mismo y sirven como punto de detención de la recursión. Luego viene la regla general, que se aplica cuando el número N es mayor que 1. En ese caso, el programa se asegura de que el valor sea válido con la condición N > 1, y después calcula los dos números anteriores, N1 y N2, restando 1 y 2 al valor original. A continuación, el programa se llama a sí mismo dos veces, una para obtener el valor de fibonacci(N1, F1) y otra para fibonacci(N2, F2). Finalmente, suma ambos resultados (F1 y F2) y guarda el total en F.
	
2. Division con Restas  
	~~~
	% division(Dividendo, Divisor, Cociente)
	% Divide usando restas sucesivas (sin decimales)
	division(_, 0, _) :- write('Error: división por cero'), !, fail.
	division(D, V, 0) :- D < V, !.
	division(D, V, C) :- D >= V, D1 is D - V, division(D1, V, C1), C is C1 + 1.
	~~~
	**Explicacion del Codigo:** Primero, define un caso especial para evitar errores: si el divisor es 0, el programa muestra un mensaje de error y falla, ya que no se puede dividir entre cero. Luego viene el caso base: si el dividendo es menor que el divisor, significa que ya no se puede seguir restando, por lo que el cociente es 0. En esta parte se utiliza el operador ! para evitar que Prolog siga buscando otras soluciones una vez que se cumple esta condición. Después, se define la regla general para los casos en los que el dividendo aún es mayor o igual que el divisor. En este punto, el programa realiza una resta entre ambos (D1 is D - V) y vuelve a llamarse a sí mismo con el nuevo valor del dividendo. Cada vez que se logra hacer una resta, se suma 1 al resultado del cociente (C is C1 + 1).
	
3. Potencia con Sumas  
	~~~
	% multiplicacion(A, B, R) - multiplica A * B usando sumas
	multiplicacion(_, 0, 0).
	multiplicacion(A, B, R) :- B > 0, B1 is B - 1, multiplicacion(A, B1, R1), R is R1 + A.
	
	% potencia(Base, Exponente, Resultado) - calcula Base^Exponente usando multiplicacion/3
	potencia(_, 0, 1).
	potencia(B, E, R) :- E > 0, E1 is E - 1, potencia(B, E1, R1), multiplicacion(B, R1, R).
	~~~
	**Explicacion del Codigo:** En el caso de la multiplicación, el programa parte de un caso base que establece que cualquier número multiplicado por 0 da 0. Luego, se asegura de que el segundo número (el multiplicador) sea positivo y le resta 1 en cada paso. Después, llama recursivamente a la misma funcion con el valor reducido del multiplicador. Cuando la llamada recursiva regresa, se suma el valor original del primer número (A) al resultado anterior. De esta forma, el programa va acumulando sumas de A tantas veces como indique B, simulando el proceso de multiplicar mediante sumas repetidas. En cuanto a la potencia, el programa comienza con su caso base: cualquier número elevado a la potencia 0 da como resultado 1. Luego, verifica que el exponente sea positivo y le resta 1 para avanzar paso a paso en el cálculo. A continuación, se llama recursivamente a la misma funcion para obtener el resultado de la potencia anterior (por ejemplo, para calcular B³ primero obtiene B²). Finalmente, multiplica la base por el resultado anterior utilizando la función de multiplicación que ya se definió.
