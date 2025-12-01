% =========================================================
%   DECLARACION DE HECHOS
% =========================================================

hombre(ricardo).
hombre(felipe).
hombre(cesar_ricardo).
hombre(cachin).
hombre(eladio).
hombre(jorge_eduardo).
hombre(rodolfo).
hombre(alejo).
hombre(juan_felipe).
hombre(jose_maria).
hombre(antonio).
hombre(giovanni).
hombre(christian).
hombre(cesar).
hombre(emanuel).
hombre(dariel).
hombre(efren).
hombre(jonathan_eduardo).
hombre(jorge_alexander).
hombre(kevin_israel).
hombre(lenin_alejandro).
hombre(erick_daniel).
hombre(jose_maria_jr).
hombre(carlos_miguel).
hombre(david_roberto).
hombre(rodolfo_neri).

mujer(juliana).
mujer(soledad_hilda).
mujer(yasmin).
mujer(guadalupe).
mujer(katia).
mujer(sandra_yedith).
mujer(ana_berenice).
mujer(hilda_gabriela).
mujer(gabriela).
mujer(monica).
mujer(azul_angelica).
mujer(nataly).
mujer(zuri_sherlyn).
mujer(johana).
mujer(luciana).
mujer(karla_yunuen).

% =========================================================
%   PAREJAS
% =========================================================

pareja(ricardo, juliana).
pareja(felipe, soledad_hilda).
pareja(cesar_ricardo, yasmin).
pareja(guadalupe, cachin).
pareja(katia, eladio).
pareja(jorge_eduardo, sandra_yedith).
pareja(ana_berenice, rodolfo).
pareja(hilda_gabriela, alejo).
pareja(juan_felipe, gabriela).
pareja(monica, jose_maria).

es_pareja(A, B) :- pareja(A, B).
es_pareja(A, B) :- pareja(B, A).

% =========================================================
%   HIJOS
% =========================================================

% Hijos de Ricardo y Juliana
hijo(cesar_ricardo, ricardo).
hijo(cesar_ricardo, juliana).
hijo(guadalupe, ricardo).
hijo(guadalupe, juliana).
hijo(katia, ricardo).
hijo(katia, juliana).
hijo(jorge_eduardo, ricardo).
hijo(jorge_eduardo, juliana).

% Hijos de Felipe y Soledad Hilda
hijo(ana_berenice, felipe).
hijo(ana_berenice, soledad_hilda).
hijo(hilda_gabriela, felipe).
hijo(hilda_gabriela, soledad_hilda).
hijo(juan_felipe, felipe).
hijo(juan_felipe, soledad_hilda).
hijo(monica, felipe).
hijo(monica, soledad_hilda).
hijo(sandra_yedith, felipe).
hijo(sandra_yedith, soledad_hilda).

% Hijos de César Ricardo y Yasmin
hijo(cesar, cesar_ricardo).
hijo(cesar, yasmin).
hijo(emanuel, cesar_ricardo).
hijo(emanuel, yasmin).
hijo(dariel, cesar_ricardo).
hijo(dariel, yasmin).

% Hijos de Katia y Eladio
hijo(efren, katia).
hijo(efren, eladio).
hijo(nataly, katia).
hijo(nataly, eladio).

% Hijos de Cachin y Guadalupe
hijo(antonio, cachin).
hijo(antonio, guadalupe).
hijo(giovanni, cachin).
hijo(giovanni, guadalupe).
hijo(christian, cachin).
hijo(christian, guadalupe).

% Hijos de Jorge Eduardo y Sandra Yedith
hijo(zuri_sherlyn, jorge_eduardo).
hijo(zuri_sherlyn, sandra_yedith).
hijo(jonathan_eduardo, jorge_eduardo).
hijo(jonathan_eduardo, sandra_yedith).
hijo(jorge_alexander, jorge_eduardo).
hijo(jorge_alexander, sandra_yedith).

% Hijos de Hilda Gabriela y Alejo
hijo(kevin_israel, hilda_gabriela).
hijo(kevin_israel, alejo).
hijo(lenin_alejandro, hilda_gabriela).
hijo(lenin_alejandro, alejo).

% Hijos de Juan Felipe y Gabriela
hijo(erick_daniel, juan_felipe).
hijo(erick_daniel, gabriela).
hijo(johana, juan_felipe).
hijo(johana, gabriela).
hijo(luciana, juan_felipe).
hijo(luciana, gabriela).

% Hijos de Monica y Jose Maria
hijo(jose_maria_jr, monica).
hijo(jose_maria_jr, jose_maria).
hijo(carlos_miguel, monica).
hijo(carlos_miguel, jose_maria).
hijo(karla_yunuen, monica).
hijo(karla_yunuen, jose_maria).

% Hijos de Rodolfo y Ana Berenice
hijo(david_roberto, rodolfo).
hijo(david_roberto, ana_berenice).
hijo(azul_angelica, rodolfo).
hijo(azul_angelica, ana_berenice).
hijo(rodolfo_neri, rodolfo).
hijo(rodolfo_neri, ana_berenice).

% =========================================================
%   PADRES
% =========================================================

padre(P, H) :- hijo(H, P), hombre(P).
madre(M, H) :- hijo(H, M), mujer(M).

parent(P, H) :- padre(P, H).
parent(P, H) :- madre(P, H).

% =========================================================
%   HERMANOS
% =========================================================

hermanos(A, B) :- padre(P, A), padre(P, B), madre(M, A), madre(M, B), A \= B.

% =========================================================
%   ABUELOS
% =========================================================

abuelo(A, N) :- hombre(A), parent(P, N), parent(A, P).

abuela(A, N) :- mujer(A), parent(P, N), parent(A, P).

% =========================================================
%   TIOS
% =========================================================

% Tíos por sangre
tio(T, S) :- hombre(T), parent(P, S), hermanos(T, P).

% Tíos por matrimonio
tio(T, S) :- hombre(T), parent(P, S), hermanos(H, P), es_pareja(H, T).

% =========================================================
%   TÍAS
% =========================================================

% Tías por sangre
tia(T, S) :- mujer(T), parent(P, S), hermanos(T, P).

% Tías por matrimonio
tia(T, S) :- mujer(T), parent(P, S), hermanos(H, P), es_pareja(H, T).

% =========================================================
%   SOBRINOS
% =========================================================

sobrino(S, T) :- hombre(S), (tio(T, S); tia(T, S)).

sobrina(S, T) :- mujer(S), (tio(T, S); tia(T, S)).

% =========================================================
%   PRIMOS
% =========================================================

primos(A, B) :- parent(P1, A), parent(P2, B),hermanos(P1, P2), A \= B.
