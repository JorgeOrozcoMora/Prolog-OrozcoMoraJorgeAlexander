# Areas y Volumenes de Figuras
**Orozco Mora Jorge Alexander**
*NC: 22120703*

---

### Areas

_**Area de Triangulo**_
~~~
(defun areaTriangulo()
  (princ "Dame la base y la altura: ")
  (setq b (read)
        h (read))
  (let ((area (/ (* b h) 2)))
    (format t "El area del triangulo es ~a ~%" area))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese la base y la altura del triángulo. Luego, utiliza read para leer ambos valores y los guarda en las variables b y h. Con estos valores, calcula el área usando la fórmula “base por altura dividido entre 2” y lo guarda en la variable area. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el área del triángulo.

_**Area de Circulo**_
~~~
(defun areaCirculo()
  (princ "Dame el radio del circulo: ")
  (setq r (read))
  (let ((area (* pi r r)))
    (format t "El area del circulo es ~a ~%" area))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese el radio del círculo. Luego, utiliza read para leer el valor ingresado y lo guarda en la variable r. Con este valor, calcula el área usando la fórmula “pi por radio al cuadrado” y lo almacena en la variable area. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el área del círculo.

_**Area de Trapecio**_
~~~
(defun areaTrapecio()
  (princ "Dame la base mayor, base menor y la altura: ")
  (setq B (read)
        b (read)
        h (read))
  (let ((area (/ (* (+ B b) h) 2.0)))
    (format t "El area del trapecio es ~a ~%" area))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese la base mayor, la base menor y la altura del trapecio. Luego, utiliza read para capturar estos tres valores y los guarda en las variables B, b y h. Con estos valores, calcula el área usando la fórmula “(base mayor + base menor) por altura dividido entre 2” y lo almacena en la variable area. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el área del trapecio.

_**Area de Rombo**_
~~~
(defun areaRombo()
  (princ "Dame las diagonales del rombo: ")
  (setq D (read)
        d (read))
  (let ((area (/ (* D d) 2)))
    (format t "El area del rombo es ~a ~%" area))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese las dos diagonales del rombo. Luego, utiliza read para capturar estos valores y los guarda en las variables D y d. Con estos valores, calcula el área usando la fórmula “diagonal mayor por diagonal menor dividido entre 2” y lo almacena en la variable area. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el área del rombo.

_**Area de Romboide**_
~~~
(defun areaRomboide()
  (princ "Dame la base y la altura del romboide: ")
  (setq b (read)
        h (read))
  (let ((area (* b h)))
    (format t "El area del romboide es ~a ~%" area))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese la base y la altura del romboide. Luego, utiliza read para capturar estos valores y los guarda en las variables b y h. Con estos valores, calcula el área usando la fórmula “base por altura” y lo almacena en la variable area. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el área del romboide.

_**Area de Elipse**_
~~~
(defun areaElipse()
  (princ "Dame los semiejes a y b de la elipse: ")
  (setq a (read)
        b (read))
  (let ((area (* pi a b)))
    (format t "El area de la elipse es ~a ~%" area))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese los semiejes a y b de la elipse. Luego, utiliza read para capturar estos valores y los guarda en las variables a y b. Con estos valores, calcula el área usando la fórmula “pi por a por b” y lo almacena en la variable area. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el área de la elipse.

_**Area de Pentagono**_
~~~
(defun areaPentagono()
  (princ "Dame el lado y la apotema del pentagono: ")
  (setq l (read)
        a (read))
  (let ((area (/ (* (* 5 l) a) 2)))
    (format t "El area del pentagono es ~a ~%" area))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese el lado y la apotema del pentágono. Luego, utiliza read para capturar estos valores y los guarda en las variables l y a. Con estos valores, calcula el área usando la fórmula “(perímetro por apotema) dividido entre 2”, donde el perímetro se obtiene multiplicando el lado por 5, y almacena el resultado en la variable area. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el área del pentágono.

_**Area de Hexagono**_
~~~
(defun areaHexagono()
  (princ "Dame el lado del hexagono: ")
  (setq l (read))
  (let ((area (* (/ 3 2) (sqrt 3) (* l l))))
    (format t "El area del hexagono es ~a ~%" area))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese el lado del hexágono. Luego, utiliza read para capturar este valor y lo guarda en la variable l. Con este valor, calcula el área usando la fórmula “(3/2) por raíz cuadrada de 3 por lado al cuadrado” y almacena el resultado en la variable area. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el área del hexágono.

_**Area de Heptagono**_
~~~
(defun areaHeptagono()
  (princ "Dame el lado del heptagono regular: ")
  (setq l (read))
  (let ((area (* (/ 7 4.0) (* l l) (/ 1 (tan (/ pi 7))))))
    (format t "El area del heptagono es ~a ~%" area))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese el lado del heptágono. Luego, utiliza read para capturar este valor y lo guarda en la variable l. Con este valor, calcula el área usando la fórmula “(7/4) por lado al cuadrado por 1 dividido entre la tangente de (pi/7)” y almacena el resultado en la variable area. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el área del heptágono.

_**Area de Octagono**_
~~~
(defun areaOctagono()
  (princ "Dame el lado del octagono regular: ")
  (setq l (read))
  (let ((area (* 2 (+ 1 (sqrt 2)) (* l l))))
    (format t "El area del octagono es ~a ~%" area))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese el lado del octágono. Luego, utiliza read para capturar este valor y lo guarda en la variable l. Con este valor, calcula el área usando la fórmula “2 por (1 + raíz cuadrada de 2) por lado al cuadrado” y almacena el resultado en la variable area. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el área del octágono.

### Volumenes

_**Volumen de Cubo**_
~~~
(defun volumenCubo()
  (princ "Dame el lado del cubo: ")
  (setq l (read))
  (let ((volumen (* l l l)))
    (format t "El volumen del cubo es ~a ~%" volumen))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese el lado del cubo. Luego, utiliza read para capturar este valor y lo guarda en la variable l. Con este valor, calcula el volumen usando la fórmula “lado por lado por lado” y lo almacena en la variable volumen. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el volumen del cubo.

_**Volumen de Esfera**_
~~~
(defun volumenEsfera()
  (princ "Dame el radio de la esfera: ")
  (setq r (read))
  (let ((volumen (* (/ 4 3.0) pi (* r r r))))
    (format t "El volumen de la esfera es ~a ~%" volumen))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese el radio de la esfera. Luego, utiliza read para capturar este valor y lo guarda en la variable r. Con este valor, calcula el volumen usando la fórmula “(4/3) por pi por radio al cubo” y lo almacena en la variable volumen. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el volumen de la esfera.

_**Volumen de Cilindro**_
~~~
(defun volumenCilindro()
  (princ "Dame el radio y la altura del cilindro: ")
  (setq r (read)
        h (read))
  (let ((volumen (* pi (* r r) h)))
    (format t "El volumen del cilindro es ~a ~%" volumen))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese el radio y la altura del cilindro. Luego, utiliza read para capturar estos valores y los guarda en las variables r y h. Con estos valores, calcula el volumen usando la fórmula “pi por radio al cuadrado por altura” y lo almacena en la variable volumen. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el volumen del cilindro.

_**Volumen de Cono**_
~~~
(defun volumenCono()
  (princ "Dame el radio y la altura del cono: ")
  (setq r (read)
        h (read))
  (let ((volumen (/ (* pi (* r r) h) 3)))
    (format t "El volumen del cono es ~a ~%" volumen))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese el radio y la altura del cono. Luego, utiliza read para capturar estos valores y los guarda en las variables r y h. Con estos valores, calcula el volumen usando la fórmula “pi por radio al cuadrado por altura dividido entre 3” y lo almacena en la variable volumen. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el volumen del cono.

_**Volumen de Piramide Cuadrada**_
~~~
(defun volumenPiramideCuadrada()
  (princ "Dame la base y la altura de la piramide cuadrada: ")
  (setq b (read)
        h (read))
  (let ((volumen (/ (* b b h) 3)))
    (format t "El volumen de la piramide cuadrada es ~a ~%" volumen))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese la medida de la base y la altura de la pirámide. Luego, utiliza read para capturar estos valores y los guarda en las variables b y h. Con estos valores, calcula el volumen usando la fórmula “base al cuadrado por altura dividido entre 3” y lo almacena en la variable volumen. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el volumen de la pirámide cuadrada.

_**Volumen de Piramide Triangular**_
~~~
(defun volumenPiramideTriangular()
  (princ "Dame la base y la altura del triangulo de la base y la altura de la piramide: ")
  (setq b (read)
        hBase (read)
        hPiramide (read))
  (let ((areaBase (/ (* b hBase) 2))
        (volumen 0))
    (setq volumen (/ (* areaBase hPiramide) 3))
    (format t "El volumen de la piramide triangular es ~a ~%" volumen))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese la base y la altura del triángulo de la base, así como la altura de la pirámide. Luego, utiliza read para capturar estos valores y los guarda en las variables b, hBase y hPiramide. A continuación, calcula el área de la base usando la fórmula “base por altura del triángulo dividido entre 2” y guarda este valor en areaBase. Después calcula el volumen de la pirámide multiplicando el área de la base por la altura de la pirámide y dividiendo entre 3, almacenando el resultado en volumen. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el volumen de la pirámide triangular.

_**Volumen de Prisma Rectangular**_
~~~
(defun volumenPrismaRectangular()
  (princ "Dame el largo, ancho y altura del prisma rectangular: ")
  (setq l (read)
        w (read)
        h (read))
  (let ((volumen (* l w h)))
    (format t "El volumen del prisma rectangular es ~a ~%" volumen))
)
~~~
**Explicacion del Codigo:**

_**Volumen de Prisma Triangular**_
~~~
(defun volumenPrismaTriangular()
  (princ "Dame la base y altura del triangulo de la base y la altura del prisma: ")
  (setq b (read)
        hBase (read)
        hPrisma (read))
  (let ((areaBase (/ (* b hBase) 2))
        (volumen 0))
    (setq volumen (* areaBase hPrisma))
    (format t "El volumen del prisma triangular es ~a ~%" volumen))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese la base y la altura del triángulo de la base, así como la altura del prisma. Luego, utiliza read para capturar estos valores y los guarda en las variables b, hBase y hPrisma. A continuación, calcula el área de la base usando la fórmula “base por altura del triángulo dividido entre 2” y almacena este valor en areaBase. Después, calcula el volumen del prisma multiplicando el área de la base por la altura del prisma y lo guarda en la variable volumen. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el volumen del prisma triangular.

_**Volumen de Tetraedro**_
~~~
(defun volumenTetraedro()
  (princ "Dame el lado del tetraedro regular: ")
  (setq a (read))
  (let ((volumen (/ (* a a a) (* 6 (sqrt 2)))))
    (format t "El volumen del tetraedro es ~a ~%" volumen))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese el valor del lado del tetraedro. Luego, utiliza read para capturar este valor y lo guarda en la variable a. Con este valor, calcula el volumen usando la fórmula “lado al cubo dividido entre 6 por la raíz cuadrada de 2” y lo almacena en la variable volumen. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el volumen del tetraedro.

_**Volumen de Tronco de Cono**_
~~~
(defun volumenTroncoCono()
  (princ "Dame el radio mayor, radio menor y la altura del tronco de cono: ")
  (setq R (read)
        r (read)
        h (read))
  (let ((volumen (/ (* h (+ (* R R) (* R r) (* r r)) pi) 3)))
    (format t "El volumen del tronco de cono es ~a ~%" volumen))
)
~~~
**Explicacion del Codigo:** Primero, la función imprime un mensaje pidiendo al usuario que ingrese el radio mayor, el radio menor y la altura del tronco de cono. Luego, utiliza read para capturar estos valores y los guarda en las variables R, r y h. Con estos valores, calcula el volumen usando la fórmula “(altura por (radio mayor al cuadrado + radio mayor por radio menor + radio menor al cuadrado) por pi) dividido entre 3” y lo almacena en la variable volumen. Finalmente, muestra en pantalla el resultado utilizando format, indicando cuál es el volumen del tronco de cono