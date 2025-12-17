% ==========================================================
% HECHOS: Enfermedades y Síntomas
% ==========================================================
tiene_sintoma(gripe, fiebre).
tiene_sintoma(gripe, dolor_cabeza).
tiene_sintoma(gripe, congestion).

tiene_sintoma(alergia, estornudos).
tiene_sintoma(alergia, picazon_ojos).
tiene_sintoma(alergia, congestion).
tiene_sintoma(alergia, ojos_llorosos).

tiene_sintoma(migrana, dolor_cabeza_severo).
tiene_sintoma(migrana, sensibilidad_luz).
tiene_sintoma(migrana, nauseas).
tiene_sintoma(migrana, aura_visual).

tiene_sintoma(resfriado, estornudos).
tiene_sintoma(resfriado, congestion).
tiene_sintoma(resfriado, dolor_garganta).

% Síntomas del Covid
tiene_sintoma(covid, perdida_olfato).
tiene_sintoma(covid, tos_seca).
tiene_sintoma(covid, dificultad_respiratoria).

% Síntomas de la Gastritis
tiene_sintoma(gastritis, dolor_abdominal).
tiene_sintoma(gastritis, acidez).
tiene_sintoma(gastritis, nauseas).

% Actividad 8: Enfermedades Graves
tiene_sintoma(neumonia, fiebre).
tiene_sintoma(neumonia, dificultad_respiratoria).
tiene_sintoma(neumonia, dolor_pecho).
tiene_sintoma(neumonia, tos_con_flema).

tiene_sintoma(infarto, dolor_pecho).
tiene_sintoma(infarto, dolor_brazo_izquierdo).
tiene_sintoma(infarto, sudoracion_fria).
tiene_sintoma(infarto, falta_aire).

% ==========================================================
% HECHOS: Tratamientos
% ==========================================================
tratamiento(gripe, 'Reposo, hidratacion, paracetamol y aislamiento.').
tratamiento(alergia, 'Antihistaminicos y evitar el alergeno conocido.').
tratamiento(migrana, 'Medicacion especifica, ambiente oscuro y tranquilo.').
tratamiento(resfriado, 'Liquidos calientes, descongestionantes y vitamina C.').
tratamiento(covid, 'Aislamiento, monitoreo de oxigenacion, paracetamol y descanso profundo.').
tratamiento(gastritis, 'Dieta blanda, evitar irritantes, omeprazol y antiacidos.').
tratamiento(neumonia, 'URGENTE: Hospitalizacion, oxigenoterapia y antibioticos segun prescripcion.').
tratamiento(infarto, 'EMERGENCIA: Llamar a ambulancia inmediatamente. No realizar esfuerzos.').

% ==========================================================
% HECHOS: Actividad 6 - Síntomas Contradictorios
% ==========================================================
contradictorio(fiebre, picazon_ojos).
contradictorio(nauseas, estornudos).
contradictorio(perdida_olfato, estornudos).
contradictorio(acidez, dolor_garganta).
contradictorio(sensibilidad_luz, ojos_llorosos).
contradictorio(dificultad_respiratoria, acidez).

% ==========================================================
% PREDICADO DINÁMICO
% ==========================================================
:- dynamic sintoma/2.

reset_paciente(P) :- retractall(sintoma(P,_)).

% Sistema de interacción
pregunta(Paciente, Sintoma) :-
    sintoma(Paciente, Sintoma), !.

pregunta(Paciente, Sintoma) :-
    write('¿El paciente '), write(Paciente),
    write(' tiene '), write(Sintoma), write('? (si/no): '),
    read(Resp),
    ( Resp = si ->
        assertz(sintoma(Paciente, Sintoma))
    ;
        fail
    ).

% ==========================================================
% DIAGNÓSTICOS Y UTILIDADES (Básico, Completo, Exclusivo, Preventivo)
% ==========================================================
diagnostico_basico(Paciente, Enfermedad) :-
    tiene_sintoma(Enfermedad, S),
    pregunta(Paciente, S).

diagnostico_completo(Paciente, Enfermedad) :-
    findall(S, tiene_sintoma(Enfermedad, S), Lista),
    todos_confirmados(Paciente, Lista).

todos_confirmados(_, []).
todos_confirmados(Paciente, [S|R]) :-
    pregunta(Paciente, S),
    todos_confirmados(Paciente, R).

es_exclusivo(Sintoma, Enfermedad) :-
    tiene_sintoma(Enfermedad, Sintoma),
    findall(E, tiene_sintoma(E, Sintoma), Lista),
    length(Lista, 1).

diagnostico_exclusivo(Paciente, Enfermedad) :-
    es_exclusivo(S, Enfermedad),
    pregunta(Paciente, S).

diagnostico_preventivo(Paciente, Enfermedad) :-
    findall(S, tiene_sintoma(Enfermedad, S), Tot), length(Tot, T),
    contar_sintomas_confirmados(Paciente, Enfermedad, C),
    C >= 1, C < T.

contar_sintomas_confirmados(P, E, C) :-
    findall(S, (tiene_sintoma(E,S), sintoma(P,S)), L),
    length(L, C).

% ==========================================================
% ACTIVIDAD 3, 5, 6, 7, 8 (Probabilidad, Similitud, Árbol, Riesgo)
% ==========================================================
probabilidad(Paciente, Enfermedad, P) :-
    findall(S, tiene_sintoma(Enfermedad, S), Tot), length(Tot, T), T > 0,
    findall(S, (tiene_sintoma(Enfermedad, S), sintoma(Paciente, S)), Conf), length(Conf, C),
    P is (C / T) * 100.

diagnostico_probabilistico(Paciente) :-
    writeln('--- Resultados de Probabilidad ---'),
    forall(tiene_sintoma(E, _), (probabilidad(Paciente, E, P), P > 0 -> format('~w: ~2f%~n', [E, P]) ; true)).

enfermedades_similares(E1, E2) :-
    E1 \= E2, findall(S, (tiene_sintoma(E1, S), tiene_sintoma(E2, S)), L),
    length(L, N), N >= 2.

sintomascontradictorios(Paciente) :-
    sintoma(Paciente, S1), sintoma(Paciente, S2),
    (contradictorio(S1, S2) ; contradictorio(S2, S1)),
    format('ALERTA: Sintomas incompatibles: ~w y ~w.~n', [S1, S2]).

arbol_diagnostico(Paciente, Enfermedad) :-
    ( pregunta(Paciente, fiebre) ->
        ( pregunta(Paciente, estornudos) -> Enfermedad = resfriado ;
          ( pregunta(Paciente, perdida_olfato) -> Enfermedad = covid ;
            ( pregunta(Paciente, dolor_pecho) -> Enfermedad = neumonia ; Enfermedad = gripe )))
    ;
        ( pregunta(Paciente, dolor_pecho) -> Enfermedad = infarto ;
          ( pregunta(Paciente, dolor_abdominal) -> Enfermedad = gastritis ;
            ( pregunta(Paciente, estornudos) -> Enfermedad = alergia ;
              ( pregunta(Paciente, dolor_cabeza_severo) -> Enfermedad = migrana ; fail ))))
    ).

riesgo(Paciente, Enfermedad, alto) :- contar_sintomas_confirmados(Paciente, Enfermedad, C), C >= 3, !.
riesgo(Paciente, Enfermedad, medio) :- contar_sintomas_confirmados(Paciente, Enfermedad, C), C = 2, !.
riesgo(Paciente, Enfermedad, bajo) :- contar_sintomas_confirmados(Paciente, Enfermedad, C), C = 1, !.

% ==========================================================
% SEVERIDAD (Base para la Actividad 10)
% ==========================================================
severidad(P, E, 'Severa') :- contar_sintomas_confirmados(P, E, C), C >= 3, !.
severidad(P, E, 'Moderada') :- contar_sintomas_confirmados(P, E, C), C = 2, !.
severidad(P, E, 'Leve') :- contar_sintomas_confirmados(P, E, C), C = 1, !.

% ==========================================================
% ACTIVIDAD 9: TRATAMIENTO COMBINADO
% ==========================================================
tratamiento_combinado(Paciente, Lista) :-
    findall(T, (diagnostico_basico(Paciente, E), tratamiento(E, T)), LB),
    sort(LB, Lista).

% ==========================================================
% ACTIVIDAD 10: RECOMENDACIONES SEGÚN SEVERIDAD
% ==========================================================
recomendacion(Paciente, Enfermedad, Texto) :-
    severidad(Paciente, Enfermedad, Nivel),
    ( Nivel = 'Severa' -> 
        Texto = 'ATENCION: Su estado es critico. Acuda a urgencias o contacte a un especialista de inmediato.'
    ; Nivel = 'Moderada' -> 
        Texto = 'AVISO: Sus sintomas persisten. Se recomienda agendar una cita medica en las proximas 24 horas.'
    ; Nivel = 'Leve' -> 
        Texto = 'SUGERENCIA: Sus sintomas son iniciales. Guarde reposo, monitoree su temperatura y mantengase hidratado.'
    ).

% ==========================================================
% ACTIVIDAD 11: DIAGNOSTICAR Y TRATAR EN UN SOLO PASO
% ==========================================================
% Este predicado integra el diagnóstico jerárquico y el tratamiento único.

diagnosticar_y_tratar(Paciente, Diagnostico, Tratamiento) :-
    arbol_diagnostico(Paciente, Diagnostico),
    tratamiento(Diagnostico, Tratamiento).

% ==========================================================
% ACTIVIDAD 12: REPORTE COMPLETO
% ==========================================================
reporte(Paciente) :-
    % 1. Verificar si hay síntomas registrados
    ( sintoma(Paciente, _) -> 
        true 
    ; 
        writeln('Error: No hay sintomas registrados para este paciente.'), fail
    ),

    writeln('=========================================================='),
    format('        REPORTE MEDICO DEL PACIENTE: ~w~n', [Paciente]),
    writeln('=========================================================='),

    % A. Síntomas confirmados
    writeln('SINTOMAS CONFIRMADOS:'),
    findall(S, sintoma(Paciente, S), ListaS),
    format('  * ~w~n', [ListaS]),
    writeln('----------------------------------------------------------'),

    % B. Diagnóstico Final (Árbol de Decisión)
    ( arbol_diagnostico(Paciente, Final) -> 
        format('DIAGNOSTICO FINAL: ~w~n', [Final]),
        
        % C. Tratamiento
        tratamiento(Final, Trat),
        format('TRATAMIENTO: ~w~n', [Trat]),

        % D. Severidad
        severidad(Paciente, Final, Sev),
        format('SEVERIDAD: ~w~n', [Sev]),

        % E. Recomendación
        recomendacion(Paciente, Final, Rec),
        format('RECOMENDACION: ~w~n', [Rec])
    ; 
        writeln('DIAGNOSTICO FINAL: No se pudo determinar una enfermedad exacta.')
    ),
    writeln('----------------------------------------------------------'),

    % F. Probabilidades y Enfermedades Posibles
    writeln('ANALISIS DE PROBABILIDADES:'),
    forall(tiene_sintoma(E, _), (
        probabilidad(Paciente, E, P),
        P > 0 -> format('  - ~w: ~2f% de coincidencia~n', [E, P]) ; true
    )),
    writeln('==========================================================').