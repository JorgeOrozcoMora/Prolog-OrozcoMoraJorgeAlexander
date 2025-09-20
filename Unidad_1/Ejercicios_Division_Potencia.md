# Ejercicios Division con Restas y Potencia con Sumas/Multiplicacion
**Orozco Mora Jorge Alexander**
*NC: 22120703*

---

#### Division con Restas
~~~
(defun division-por-restas (dividendo divisor)
  (cond
    ((zerop divisor) (error "Error: división por cero."))
    ((< dividendo 0) (error "Ingresa un numero mayor a cero.")) 
    ((< divisor 0) (error "Ingresa un numero mayor a cero."))
    (t
     (let ((cociente 0)
           (residuo dividendo))
       (loop while (>= residuo divisor) do
            (setf residuo (- residuo divisor))
            (incf cociente))
            (format t "El cociente es ~a y el residuo es ~a~%" cociente residuo)
       (list cociente residuo)))))
~~~
**Explicacion del Codigo:** Primero se crea una variable para el dividendo y el divisor, despues dentro de un *cond* se evalua si los numeros ingresados no son igual a 0 ya que si es asi no se puede realizar la division, *zerop* es una funcion que verifica si el numero es 0. Despues se inicializa el cociente en 0 y se iguala el dividendo con el residuo, dentro de un ciclo se le va restanto el divisor al residuo para saber cuantas veces cabe y se incrementa en 1 el cociente con la funcion incf y esto se hace hasta que el divisor es mayor que el dividendo.  

---

#### Potencia con Sumas/Multiplicacion
~~~
(defun multiplicacion-por-sumas (a b)
  (cond
    ((or (zerop a) (zerop b)) 0)
    ((< b 0) (error "Solo funciona con numeros positivos"))
    (t
     (let ((resultado 0))
       (dotimes (i b resultado)
         (setf resultado (+ resultado a)))))))

(defun potencia-por-multiplicacion (base exponente)
  (cond
    ((< exponente 0) (error "Solo funciona con exponentes positivos"))
    ((= exponente 0) 1) ; 
    (t
     (let ((resultado 1))
       (dotimes (i exponente resultado)
         (setf resultado (multiplicacion-por-sumas resultado base)))))))
~~~
**Explicacion del Codigo:** Primero se crea una variable para el dividendo y el divisor, despues dentro de un *cond* se evalua si los numeros ingresados no son igual a 0  y si es el caso te regresa como resultado 0 ya que cualquier numero multiplicado por 0 es 0. Se inicializa el resultado en 0, dentro de dotimes se itera sobre el segundo numero "b" y y se suma "a" mas el resultado. La siguiente funcion se declaran dos variables, la "base" y el "exponente", dentro de un *cond* se evalua si el exponente ingresado es menor a 1 o igual a 0. Se inicializa el resultado en 1, luego dentro de un ciclo se itera hasta que haya llegado al valor ingresado del exponente.   

*Numeros Ingresados (2, 3)* (Multiplicacion por sumas)  
Iteracion 0: 0+2=2  
Iteracion 1: 2+2=4  
Iteracion 2: 4+2=6  

*Numeros Ingresados (2, 3)* (Potencia por multiplicacion)  
*resultado = multiplicacion-por-sumas(resultado, base)*  
Iteracion 0: (1, 2) 1+1=2  
Iteracion 1: (2, 2) 2+2=4  
Iteracion 2: (4, 2) 4+4=8  