# Evaluacion Prolog
**Orozco Mora Jorge Alexander**
*NC: 22120703*

---

• Actividad: Formalizar los siguiente enunciados y generar los posibles
  hechos y reglas en Prolog

1. La Biblioteca Nacional tiene el libro "Don Quijote de la Mancha".
	~~~
	tiene_libro(biblioteca_nacional, 'Don Quijote de la Mancha').
	~~~
	
2. Todos los libros en la Biblioteca Nacional están catalogados.
	~~~
	catalogado(libro) :- tiene(biblioteca_nacional, libro).
	~~~
	
3. Existen libros que están en más de una biblioteca.
	~~~
	existe_libro(Libro) :- tiene(biblioteca, Libro), tiene(biblioteca_1, Libro).
	~~~
	
4. Si un libro es raro, entonces no se puede prestar.
	~~~
	puede_prestarse(Libro) :- \+ raro(Libro).
	~~~
	
5. La Biblioteca Central tiene más de 10,000 libros.
	~~~
	cantidad_libros(biblioteca_central, X) :- X > 10000.
	~~~
	
6. Todos los autores tienen al menos un libro en una biblioteca.
	~~~
	tiene_libro_en_biblioteca(Autor) :- libro(Libro, Autor), tiene_libro(_, Libro).
	~~~
	
7. Existe un autor que tiene más de 5 libros publicados.
	~~~
	autor_libros(Autor) :- cantidad_libros(Autor, N), N > 5.
	~~~
	
8. No todos los libros de la biblioteca están en buen estado.
	~~~
	en_buen_estado(Libro) :- tiene_libro(_, Libro), \+ deteriorado(Libro).
	~~~
	
9. Si un libro está en buen estado, puede ser prestado.
	~~~
	puede_prestarse(Libro) :- en_buen_estado(Libro).
	~~~
	
10. Todos los usuarios registrados pueden tomar prestado un libro.
	~~~
	puede_tomar_prestado(Usuario, Libro) :- usuario(Usuario), libro(Libro, _).
	~~~
	
11. Existen libros que solo se pueden consultar en la biblioteca.
	~~~
	solo_consulta(Libro) :- tiene_libro(_, Libro), \+ prestable(Libro).
	~~~
	
12. Todo libro prestado debe ser devuelto en 15 días.
	~~~
	devolucion(Libro, Dias) :- prestado(Libro), Dias =< 15.
	~~~
	
13. Hay un libro que nadie ha pedido en préstamo.
	~~~
	no_prestado(Libro) :- \+ prestado(Libro).
	~~~
	
14. Si un usuario tiene una multa, no puede pedir un libro prestado.
	~~~
	puede_pedir_libro(Usuario, Libro) :- usuario(Usuario), \+ tiene_multa(Usuario), libro(Libro, _).
	~~~
	
15. Todos los libros escritos por un mismo autor están en la misma
    sección.
	~~~
	misma_seccion(Libro1, Libro2) :- libro(Libro1, Autor), libro(Libro2, Autor), seccion(Libro1, Sec), seccion(Libro2, Sec).
	~~~
	
16. Existe un libro que tiene más de un ejemplar en la biblioteca.
	~~~
	varios_ejemplares(Libro) :- cantidad_ejemplares(Libro, N), N > 1.
	~~~
	
17. Todo usuario con más de tres préstamos debe devolver uno para pedir
    otro.
	~~~
	puede_pedir_libro(Usuario, Libro) :- prestamos(Usuario, N), N < 3, libro(Libro, _).
	~~~
	
18. Hay una sección de la biblioteca donde todos los libros son de
    ciencias.
	~~~
	seccion_ciencias(Libro) :- seccion(Libro, ciencias).
	~~~
	
19. No todos los libros en la biblioteca tienen más de 100 páginas.
	~~~
	menos_de_100_paginas(Libro) :- tiene_libro(_, Libro), paginas(Libro, P), P < 100.
	~~~
	
20. Existe un usuario que ha tomado prestados todos los libros de la
    sección infantil.
	~~~
	usuario_prestamo_total(Usuario) :- usuario(Usuario), \+ (seccion(Libro, infantil), \+ prestado_a(Libro, Usuario)).
	~~~
	