# Ejercicios
**Orozco Mora Jorge Alexander**
*NC: 22120703*
---

1. Que calcule el sueldo que le corresponde al trabajador de una
empresa que cobra 40.000 euros anuales, el programa debe realizar los
cálculos en función de los siguientes criterios:

- Si lleva más de 10 años en la empresa se le aplica un aumento del 10%.
- Si lleva menos de 10 años pero más que 5 se le aplica un aumento del
  7%.
- Si lleva menos de 5 años pero más que 3 se le aplica un aumento del
  5%.
- Si lleva menos de 3 años se le aplica un aumento del 3%.()

~~~
(defun ejercicio1 (años)
    (let ((sueldo 40000))
    (cond ((> años 10) (* sueldo 1.10))
          ((and (>= años 5) (< años 10)) (* sueldo 1.07))
          ((and (>= años 3) (< años 5)) (* sueldo 1.05))
          ((< años 3) (* sueldo 1.03))
          (t '(Otro))
    )
    )
)
~~~
**Explicacion del Codigo:** Primero se crea una variable donde se ingresa los años que lleva trabajando la persona, despues con *let* se crea una variable con la que se establece el sueldo en $40000, despues dentro de un *cond* se evalua los años que lleva trabajando la persona y se calcula el sueldo por el porcentaje que se aumenta.

---

2. Hacer un algortimo que tome el peso en libras de una cantidad de
ropa a lavar en una lavadora y nos devuelva el nivel dependiendo del
peso; además nos informe la cantidad de litros de agua que
necesitamos. Se sabe que con más de 30 libras la lavadora no funcionara
ya que es demasiado peso. Si la ropa pesa 22 ó  más libras, el nivel será
de máximo; si pesa 15 ó más nivel será de alto; si pesa 8 ó más será un
nivel medio o de lo contrario el nivel será minimo

~~~
(defun ejercicio2 (peso)
    (cond ((>= peso 30) '(La lavadora no funcionara))
          ((and (>= peso 22) (< peso 30)) '(Nivel Maximo))
          ((and (>= peso 15) (< peso 22)) '(Nivel Alto))
          ((and (>= peso 8) (< peso 15)) '(Nivel Medio))
          ((< peso 8) '(Nivel Minimo))
          (t '(Otro))
    )
)
~~~
**Explicacion del Codigo:** Primero se crea una variable donde se ingresa el peso de la ropa, despues dentro de un *cond* se evalua el peso de la ropa e imprime el nivel de la lavadora, el *and* sirve para poner dos condiciones dentro de un *cond* y asi se puede determinar mas facil los intervalos de los niveles de la lavadora.

---

3. Martha va a realizar su fiesta de quince años. Por lo cual ha
invitado a una gran cantidad de personas. Pero también ha decidido
algunas reglas: Que todas las personas con edades mayores a los quince
años, sólo pueden entrar si traen regalos; que jóvenes con los quince
años cumplidos entra totalmente gratis pero los de menos de quince años
no pueden entrar a la fiesta. Hacer un algoritmo donde se tome la edad
de una persona y que requisito de los anteriores le toca cumplir si
quiere entrar.

~~~
(defun ejercicio3 (edad)
    (cond ((> edad 15) '(Solo pueden entrar si traen regalos))
          ((= edad 15) '(Entran totalmente gratis))
          ((< edad 15) '(No pueden entrar a la fiesta))
          (t '(Fiesta))
    )
)
~~~
**Explicacion del Codigo:** Primero se crea una variable donde se ingresa la edad de la persona, despues dentro de un *cond* se evalua si la edad es mayor, menor o igual a 15 y te imprime el mensaje correspondiente por cada condicion, y la ultima linea es por defecto.