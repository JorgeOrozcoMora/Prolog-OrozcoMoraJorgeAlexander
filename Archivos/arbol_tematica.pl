% CATEGORÍAS PRINCIPALES
humano(X) :- cazador_demonios(X); civil(X).
demonio(X) :- luna_superior(X, _); luna_inferior(X, _); solitario(X).

% CAZADORES DE DEMONIOS
cazador_demonios(X) :- pilar(X, _); pilar_ex(X, _); familia_ubuyashiki(X); cazador_estandar(X, _).

% Hechos: Pilares (Nombre, Respiración)
pilar(giyu_tomioka, agua).
pilar(gyomei_himejima, roca).
pilar(mitsuri_kanroji, amor).
pilar(muichiro_tokito, niebla).
pilar(iguro_obanai, serpiente).
pilar(kyojuro_rengoku, llama).
pilar(shinobu_kocho, insecto).
pilar(sanemi_shinazugawa, viento).
pilar(tengen_uzui, sonido).

% Hechos: Ex Pilares
pilar_ex(shinjuro_rengoku, llama).
pilar_ex(sakonji_urokodaki, agua).
pilar_ex(jigoro_kuwajima, rayo).

% Hechos: Familia Ubuyashiki
familia_ubuyashiki(kagaya_ubuyashiki).
familia_ubuyashiki(amane_ubuyashiki).
familia_ubuyashiki(hinaki_ubuyashiki).
familia_ubuyashiki(nichika_ubuyashiki).
familia_ubuyashiki(kiriya_ubuyashiki).
familia_ubuyashiki(kuina_ubuyashiki).
familia_ubuyashiki(kanata_ubuyashiki).

% Hechos: Cazadores normales (Nombre, Respiración)
cazador_estandar(kanao_tsuyuri, flor).
cazador_estandar(tanjiro_kamado, solar).
cazador_estandar(zenitsu_agatsuma, rayo).
cazador_estandar(inosuke_hashibira, bestia).
cazador_estandar(genya_shinazugawa, ninguna).
cazador_estandar(yoriichi, solar).

% CIVILES
civil(tanjuro_kamado). 
civil(sabito). 
civil(makomo). 
civil(hinatsuru).
civil(makio). 
civil(suma). 
civil(keizo). 
civil(koyuki).

% DEMONIOS
luna_superior(kokushibo, 1). 
luna_superior(douma, 2). 
luna_superior(akaza, 3).
luna_superior(nakime, 4). 
luna_superior(hantegu, 4). 
luna_superior(gyokko, 5).
luna_superior(daki_y_gyutaro, 6). 
luna_superior(kaigaku, 6).

luna_inferior(enmu, 1). 
luna_inferior(rokuro, 2). 
luna_inferior(wakuraba, 3).
luna_inferior(mukago, 4). 
luna_inferior(rui, 5). 
luna_inferior(kamanue, 5).
luna_inferior(kyogai, 6).

solitario(muzan_kibutsuji). 
solitario(nezuko_kamado). 
solitario(tamayo). 
solitario(yushiro).

% Buscar quién usa una respiración específica (Pilares + Cazadores)
usa_respiracion(Persona, Tipo) :- pilar(Persona, Tipo).
usa_respiracion(Persona, Tipo) :- pilar_ex(Persona, Tipo).
usa_respiracion(Persona, Tipo) :- cazador_estandar(Persona, Tipo).

% Listar todos los pilares (actuales y ex)
es_pilar(Persona) :- pilar(Persona, _); pilar_ex(Persona, _).

template([quienes, son, las, lunas, superiores], [flagDS, lunas_sup], []).
template([quien, usa, la, respiracion, del, s(_)], [flagDS, respiracion], [5]).
template([quien, es, el, pilar, de, s(_)], [flagDS, pilar_de], [5]).
template([quienes, son, los, pilares], [flagDS, todos_pilares], []).

% Lógica para Demon Slayer
replace0([I|_], Input, _, [flagDS, Type], R) :-
    (Type == respiracion ; Type == pilar_de) -> 
    (nth0(I, Input, Param), ds_logic(Type, Param, R)) ;
    ds_logic(Type, _, R).

% Procesamiento de respuestas naturales
ds_logic(lunas_sup, _, R) :- 
    findall(L, luna_superior(L, _), Lista),
    list_to_sentence(Lista, Sent),
    R = ['Las', lunas, superiores, son, ':', Sent].

ds_logic(respiracion, Tipo, R) :-
    findall(P, usa_respiracion(P, Tipo), Lista),
    (Lista \= [] -> list_to_sentence(Lista, Sent), R = ['Los', que, usan, la, respiración, de, Tipo, son, ':', Sent]
    ; R = ['Nadie', parece, usar, la, respiracion, de, Tipo]).

ds_logic(pilar_de, Tipo, R) :-
    pilar(Nombre, Tipo),
    R = ['El', pilar, de, la, respiracion, de, Tipo, es, Nombre].

ds_logic(todos_pilares, _, R) :-
    findall(P, es_pilar(P), Lista),
    list_to_sentence(Lista, Sent),
    R = ['Los', pilares, de, demon, slayer, son, ':', Sent].