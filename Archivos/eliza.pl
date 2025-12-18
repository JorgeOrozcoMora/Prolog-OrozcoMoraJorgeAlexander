eliza :- 
    writeln('Hola, mi nombre es Eliza tu chatbot, por favor ingresa tu consulta, usar solo minusculas sin . al final:'),
    readln(Input),
    eliza(Input),!.

eliza(Input):- (Input == [adios]; Input == [adios, '.']),
    writeln('Adios. espero poder verte ayudado.'), !.

% Regla para capturar "tengo tal_sintoma" y dar respuesta completa con RIESGO
eliza(Input) :-
    member(tengo, Input),
    diagnostico_avanzado(Input, R),
    writeln(R),
    readln(Input1),
    eliza(Input1), !.

eliza(Input) :-
    template(Stim, Resp, IndStim),
    match(Stim, Input),
    replace0(IndStim, Input, 0, Resp, R),
    writeln(R),
    readln(Input1),
    eliza(Input1), !.

% ==================================================================
%                           RESPUESTAS
% ==================================================================

% 1. Lógica para Demon Slayer
replace0([I|_], Input, _, [flagDS, Type], R) :-
    nth0(I, Input, Param),
    ds_logic(Type, Param, R), !.

replace0([], _, _, [flagDS, Type], R) :-
    ds_logic(Type, _, R), !.

% 2. Lógica para Árbol Familiar
replace0([I|_], Input, _, [flagFamily, Type], R) :-
    nth0(I, Input, Person),
    get_and_format_kinship(Person, Type, R), !.

% 2.5 Lógica para Conteo de Miembros
replace0([], _, _, [flagCount, Type], R) :-
    elizaCount(Type, R), !.

% 2.6 Lógica para Conteo Específico de Parientes
replace0([I1, I2|_], Input, _, [flagCountKinship], R) :-
    nth0(I1, Input, Type),
    nth0(I2, Input, Person),
    elizaCountKinship(Type, Person, R), !.

% 3. Lógica Médica y Diagnóstico
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    nth0(0, Resp, Flag),
    (   Flag == flagSymptoms -> elizaSymptoms(Atom, R)
    ;   Flag == flagMedicine -> elizaMedicine(Atom, R)
    ;   Flag == flagSpecialist -> elizaSpecialist(Atom, R)
    ;   Flag == flagGoTo -> elizaGoTo(Atom, R)
    ;   Flag == flagLike -> elizaLikes(Atom, R)
    ;   Flag == flagDo -> elizaDoes(Atom, R)
    ;   Flag == flagIs -> elizaIs(Atom, R)
    ;   Flag == flagRisk -> elizaRiskList(Atom, R)
    ), !.

% 4. Sustitución Normal
replace0([I|Index], Input, N, Resp, R):-
    length(Index, M), M =:= 0,
    nth0(I, Input, Atom),
    select(N, Resp, Atom, R1), append(R1, [], R),!.

replace0([I|Index], Input, N, Resp, R):-
    nth0(I, Input, Atom),
    length(Index, M), M > 0,
    select(N, Resp, Atom, R1),
    N1 is N + 1,
    replace0(Index, Input, N1, R1, R),!.

replace0([], _, _, Resp, Resp).

% ================================================================================================================
% PLANTILLAS DE BIENVENIDA, ESTADOS DE ANIMO, DESPEDIDAS, SISTEMA MEDICO, ARBOL FAMILIAR, ARBOL TEMATICO Y GUSTOS
% ================================================================================================================

template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [4]).
template([hola, me, llamo, s(_), '.'], ['Hola', 0, 'Un', gusto, conocerte, '!'], [3]).
template([hola, _], ['Hola', 'como', estas, tu, '?'], []).
template([buendia, _], ['Buendia', 'Como', estas, tu, '?'], []).

template([me, llamo, s(_), '.'], ['Hola', 0, 'Como', estas, '?'], [2]).
template([que, tal, por, aqui, s(_), '.'], ['Es', un, gusto, tenerte, por, aqui, 0], [4]).
template([que, milagro, soy, s(_), '.'], ['¡Que', milagro, 0, '!', '¿Como', has, estado, '?'], [3]).
template([hey, que, onda, soy, s(_), '.'], ['Que', onda, 0, ',', '¿en', que, andamos, hoy, '?'], [4]).
template([buenas, mi, estimado, soy, s(_), '.'], ['Un', placer, saludarte, 0, ',', 'bienvenido'], [4]).
template([hola, un, gusto, soy, s(_), '.'], ['El', gusto, es, mio, 0, '¿como', te, puedo, servir, '?'], [4]).
template([que, gusto, saludarte, soy, s(_), '.'], ['Igualmente', 0, ',', 'cuentame', lo, que, necesites], [3]).
template([buenos, dias, me, presento, soy, s(_), '.'], ['Buenos', dias, 0, '¿que', plan, tenemos, para, hoy, '?'], [5]).
template([que, onda, por, aca, s(_), '.'], ['Todo', tranquilo, por, aca, 0, '¿y', tu, '?'], [4]).
template([hola, Eliza, soy, s(_), '.'], ['Hola', 0, '¿ya', estas, listo, para, charlar, '?'], [3]).
template([que, tal, todo, soy, s(_), '.'], ['Todo', excelente, 0, '¿que', hay, de, nuevo, '?'], [4]).
template([saludos, cordiales, soy, s(_), '.'], ['Saludos', para, ti, tambien, 0], [3]).
template([hola, de, nuevo, soy, s(_), '.'], ['¡Hola', de, nuevo, 0, '!', 'me', alegra, verte], [4]).
template([aqui, reportandose, s(_), '.'], ['Reporte', recibido, 0, '¿que', consulta, tienes, '?'], [2]).
template([habla, s(_), '.'], ['Te', escucho, fuerte, y, claro, 0], [1]).
template([buen, dia, Eliza, soy, s(_), '.'], ['Buen, dia', 0, '¿en', que, te, apoyo, hoy, '?'], [4]).
template([muy, buenas, soy, s(_), '.'], ['Muy', buenas, tengas, tu, tambien, 0], [3]).
template([hello, soy, s(_), '.'], ['Hello', 0, 'nice', to, meet, you], [2]).
template([que, gusto, me, llamo, s(_), '.'], ['¡Que', alegria, 0, '!', 'bienvenido', a, mi, sistema], [4]).

template([adios, me, voy, soy, s(_), '.'], ['Adios', 0, 'Que', tengan, un, excelente, día], [4]).
template([hasta, luego, me, llamo, s(_), '.'], ['Hasta', luego, 0, 'Cuidate', mucho], [4]).
template([me, despido, soy, s(_), '.'], ['Nos', vemos, 0, 'Vuelve', pronto], [3]).
template([nos, vemos, soy, s(_), '.'], ['Hasta', la, vista, 0], [3]).
template([hasta, la, proxima, soy, s(_), '.'], ['Hasta', luego, 0], [4]).
template([me, retiro, soy, s(_), '.'], ['Entendido', 0, 'Que', te, vaya, bien], [3]).
template([buena, tarde, soy, s(_), '.'], ['Igualmente', para, ti, 0], [3]).
template([hasta, despues, soy, s(_), '.'], ['Aqui', estaré, esperando, 0], [3]).
template([fue, un, placer, soy, s(_), '.'], ['El', placer, fue, mio, 0], [4]).
template([que, te, vaya, bien, soy, s(_), '.'], ['Gracias', 0, 'Igualmente'], [5]).
template([nos, vemos, pronto, soy, s(_), '.'], ['Te', veo, luego, 0], [4]).
template([cuidate, soy, s(_), '.'], ['Tu', tambien, 0, 'Adiós'], [2]).
template([gracias, me, voy, soy, s(_), '.'], ['De', nada, 0, 'Hasta', pronto], [4]).
template([hasta, mañana, soy, s(_), '.'], ['Que', descanses, 0], [3]).
template([que, tengan, buen, dia, soy, s(_), '.'], ['Gracias', 0, 'Tu, también'], [5]).
template([me, retiro, que, estes, bien, soy, s(_), '.'], ['Igualmente', 0, 'Hasta', la, próxima], [6]).
template([bye, bye, soy, s(_), '.'], ['Bye', 0], [3]).
template([chao, soy, s(_), '.'], ['Chao', 0], [2]).
template([ya, me, desconecto, soy, s(_), '.'], ['Entendido', 0, 'Desconexión', exitosa], [4]).
template([me, marcho, por, hoy, soy, s(_), '.'], ['Hasta', mañana, 0], [5]).

template([como, estas, '?'], ['Estoy', bien, 'gracias', 'por', preguntar, '!'], []).
template([estoy, bien, gracias, '.'], ['Me', alegra, 'que', estes, bien, '!'], []).
template([estoy, muy, feliz, '.'], ['Me', encanta, escuchar, eso, '¿A', qué, se, debe, tanta, alegría, '?'], []).
template([me, siento, triste, '.'], ['Siento', mucho, escuchar, eso, '¿Quieres', hablar, de, ello, '?'], []).
template([estoy, muy, enojado, '.'], ['Respira', profundo, 'Trata', de, calmarte, para, pensar, mejor], []).
template([me, siento, cansado, '.'], ['A', veces, es, necesario, un, descanso, 'No', te, sobrepases], []).
template([estoy, emocionado, '.'], ['¡Que', genial, 'La', emoción, es, el, motor, de, la, vida, '!'], []).
template([me, siento, solo, '.'], ['Aquí', estoy, yo, para, charlar, contigo, 'No', estás, solo], []).
template([estoy, aburrido, '.'], ['¿Por', qué, no, intentas, aprender, algo, nuevo, o, ver, una, película, '?'], []).
template([me, siento, ansioso, '.'], ['Trata', de, enfocarte, en, tu, respiración, 'Todo', estará, bien], []).
template([estoy, confundido, '.'], ['Dime', que, te, confunde, e, intentaré, aclártelo], []).
template([me, siento, motivado, '.'], ['¡Esa', es, la, actitud, 'Aprovecha', esa, energía, para, tus, metas, '!'], []).
template([estoy, nervioso, '.'], ['Es', normal, sentirse, así, ante, algo, importante, '¡Tú, puedes', '!'], []).
template([me, siento, agradecido, '.'], ['La', gratitud, es, una, virtud, hermosa], []).
template([estoy, sorprendido, '.'], ['¿Qué', ha, pasado, para, que, estés, así, '?'], []).
template([me, siento, relajado, '.'], ['Qué', envidia, 'Disfruta', mucho, de, esa, paz], []).
template([estoy, estresado, '.'], ['Tómate', un, momento, para, ti, 'El', estrés, no, ayuda, en, nada], []).

template([que, sintomas, tiene, la, s(_)], [flagSymptoms], [4]).
template([cuales, son, los, sintomas, de, la, s(_)], [flagSymptoms], [6]).
template([sintomas, de, s(_)], [flagSymptoms], [2]).
template([con, que, medicina, se, cura, la, s(_)], [flagMedicine], [6]).
template([medicina, para, s(_)], [flagMedicine], [2]).
template([quien, es, el, especialista, para, la, s(_)], [flagSpecialist], [6]).
template([a, donde, debo, acudir, por, la, s(_)], [flagGoTo], [6]).
template([cuales, enfermedades, son, de, riesgo, s(_)], [flagRisk], [5]).
template([que, enfermedades, tienen, riesgo, s(_)], [flagRisk], [4]).

template([quien, es, el, padre, de, s(_)], [flagFamily, padre], [5]).
template([quien, es, la, madre, de, s(_)], [flagFamily, madre], [5]).
template([quien, es, la, pareja, de, s(_)], [flagFamily, es_pareja], [5]).
template([quienes, son, los, padres, de, s(_)], [flagFamily, padres_total], [5]).
template([quienes, son, los, hermanos, de, s(_)], [flagFamily, hermanos], [5]).
template([quienes, son, los, primos, de, s(_)], [flagFamily, primos], [5]).
template([quienes, son, los, abuelos, de, s(_)], [flagFamily, abuelo_total], [5]).
template([quienes, son, los, tios, de, s(_)], [flagFamily, tio_total], [5]).
template([quienes, son, los, sobrinos, de, s(_)], [flagFamily, sobrino_total], [5]).
template([quienes, son, los, hijos, de, s(_)], [flagFamily, hijos], [5]).
template([quienes, son, los, nietos, de, s(_)], [flagFamily, nietos], [5]).
template([cuantos, miembros, de, la, familia, son, hombres], [flagCount, hombre], []).
template([cuantas, son, mujeres], [flagCount, mujer], []).
template([cuantos, miembros, hay, en, la, familia], [flagCount, total], []).
template([cuantos, s(_), tiene, s(_)], [flagCountKinship], [1, 3]). 

template([cuantos, son, pilares, actuales], [flagDS, count_pilares_actuales], []).
template([cuantos, son, ex, pilares], [flagDS, count_expilares], []).
template([quienes, son, los, pilares, actuales], [flagDS, actuales_pilares], []).
template([quienes, son, los, ex, pilares], [flagDS, todos_expilares], []).
template([cuantos, personajes, son, pilares], [flagDS, count_pilares], []).
template([cuantos, son, lunas, superiores], [flagDS, count_lunas_sup], []).
template([cuantos, son, lunas, inferiores], [flagDS, count_lunas_inf], []).
template([cuantos, demonios, hay], [flagDS, count_demonios], []).
template([cuantos, personajes, son, de, la, familia, ubuyashiki], [flagDS, count_ubuyashiki], []).
template([cuantos, son, cazadores, de, demonios], [flagDS, count_cazadores], []).
template([quien, es, la, luna, superior, s(_)], [flagDS, busca_luna_sup], [5]).
template([quien, es, la, luna, inferior, s(_)], [flagDS, busca_luna_inf], [5]).
template([quienes, son, las, lunas, superiores], [flagDS, lunas_sup], []).
template([quien, usa, la, respiracion, del, s(_)], [flagDS, respiracion], [5]). 
template([quien, usa, la, respiracion, de, s(_)], [flagDS, respiracion], [5]). 
template([quien, es, el, pilar, de, s(_)], [flagDS, pilar_de], [5]).            
template([quienes, son, los, pilares], [flagDS, todos_pilares], []).
template([quienes, son, las, lunas, inferiores], [flagDS, lunas_inf], []).
template([quienes, pertenecen, a, la, familia, ubuyashiki], [flagDS, ubuyashiki], []).
template([quienes, son, todos, los, demonios], [flagDS, todos_demonios], []).
template([menciona, a, los, cazadores, de, demonios], [flagDS, todos_cazadores], []).
template([lista, a, los, civiles], [flagDS, lista_civiles], []).

template([te, gusta, la, s(_), _], [flagLike], [3]).
template([te, gusta, el, s(_), _], [flagLike], [3]).
template([tu, eres, s(_), _], [flagDo], [2]).
template([eres, s(_), '?'], [flagIs], [2]).

template(_, ['Please', explain, a, little, more, '.'], []).

% ==================================================================
%                   LOGICA SISTEMA EXPERTO MEDICO
% ==================================================================

% Diagnóstico basado en puntuación
diagnostico_avanzado(Input, R) :-
    findall(Enf, (sintomade(S, Enf), member(S, Input)), ListaBruta),
    (   ListaBruta \= [] -> 
        contar_coincidencias(ListaBruta, Coincidencias),
        keysort(Coincidencias, Ordenado),
        reverse(Ordenado, ListaOrdenada),
        ListaOrdenada = [MaxPuntos-_|_],
        findall(E, member(MaxPuntos-E, ListaOrdenada), Ganadoras),
        procesar_resultado_final(MaxPuntos, Ganadoras, R)
    ;   R = ['Lo', siento, ',', no, puedo, identificar, ninguna, enfermedad, con, esos, sintomas]
    ).

% Caso A: Una única ganadora o primera opción con Riesgo
procesar_resultado_final(_, [Ganadora], R) :-
    medicinade(M, Ganadora),
    especialistade(Esp, Ganadora),
    acudir(Ganadora, Lugar),
    riesgode(Nivel, Ganadora),
    R = ['Parece', que, tienes, Ganadora, ',', riesgo, Nivel, '', '.', 'Te', recomiendo, M, '.', 
         'Debes', acudir, con, el, especialista, Esp, 'en', Lugar], !.

% Caso B: Empate
procesar_resultado_final(Puntos, Ganadoras, R) :-
    Puntos > 1,
    length(Ganadoras, N), N > 1,
    list_to_sentence(Ganadoras, Nombres),
    R = ['Tienes', Puntos, sintomas, que, coinciden, con, varias, enfermedades, ':', Nombres, '.', 
         'Por', favor, ',', ingresa, mas, sintomas, para, un, diagnostico, preciso], !.

% Caso C: Solo un síntoma
procesar_resultado_final(_, Ganadoras, R) :-
    list_to_sentence(Ganadoras, Nombres),
    R = ['Encontre', coincidencias, leves, con, ':', Nombres, '.', '¿Podrias', ser, mas, especifico, '?'], !.

contar_coincidencias([], []).
contar_coincidencias([E|Tail], [Count-E|T]) :-
    findall(E, member(E, [E|Tail]), Hallazgos),
    length(Hallazgos, Count),
    delete(Tail, E, Limpio),
    contar_coincidencias(Limpio, T).

elizaSymptoms(Enf, R) :- enfermedad(Enf), findall(S, sintomade(S, Enf), L), (L \= [] -> list_to_sentence(L, Sent), R = ['Los', sintomas, de, Enf, son, Sent] ; R = ['No', info, de, sintomas, de, Enf]).
elizaSymptoms(Enf, R) :- \+enfermedad(Enf), R = [Enf, 'no', es, una, enfermedad, conocida].

elizaMedicine(Enf, R) :- enfermedad(Enf), findall(M, medicinade(M, Enf), L), (L \= [] -> list_to_sentence(L, S), R = ['La', medicina, para, Enf, es, S] ; R = ['No', info, de, medicina, de, Enf]).
elizaMedicine(Enf, R) :- \+enfermedad(Enf), R = [Enf, desconocida].

elizaSpecialist(Enf, R) :- enfermedad(Enf), findall(E, especialistade(E, Enf), L), (L \= [] -> list_to_sentence(L, S), R = ['El', especialista, es, S] ; R = ['No', info, de, especialista]).
elizaSpecialist(Enf, R) :- \+enfermedad(Enf), R = [Enf, desconocida].

elizaGoTo(Enf, R) :- (acudir(Enf, Lugar) -> R = ['Acuda', a, Lugar, por, Enf] ; R = ['No', se, donde, ir]).

elizaRiskList(Nivel, R) :- findall(E, riesgode(Nivel, E), L), (L \= [] -> list_to_sentence(L, S), R = ['Las', enfermedades, de, riesgo, Nivel, son, ':', S] ; R = ['No', tengo, registradas, enfermedades, con, riesgo, Nivel]).

% ==================================================================
%                         LOGICA ARBOL FAMILIAR
% ==================================================================
get_and_format_kinship(Person, Type, R) :-
    (hombre(Person); mujer(Person)) -> (
        findall(Kin, call_family_logic(Type, Kin, Person), List),
        (List = [] -> R = ['No', encontre, Type, de, Person] ; list_to_sentence(List, Sent), obtener_etiqueta(Type, Et), R = [Et, de, Person, son, ':', Sent])
    ) ; R = [Person, no, esta, en, mi, base, de, datos].

obtener_etiqueta(padre, 'El padre'). obtener_etiqueta(madre, 'La madre'). obtener_etiqueta(es_pareja, 'La pareja').
obtener_etiqueta(hermanos, 'Los hermanos'). obtener_etiqueta(primos, 'Los primos'). obtener_etiqueta(abuelo_total, 'Los abuelos').
obtener_etiqueta(tio_total, 'Los tios'). obtener_etiqueta(sobrino_total, 'Los sobrinos').
obtener_etiqueta(hijos, 'Los hijos'). obtener_etiqueta(nietos, 'Los nietos'). obtener_etiqueta(padres_total, 'Los padres').

call_family_logic(padre, K, P) :- padre(K, P).
call_family_logic(madre, K, P) :- madre(K, P).
call_family_logic(es_pareja, K, P) :- es_pareja(K, P).
call_family_logic(hermanos, K, P) :- hermanos(K, P).
call_family_logic(primos, K, P) :- primos(K, P).
call_family_logic(abuelo_total, K, P) :- (abuelo(K, P); abuela(K, P)).
call_family_logic(tio_total, K, P) :- (tio(K, P); tia(K, P)).
call_family_logic(sobrino_total, K, P) :- (sobrino(K, P); sobrina(K, P)).
call_family_logic(hijos, K, P) :- hijo(K, P). 
call_family_logic(nietos, K, P) :- (nieto(K, P); nieta(P, K)). 
call_family_logic(padres_total, K, P) :- (padre(K, P); madre(K, P)).

elizaCount(hombre, R) :- findall(H, hombre(H), L), length(L, N), R = ['Hay', N, miembros, que, son, hombres, en, la, familia].
elizaCount(mujer, R) :- findall(M, mujer(M), L), length(L, N), R = ['Hay', N, miembros, que, son, mujeres, en, la, familia].
elizaCount(total, R) :- 
    findall(H, hombre(H), L1), length(L1, N1),
    findall(M, mujer(M), L2), length(L2, N2),
    Total is N1 + N2,
    R = ['En', total, ',', hay, Total, miembros, en, la, familia].

elizaCountKinship(Type, Person, R) :-
    ( Type == primos -> InternalType = primos
    ; Type == tios -> InternalType = tio_total
    ; Type == sobrinos -> InternalType = sobrino_total
    ; Type == hermanos -> InternalType = hermanos
    ; Type == hijos -> InternalType = hijos
    ; Type == nietos -> InternalType = nietos
    ; InternalType = Type
    ),
    ( (hombre(Person); mujer(Person)) -> (
        findall(Kin, call_family_logic(InternalType, Kin, Person), List),
        length(List, N),
        R = [Person, tiene, N, Type]
    ) ; R = [Person, no, esta, en, mi, base, de, datos] ).

% ==================================================================
%                         LOGICA ARBOL TEMATICO
% ==================================================================
ds_logic(que_es, _, R) :- R = ['Demon', slayer, ',', conocido, en, japón, como, kimetsu, no, yaiba, ',', es, una, serie, de, manga, y, anime, que, sigue, a, tanjiro, kamado, en, su, viaje, para, vengar, a, su, familia, y, curar, a, su, hermana, nezuko, de, una, maldición, demoníaca].
ds_logic(actuales_pilares, _, R) :- findall(P, pilar(P, _), Lista), list_to_sentence(Lista, Sent), R = ['Los', pilares, actuales, son, ':', Sent].
ds_logic(todos_expilares, _, R) :- findall(P, pilar_ex(P, _), Lista), list_to_sentence(Lista, Sent), R = ['Los', ex, pilares, registrados, son, ':', Sent].
ds_logic(count_pilares_actuales, _, R) :- findall(P, pilar(P, _), L), length(L, N), R = ['Hay', N, personajes, que, son, pilares, actuales].
ds_logic(count_expilares, _, R) :- findall(P, pilar_ex(P, _), L), length(L, N), R = ['Hay', N, ex, pilares, en, mis, registros].

ds_logic(lunas_sup, _, R) :- findall(L, luna_superior(L, _), Lista), list_to_sentence(Lista, Sent), R = ['Las', lunas, superiores, son, ':', Sent].
ds_logic(respiracion, Tipo, R) :- findall(P, usa_respiracion(P, Tipo), Lista), (Lista \= [] -> list_to_sentence(Lista, Sent), R = ['Los', que, usan, la, respiracion, de, Tipo, son, ':', Sent] ; R = ['Nadie', parece, usar, esa, respiracion]).
ds_logic(pilar_de, Tipo, R) :- (pilar(Nombre, Tipo) -> R = ['El', pilar, de, la, respiracion, de, Tipo, es, Nombre] ; R = ['No', hay, un, pilar, de, Tipo]).
ds_logic(todos_pilares, _, R) :- findall(P, (pilar(P, _); pilar_ex(P, _)), Lista), list_to_sentence(Lista, Sent), R = ['Los', pilares, totales, '(', actuales, y, ex, ')', son, ':', Sent].
ds_logic(lunas_inf, _, R) :- findall(L, luna_inferior(L, _), Lista), list_to_sentence(Lista, Sent), R = ['Las', lunas, inferiores, son, ':', Sent].
ds_logic(ubuyashiki, _, R) :- findall(F, familia_ubuyashiki(F), Lista), list_to_sentence(Lista, Sent), R = ['La', familia, ubuyashiki, ':', Sent].
ds_logic(todos_demonios, _, R) :- findall(D, (luna_superior(D, _); luna_inferior(D, _); solitario(D)), Lista), list_to_sentence(Lista, Sent), R = ['Los', demonios, registrados, son, ':', Sent].
ds_logic(todos_cazadores, _, R) :- findall(C, (pilar(C, _); pilar_ex(C, _); cazador_estandar(C, _)), Lista), list_to_sentence(Lista, Sent), R = ['Los', cazadores, son, ':', Sent].
ds_logic(lista_civiles, _, R) :- findall(C, civil(C), Lista), list_to_sentence(Lista, Sent), R = ['Los', civiles, son, ':', Sent].
ds_logic(count_pilares, _, R) :- findall(P, (pilar(P, _); pilar_ex(P, _)), L), length(L, N), R = ['Hay', N, personajes, que, son, o, fueron, pilares].
ds_logic(count_lunas_sup, _, R) :- findall(L, luna_superior(L, _), L2), length(L2, N), R = ['Hay', N, lunas, superiores].
ds_logic(count_lunas_inf, _, R) :- findall(L, luna_inferior(L, _), L2), length(L2, N), R = ['Hay', N, lunas, inferiores].
ds_logic(count_demonios, _, R) :- findall(D, (luna_superior(D, _); luna_inferior(D, _); solitario(D)), L), length(L, N), R = ['Hay', N, demonios, registrados].
ds_logic(count_ubuyashiki, _, R) :- findall(F, familia_ubuyashiki(F), L), length(L, N), R = ['Hay', N, miembros, de, la, familia, ubuyashiki].
ds_logic(count_cazadores, _, R) :- findall(C, (pilar(C, _); pilar_ex(C, _); cazador_estandar(C, _)), L), length(L, N), R = ['Hay', N, cazadores, de, demonios].
ds_logic(busca_luna_sup, Num, R) :- findall(N, luna_superior(N, Num), L), (L \= [] -> list_to_sentence(L, S), R = ['La', luna, superior, Num, es, ':', S] ; R = ['No', tengo, registro, de, la, luna, superior, Num]).
ds_logic(busca_luna_inf, Num, R) :- findall(N, luna_inferior(N, Num), L), (L \= [] -> list_to_sentence(L, S), R = ['La', luna, inferior, Num, es, ':', S] ; R = ['No', tengo, registro, de, la, luna, inferior, Num]).

% ==================================================================
%                         GUSTOS DE ELIZA
% ==================================================================
elizaLikes(X, R):- likes(X), R = ['Yeah', i, like, X].
elizaLikes(X, R):- \+likes(X), R = ['Nope', i, do, not, like, X].
likes(apples). likes(ponies). likes(zombies). likes(manzanas). likes(computadoras). likes(anime). likes(pizza). likes(videojuegos). likes(programacion).
likes(perros). likes(gatos). likes(musica). likes(futbol). likes(baloncesto). likes(series). likes(peliculas). likes(libros). likes(cafe). likes(chocolate). likes(helado). likes(hamburguesas). likes(tacos). likes(viajar). likes(fotografia). likes(arte). likes(tecnologia). likes(ciencia). likes(historia). likes(kpop). likes(gimnasio). likes(robotica). likes(astronomia). likes(espacio). likes(naturaleza). likes(montanas). likes(playa). likes(mar). likes(rap). likes(rock).

elizaDoes(X, R):- does(X), R = ['Yes', i, X, and, i, love, it].
elizaDoes(X, R):- \+does(X), R = ['No', i, do, not, X].
does(study). does(cook). does(work).

elizaIs(X, R):- is0(X), R = ['Yes', yo, soy, X].
elizaIs(X, R):- \+is0(X), R = ['No', i, am, not, X].
is0(nice). is0(fine). is0(happy). is0(intelligent).

% ==================================================================
%                   HECHOS SISTEMA EXPERTO MEDICO
% ==================================================================
enfermedad(gripe). enfermedad(rubeola). enfermedad(malaria). enfermedad(hepatitis). enfermedad(tuberculosis). enfermedad(anemia). enfermedad(brucelosis). enfermedad(cirrosis_hepatica). enfermedad(clamidia).
enfermedad(dengue). enfermedad(covid).

riesgode(bajo, gripe). riesgode(bajo, anemia).
riesgode(medio, rubeola). riesgode(medio, brucelosis). riesgode(medio, clamidia).
riesgode(alto, malaria). riesgode(alto, hepatitis). riesgode(alto, tuberculosis). riesgode(alto, cirrosis_hepatica). riesgode(alto, dengue). riesgode(alto, covid).

sintomade(tos, gripe). sintomade(cansancio, gripe). sintomade(fiebre, gripe). sintomade(dolorcabeza, gripe).
sintomade(nauseas, hepatitis). sintomade(diarrea, hepatitis). sintomade(ictericia, hepatitis).
sintomade(cansancio, anemia). sintomade(apatia, anemia). sintomade(nauseas, anemia).
sintomade(tos, tuberculosis). sintomade(cansancio, tuberculosis). sintomade(fiebre, tuberculosis). sintomade(escalofrios, tuberculosis).
sintomade(escalofrios, malaria). sintomade(fiebre, malaria). sintomade(diarrea, malaria). sintomade(ictericia, malaria).
sintomade(fiebre, rubeola). sintomade(jaqueca, rubeola). sintomade(secrecion, rubeola).
sintomade(fiebre, brucelosis). sintomade(sudoracion_nocturna, brucelosis). sintomade(dolormuscular, brucelosis). sintomade(cansancio, brucelosis).
sintomade(ictericia, cirrosis_hepatica). sintomade(vomito_sangre, cirrosis_hepatica). sintomade(fatiga, cirrosis_hepatica). sintomade(hinchazon_abdomen, cirrosis_hepatica).
sintomade(dolor_orinar, clamidia). sintomade(secrecion, clamidia). sintomade(dolor_pelvico, clamidia). sintomade(sangrado, clamidia).
sintomade(dolor_detras_ojos, dengue). sintomade(fiebre, dengue). sintomade(sarpullido, dengue).
sintomade(perdida_olfato, covid). sintomade(tos, covid). sintomade(fiebre, covid).

medicinade(contrex, gripe). medicinade(jarabe, gripe). medicinade(pastillas, tuberculosis). medicinade(vacuna, malaria). medicinade(vacuna, rubeola). medicinade(vitaminas, anemia). medicinade(pastillas, hepatitis).
medicinade(antibioticos, brucelosis). medicinade(doxiciclina, brucelosis). medicinade(diureticos, cirrosis_hepatica). medicinade(tratamiento_hepatico, cirrosis_hepatica). medicinade(azitromicina, clamidia). medicinade(doxiciclina, clamidia).
medicinade(paracetamol, dengue). medicinade(sueros, dengue).
medicinade(antivirales, covid). medicinade(descanso, covid).

especialistade(otorrino, gripe). especialistade(nutricionista, anemia). especialistade(endocrinologo, hepatitis). especialistade(medicogeneral, rubeola). especialistade(nutricionista, tuberculosis). especialistade(medicogeneral, malaria). especialistade(infectologo, brucelosis). especialistade(hepatologo, cirrosis_hepatica). especialistade(ginecologo, clamidia). especialistade(urologo, clamidia).
especialistade(infectologo, dengue).
especialistade(neumologo, covid).

acudir(gripe, clinica_general). acudir(rubeola, clinica_general). acudir(malaria, hospital). acudir(hepatitis, hospital). acudir(tuberculosis, centro_especializado). acudir(anemia, clinica_general). acudir(brucelosis, hospital). acudir(cirrosis_hepatica, hospital_especializado). acudir(clamidia, clinica_salud_sexual).
acudir(dengue, centro_de_salud).
acudir(covid, area_de_aislamiento).

% ==================================================================
%                         HECHOS FAMILIARES
% ==================================================================
hombre(ricardo). hombre(felipe). hombre(cesar_ricardo). hombre(cachin). hombre(eladio). hombre(jorge_eduardo). hombre(rodolfo). hombre(alejo). hombre(juan_felipe). hombre(jose_maria). hombre(antonio). hombre(giovanni). hombre(christian). hombre(cesar). hombre(emanuel). hombre(dariel). hombre(efren). hombre(jonathan_eduardo). hombre(jorge_alexander). hombre(kevin_israel). hombre(lenin_alejandro). hombre(erick_daniel). hombre(jose_maria_jr). hombre(carlos_miguel). hombre(david_roberto). hombre(rodolfo_neri).
mujer(juliana). mujer(soledad_hilda). mujer(yasmin). mujer(guadalupe). mujer(katia). mujer(sandra_yedith). mujer(ana_berenice). mujer(hilda_gabriela). mujer(gabriela). mujer(monica). mujer(azul_angelica). mujer(nataly). mujer(zuri_sherlyn). mujer(johana). mujer(luciana). mujer(karla_yunuen).

pareja(ricardo, juliana). pareja(felipe, soledad_hilda). pareja(cesar_ricardo, yasmin). pareja(guadalupe, cauchin). pareja(katia, eladio). pareja(jorge_eduardo, sandra_yedith). pareja(ana_berenice, rodolfo). pareja(hilda_gabriela, alejo). pareja(juan_felipe, gabriela). pareja(monica, jose_maria).
es_pareja(A, B) :- pareja(A, B). es_pareja(A, B) :- pareja(B, A).

hijo(cesar_ricardo, ricardo). hijo(cesar_ricardo, juliana). hijo(guadalupe, ricardo). hijo(guadalupe, juliana). hijo(katia, ricardo). hijo(katia, juliana). hijo(jorge_eduardo, ricardo). hijo(jorge_eduardo, juliana).
hijo(ana_berenice, felipe). hijo(ana_berenice, soledad_hilda). hijo(hilda_gabriela, felipe). hijo(hilda_gabriela, soledad_hilda). hijo(juan_felipe, felipe). hijo(juan_felipe, soledad_hilda). hijo(monica, felipe). hijo(monica, soledad_hilda). hijo(sandra_yedith, felipe). hijo(sandra_yedith, soledad_hilda).
hijo(cesar, cesar_ricardo). hijo(cesar, yasmin). hijo(emanuel, cesar_ricardo). hijo(emanuel, yasmin). hijo(dariel, cesar_ricardo). hijo(dariel, yasmin).
hijo(efren, katia). hijo(efren, eladio). hijo(nataly, katia). hijo(nataly, eladio).
hijo(antonio, cauchin). hijo(antonio, guadalupe). hijo(giovanni, cauchin). hijo(giovanni, guadalupe). hijo(christian, cauchin). hijo(christian, guadalupe).
hijo(zuri_sherlyn, jorge_eduardo). hijo(zuri_sherlyn, sandra_yedith). hijo(jonathan_eduardo, jorge_eduardo). hijo(jonathan_eduardo, sandra_yedith). hijo(jorge_alexander, jorge_eduardo). hijo(jorge_alexander, sandra_yedith).
hijo(kevin_israel, hilda_gabriela). hijo(kevin_israel, alejo). hijo(lenin_alejandro, hilda_gabriela). hijo(lenin_alejandro, alejo).
hijo(erick_daniel, juan_felipe). hijo(erick_daniel, gabriela). hijo(johana, juan_felipe). hijo(johana, gabriela). hijo(luciana, juan_felipe). hijo(luciana, gabriela).
hijo(jose_maria_jr, monica). hijo(jose_maria_jr, jose_maria). hijo(carlos_miguel, monica). hijo(carlos_miguel, jose_maria). hijo(karla_yunuen, monica). hijo(karla_yunuen, jose_maria).
hijo(david_roberto, rodolfo). hijo(david_roberto, ana_berenice). hijo(azul_angelica, rodolfo). hijo(azul_angelica, ana_berenice). hijo(rodolfo_neri, rodolfo). hijo(rodolfo_neri, ana_berenice).

padre(P, H) :- hijo(H, P), hombre(P). madre(M, H) :- hijo(H, M), mujer(M).
parent(P, H) :- padre(P, H); madre(P, H).
hermanos(A, B) :- padre(P, A), padre(P, B), madre(M, A), madre(M, B), A \= B.
abuelo(A, N) :- hombre(A), parent(P, N), parent(A, P). abuela(A, N) :- mujer(A), parent(P, N), parent(A, P).
tio(T, S) :- hombre(T), parent(P, S), hermanos(T, P). tio(T, S) :- hombre(T), parent(P, S), hermanos(H, P), es_pareja(H, T).
tia(T, S) :- mujer(T), parent(P, S), hermanos(T, P). tia(T, S) :- mujer(T), parent(P, S), hermanos(H, P), es_pareja(H, T).
sobrino(S, T) :- hombre(S), (tio(T, S); tia(T, S)). sobrina(S, T) :- mujer(S), (tio(T, S); tia(T, S)).
primos(A, B) :- parent(P1, A), parent(P2, B), hermanos(P1, P2), A \= B.
nieto(N, A) :- hombre(N), parent(P, N), parent(A, P).
nieta(N, A) :- mujer(N), parent(P, N), parent(A, P).

% ==================================================================
%                         HECHOS DEMON SLAYER
% ==================================================================
pilar(giyu_tomioka, agua). pilar(gyomei_himejima, roca). pilar(mitsuri_kanroji, amor). pilar(muichiro_tokito, niebla). pilar(iguro_obanai, serpiente). pilar(kyojuro_rengoku, llama). pilar(shinobu_kocho, insecto). pilar(sanemi_shinazugawa, viento). pilar(tengen_uzui, sonido).
pilar_ex(shinjuro_rengoku, llama). pilar_ex(sakonji_urokodaki, agua). pilar_ex(jigoro_kuwajima, rayo).
familia_ubuyashiki(kagaya_ubuyashiki). familia_ubuyashiki(amane_ubuyashiki). familia_ubuyashiki(hinaki_ubuyashiki). familia_ubuyashiki(nichika_ubuyashiki). familia_ubuyashiki(kiriya_ubuyashiki). familia_ubuyashiki(kuina_ubuyashiki). familia_ubuyashiki(kanata_ubuyashiki).
cazador_estandar(kanao_tsuyuri, flor). cazador_estandar(tanjiro_kamado, solar). cazador_estandar(zenitsu_agatsuma, rayo). cazador_estandar(inosuke_hashibira, bestia). cazador_estandar(genya_shinazugawa, ninguna). cazador_estandar(yoriichi, solar).
civil(tanjuro_kamado). civil(sabito). civil(makomo). civil(hinatsuru). civil(makio). civil(suma). civil(keizo). 
luna_superior(kokushibo, uno). luna_superior(doma, dos). luna_superior(akaza, tres). luna_superior(hantengu, cuatro). luna_superior(gyokko, cinco). luna_superior(gyutaro, seis). luna_superior(daki, seis).
luna_inferior(enmu, uno). luna_inferior(rokuro, dos). luna_inferior(wakuraba, tres). luna_inferior(mukago, cuatro). luna_inferior(rui, cinco). luna_inferior(kamanue, seis).
solitario(tamayo). solitario(yushiro). solitario(nezuko_kamado). solitario(muzan_kibutsuji).
usa_respiracion(P, T) :- pilar(P, T); pilar_ex(P, T); cazador_estandar(P, T).

% ==================================================================
%                          
% ==================================================================
match([],[]).
match([], [_|_]) :- !, fail.
match([s(_)|SymbolTail], [InputHead|InputTail]) :-
    atom(InputHead), 
    match(SymbolTail, InputTail).
match([SymbolHead|SymbolTail], [SymbolHead|InputTail]) :-
    match(SymbolTail, InputTail).

list_to_sentence([H], H) :- !.
list_to_sentence([H1, H2], Sent) :- atomic_list_concat([H1, ' y ', H2], Sent), !.
list_to_sentence([H|T], Sent) :- list_to_sentence(T, T_Sent), atomic_list_concat([H, ', ', T_Sent], Sent).