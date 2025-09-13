# Ejercicios Funcion Car y Cdr
**Orozco Mora Jorge Alexander**
*NC: 22120703*

---

1. (a b c (d 1) (c x) m n)
~~~
(car (cdr (cdr (cdr '(a b c (d 1) (c x) m n))))) = (d 1)
(cdr (car (cdr (cdr (cdr (cdr '(a b c (d 1) (c x) m n))))))) = x
(car (car (cdr (cdr (cdr '(a b c (d 1) (c x) m n)))))) = d
~~~

2. (a b c (d) e f ((g h)) i j k)
~~~
(cdddr (cdddr (cdddr '(a b c (d) e f ((g h)) i j k)))) = k
(caaar (cdddr (cdddr '(a b c (d) e f ((g h)) i j k)))) = g
(cadddr '(a b c (d) e f ((g h)) i j k)) = d
(cadr '(a b c (d) e f ((g h)) i j k)) = b
~~~

3. (((a b c d)) 1 (2) 3 (4 5) ((6 (7) 8)))
~~~
(cadr (caar '(((a b c d)) 1 (2) 3 (4 5) ((6 (7) 8))))) = b
(cdddr (caar '(((a b c d)) 1 (2) 3 (4 5) ((6 (7) 8))))) = d
(caddr '(((a b c d)) 1 (2) 3 (4 5) ((6 (7) 8)))) = 2
(cadr (caaddr (cdddr '(((a b c d)) 1 (2) 3 (4 5) ((6 (7) 8)))))) = 7
(cdr (cadr (cdddr '(((a b c d)) 1 (2) 3 (4 5) ((6 (7) 8)))))) = 5
(caadr (cdddr '(((a b c d)) 1 (2) 3 (4 5) ((6 (7) 8))))) = 4
~~~
