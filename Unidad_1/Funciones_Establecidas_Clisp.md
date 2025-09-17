# Funciones Establecidas por Clisp
**Orozco Mora Jorge Alexander**
*NC: 22120703*

---
**car**: Devuelve el primer elemento de una lista.
~~~
(car '(1 2 3)) = 1
~~~

**cdr**: Devuelve todos los elementos de la lista excepto el primero.
~~~
(car '(1 2 3)) = (2 3)
~~~

**cons**: Crea una lista uniendo un elemento con otra lista.
~~~
(cons 0 '(1 2 3)) = (0 1 2 3)
~~~

**list**: Crea una lista con los elementos dados.
~~~
(list 1 2 3) = (1 2 3)
~~~

**append**: Concatena listas.
~~~
(append '(1 2) '(3 4)) = (1 2 3 4)
~~~

**reverse**: Devuelve una lista con los elementos en orden inverso.
~~~
(reverse '(1 2 3)) = (3 2 1)
~~~

**length**: Devuelve el número de elementos de una lista.
~~~
(length '(a b c)) = 3
~~~

**setq**: Asigna un valor a una variable.
~~~
(setq x 15)
x = 15
~~~

**+**: Suma números.
~~~
(+ 3 4 5) = 12
~~~

**-**: Resta números.
~~~
(- 10 4) = 6
~~~

**x**: Multiplica números.
~~~
(* 2 3 4) = 24
~~~

**/**: Divide números.
~~~
(/ 20 4) = 5
~~~

**max**: Devuelve el número mayor.
~~~
(max 3 7 2) = 7
~~~

**min**: Devuelve el número menor.
~~~
(min 3 7 2) = 2
~~~

**=**: Comprueba igualdad numérica.
~~~
(= 3 3) = T
~~~

**<**: Comprueba si un número es menor que otro.
~~~
(< 2 5) = T
~~~

**>**: Comprueba si un número es mayor que otro.
~~~
(> 10 5) = T
~~~

**<=**: Comprueba si un número es menor o igual que otro.
~~~
(<= 4 4) = T
~~~

**>=**: Comprueba si un número es mayor o igual que otro.
~~~
(>= 6 6) = T
~~~

**equal**: Comprueba igualdad de listas, cadenas o símbolos.
~~~
(equal '(1 2) '(1 2)) = T
~~~

**eq**: Comprueba si dos símbolos o valores son idénticos.
~~~
(eq 'a 'a) = T
~~~

**string**: Convierte un valor en cadena.
~~~
(string 123) = "123"
~~~

**concatenate**: Concatena cadenas de texto.
~~~
(concatenate 'string "Hola" " " "Mundo") = "Hola Mundo"
~~~

**string-upcase**: Convierte una cadena a mayúsculas.
~~~
(string-upcase "hola") = "HOLA"
~~~

**string-downcase**: Convierte una cadena a minúsculas.
~~~
(string-downcase "HOLA") = "hola"
~~~

**string=**: Comprueba igualdad de cadenas.
~~~
(string= "hola" "hola") = T
~~~

**if**: Ejecuta una expresión si se cumple una condición.
~~~
(if (> 5 3)
    'mayor
    'menor) = MAYOR
~~~

**cond**: Evalúa múltiples condiciones secuenciales.
~~~
(cond ((> 3 5) 'a)
      ((< 3 5) 'b)
      (t 'c)) = B
~~~

**when**: Ejecuta una expresión si la condición es verdadera.
~~~
(when (> 5 3) (print "Es mayor")) = "Es mayor"
~~~

**unless**: Ejecuta una expresión si la condición es falsa.
~~~
(unless (> 2 3) (print "No es mayor")) = "No es mayor"
~~~

**dotimes**: Ejecuta un bucle un número fijo de veces.
~~~
(dotimes (i 3) (print i)) = 0 1 2
~~~

**progn**: Evalúa varias expresiones secuenciales y devuelve la última.
~~~
(progn
  (print "Hola")
  (print "Mundo")) = "Hola" "Mundo"
~~~

**print**: Imprime un valor en la consola.
~~~
(print "Hola") = "Hola"
~~~

**format**: Permite imprimir cadenas formateadas.
~~~
(format t "Hola ~A!" "Mundo") = Hola Mundo!
~~~

**abs**: Devuelve el valor absoluto.
~~~
(abs -5) = 5
~~~

**round**: Redondea un número al entero más cercano.
~~~
(round 3.6) = 4
~~~

**loop**: Crea bucles complejos.
~~~
(loop for i from 1 to 3 do (print i)) = 1 2 3
~~~

**defvar**: Declara una variable global.
~~~
(defvar x 10)
x = 10
~~~

**read**: Lee un valor desde la entrada.

**read-line**: Lee una línea completa de la entrada.