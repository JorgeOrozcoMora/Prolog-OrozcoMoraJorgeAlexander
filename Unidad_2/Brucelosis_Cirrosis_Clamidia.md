# Brucelosis, Cirrosis Hepatica, Clamidia
**Orozco Mora Jorge Alexander**
*NC: 22120703*

---
### Brucelosis
La brucelosis es una enfermedad infecciosa causada por bacterias del género Brucella, que normalmente se transmiten de animales a humanos. Se puede contraer por consumir leche o carne contaminada, o por contacto directo con animales infectados. Produce síntomas como fiebre, cansancio, dolor muscular y sudoración nocturna.
~~~
sintomade(fiebre, brucelosis).
sintomade(sudoracion_nocturna, brucelosis).
sintomade(dolormuscular, brucelosis).
sintomade(cansancio, brucelosis).

medicinade(antibioticos, brucelosis).
medicinade(doxiciclina, brucelosis).
~~~

### Cirrosis Hepatica
La cirrosis hepática es un daño crónico del hígado en el que las células sanas son reemplazadas por tejido cicatrizado. Esto impide que el hígado funcione correctamente. Suele ser causada por alcoholismo, hepatitis crónica o hígado graso. Puede provocar ictericia, acumulación de líquido en el abdomen, fatiga y vómito con sangre.
~~~
sintomade(ictericia, cirrosis_hepatica).
sintomade(vomito_sangre, cirrosis_hepatica).
sintomade(fatiga, cirrosis_hepatica).
sintomade(hinchazon_abdomen, cirrosis_hepatica).

medicinade(diureticos, cirrosis_hepatica).
medicinade(tratamiento_hepatico, cirrosis_hepatica).
~~~


### Clamidia
La clamidia es una infección de transmisión sexual causada por la bacteria Chlamydia trachomatis. Muchas veces no presenta síntomas, pero puede causar dolor al orinar, secreción anormal, molestias pélvicas y sangrado. Si no se trata, puede producir complicaciones graves, especialmente en mujeres.
~~~
sintomade(dolor_orinar, clamidia).
sintomade(secrecion, clamidia).
sintomade(dolor_pelvico, clamidia).
sintomade(sangrado, clamidia).

medicinade(azitromicina, clamidia).
medicinade(doxiciclina, clamidia).
~~~

### Especialistas
~~~
especialistade(infectologo, brucelosis).
especialistade(hepatologo, cirrosis_hepatica).
especialistade(ginecologo, clamidia).
especialistade(urologo, clamidia).
~~~

### Lugares para Acudir
~~~
acudir(brucelosis, hospital).
acudir(cirrosis_hepatica, hospital_especializado).
acudir(clamidia, clinica_salud_sexual).
~~~