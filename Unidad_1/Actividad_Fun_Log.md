# Actividades Fun_Log
**Orozco Mora Jorge Alexander**
*NC: 22120703*

---

#### Problemas con Car y Cdr
1. Lista: (a b c d e) → Extraer d
   ~~~  
   (cadddr '(a b c d e))
   ~~~

2. Lista: ((1 2) (3 4) (5 6)) → Extraer 5
   ~~~  
   (caaddr (car '(((1 2) (3 4) (5 6)))))
   ~~~

3. Lista: ((a b) (c d) (e f)) → Extraer e
   ~~~  
   (caaddr (car '(((a b) (c d) (e f)))))
   ~~~

4. Lista: ((x y) ((p q) (r s)) (z w)) → Extraer z
   ~~~  
   (caaddr (car '(((x y) ((p q) (r s)) (z w)))))
   ~~~

5. Lista: ((1 (2 3)) (4 (5 6))) → Extraer 6
   ~~~  
   (cdr (cadr (cadr (car '(((1 (2 3)) (4 (5 6))))))))
   ~~~

6. Lista: (((a b) c) d e) → Extraer c
   ~~~  
   (cdr (caar '((((a b) c) d e))))
   ~~~

7. Lista: (((1 2) 3) ((4 5) 6)) → Extraer 6
   ~~~  
   (cdr (cadr (car '((((1 2) 3) ((4 5) 6))))))
   ~~~

8. Lista: ((p (q (r s))) t u) → Extraer (r s)
   ~~~  
   (cadr (cadr (caar '(((p (q (r s))) t u )))))
   ~~~

9. Lista: (((a) b) (c (d e)) f) → Extraer d
   ~~~  
   (caadr (cadr (car '((((a) b) (c (d e)) f)))))
   ~~~

10. Lista: ((1 (2 (3 4))) (5 6)) → Extraer 3
   ~~~  
   (caadr (cadr (caar '(((1 (2 (3 4))) (5 6))))))
   ~~~

11. Lista: (((x) (y)) ((z) (w))) → Extraer (w)
   ~~~  
   (cadr (cadr (car '((((x) (y)) ((z) (w)))))))
   ~~~

12. Lista: ((a (b (c d))) (e f)) → Extraer c
   ~~~  
   (caadr (cadr (caar '(((a (b (c d))) (e f))))))
   ~~~

13. Lista: ((1 (2 (3 (4 5)))) (6 7)) → Extraer 4
   ~~~  
   (cdr (cadr (cadr (cadr (caar '(((1 (2 (3 (4 5)))) (6 7))))))))
   ~~~

14. Lista: (((a b) c) ((d e) f) ((g h) i)) → Extraer g
   ~~~  
   (caaar (cddr (car '((((a b) c) ((d e) f) ((g h) i))))))
   ~~~

15. Lista: (((x y) (z w)) ((p q) (r s))) → Extraer r
   ~~~  
   (caadr (cadr (car '((((x y) (z w)) ((p q) (r s)))))))
   ~~~

16. Lista: ((1 (2 (3 (4 (5 6))))) (7 8)) → Extraer 5
   ~~~  
   (caadr (cadr (cadr (cadr (caar '(((1 (2 (3 (4 (5 6))))) (7 8))))))))
   ~~~

17. Lista: ((a (b (c (d e)))) (f g)) → Extraer d
   ~~~  
   (caadr (cadr (cadr (caar '(((a (b (c (d e)))) (f g)))))))
   ~~~

18. Lista: (((1 2) (3 4)) ((5 6) (7 8))) → Extraer 7
   ~~~  
   (caadr (cadr (car '((((1 2) (3 4)) ((5 6) (7 8)))))))
   ~~~

19. Lista: ((x (y (z (w v))))) → Extraer w
   ~~~  
   (caadr (cadr (cadr (caar '(((x (y (z (w v))))))))))
   ~~~

20. Lista: (((a b c) (d e f)) ((g h i) (j k l))) → Extraer j
   ~~~  
   ((caadr (cadr (car '((((a b c) (d e f)) ((g h i) (j k l)))))))
   ~~~
   
   
#### Ejercicios de Lisp (Uso Restringido de Funciones)
Ejercicio 1  
Dada una lista de pares clave-valor, usar ‘assoc‘ para obtener el valor de la clave ‘’edad‘.   
Lista de ejemplo:
(setq persona '((nombre . "Ana") (edad . 23) (ciudad . "Morelia")))  
Pregunta: ¿cómo obtener la edad con ‘assoc‘, ‘cdr‘ y ‘car‘?
~~~
(setq persona '((nombre . "Ana") (edad . 23) (ciudad . "Morelia")))
(defun ejercicio1 (persona)
  (cdr (assoc 'edad persona))
)
~~~

Ejercicio 2
Usar ‘if‘ para escribir una función que diga si el primer elemento de una lista es un número positivo o no. Ejemplo:  
(mi-funcion '(5 3 2)) ; => "positivo"  
(mi-funcion '(-2 1 4)) ; => "no positivo"
~~~
(defun ejercicio2 (lista)
    (if(> (car lista) 0)
        (format t "Positivo")
        (format t "No Positivo")
    )
)
~~~

Ejercicio 3
Definir una función que recorra una lista de números con ‘mapcar‘ y devuelva una nueva lista que contenga solo el doble de los números pares. Restricción: usar ‘if‘ dentro de ‘mapcar‘.
~~~
(defun ejercicio3 (lista)
  (mapcar (lambda (x) (if x (* 2 x) x)) lista)
)
~~~

Ejercicio 4  
Usar ‘cond‘ para hacer una función que reciba un símbolo que puede ser
‘rojo‘, ‘azul‘ o ‘verde‘ y regrese un mensaje:  
• rojo → "Color cálido"  
• azul → "Color frío"  
• verde → "Color neutro"  
• cualquier otro → "Color desconocido"
~~~
(defun ejercicio4 (color)
(cond ((eq color 'rojo) '(Color Calido))
          ((eq color 'azul) '(Color Frio))
          ((eq color 'verde) '(Color Neutro))
          (t '(Color Desconocido))
    )
)|
~~~

Ejercicio 5
Escribir una función que use ‘case‘ para clasificar un día de la semana (‘lunes‘,‘martes‘, . . . ):  
• lunes a viernes → "día laboral"  
• sábado, domingo → "fin de semana"
~~~
(defun ejercicio5 (dia)
    (case dia 
          ((lunes martes miercoles jueves viernes) '(Dia Laboral))
          ((sabado domingo) '(Fin de Semana))
          (otherwise '(Dia No Existente))
    )
)
~~~

Ejercicio 6  
Definir una función que reciba una lista y con ‘when‘ imprima el primer
elemento si la lista no está vacía.
~~~
(defun ejercicio6 (lista)
    (when lista 
        (format t "~a~%" (car lista))
    )
)
~~~

Ejercicio 7  
Definir una función que reciba una lista y con ‘unless‘ imprima "lista vacía" cuando la lista no tenga elementos.
~~~
(defun ejercicio7 (lista)
    (unless lista 
        (format t "Lista Vacia")
    )
)
~~~

Ejercicio 8  
Dada una lista de listas, usar ‘mapcar‘, ‘car‘ y ‘cdr‘ para obtener una nueva lista con los primeros elementos de cada sublista. Ejemplo:  
(mi-funcion '((1 2) (3 4) (5 6))) ; => (1 3 5)
~~~
(defun ejercicio8 (lista)
    (mapcar #'car lista)
)
~~~

Ejercicio 9  
Dada una lista de asociación:  
(setq alumnos '((juan . 8) (maria . 10) (ana . 9)))  
Escribir una función que, dado un nombre, devuelva "Aprobado" si la calificación es >= 8, o "Reprobado" en caso contrario. Usar ‘assoc‘, ‘cdr‘ y ‘if‘.
~~~
(setq alumnos '((juan . 8) (maria . 10) (ana . 9) (itzel . 10) (gabriel . 5) (brenda . 7)))
(defun ejercicio9 (nombre)
  (let ((nota (cdr (assoc nombre alumnos))))
    (if (>= nota 8)
        "Aprobado"
        "Reprobado"
    )
  )
)
~~~

Ejercicio 10  
Definir una función que use ‘cond‘ para evaluar una lista de números y devolver:  
• "vacía" si no hay elementos,  
• "un solo elemento" si la lista tiene uno,  
• "larga" si tiene más de uno.
~~~
(defun ejercicio10 (lista)
    (cond ((null lista) '(Vacia))
          ((null (cdr lista)) '(Un solo elemento))
          (t '(Larga))
    )
)
~~~
