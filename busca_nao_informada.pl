% Grupo: 
% Bruno Ricardo Siqueira 4953672
% Fernando Pereira Lisboa 7656241
% Lucas Macedo De Lemos 6920122
% Marjori Pomarole 7152013
% Rosaldo Alves 6309280
%
% Busca não informada: usando o algoritmo de busca em profundidade.

% aumentando tamanho máximo da pilha para 2GB
:- set_prolog_stack(global,limit(2 000 000 000)).
:- set_prolog_stack(trail, limit(2 000 000 000)).
:- set_prolog_stack(local, limit(2 000 000 000)).

% Cálculo do valor acumulado de pesos
cumulativeWeight([],0).
cumulativeWeight([Head|Tail],TotalSum) :-
    cumulativeWeight(Tail,Sum),
    TotalSum is Head + Sum.
% ------------

% Gerador automatizado de cenários.
generateContainers(Num,Range,Set) :-
	Num = 1,
	randset(1,Range,S),
	append(S,[],Set),!.
generateContainers(N1,Range,Set) :-
	N2 is N1 - 1,
	generateContainers(N2,Range,S1),
	randset(1,Range,S2),
	append(S1,S2,Set).
% ------------

% Busca em profundidade cenário 1: 2 containers de peso 5 e 4,peso máximo
% suportado pelas plataformas 10.
test1(P) :-
	depthFirst1([[],[]],P).
depthFirst1(Head,[Head]) :-
	final1(Head).
depthFirst1(Head,[Head|Tail]) :-
	step1(Head,H1),
	depthFirst1(H1,Tail).
step1(Head,H1) :-
	edgeTest1(Head,H1).

% colocando o primeiro container
edgeTest1([[],[]],[[5],[]]).
edgeTest1([[],[]],[[],[5]]).
edgeTest1([[],[]],[[4],[]]).
edgeTest1([[],[]],[[],[4]]).

% colocando o segundo container
edgeTest1([[5],[]],[[5],[4]]).
edgeTest1([[5],[]],[[5,4],[]]).
edgeTest1([[],[5]],[[4],[5]]).
edgeTest1([[],[5]],[[],[5,4]]).
edgeTest1([[4],[]],[[4],[5]]).
edgeTest1([[4],[]],[[4,5],[]]).
edgeTest1([[],[4]],[[5],[4]]).
edgeTest1([[],[4]],[[],[4,5]]).

final1([[5,4],[]]).
final1([[],[5,4]]).
% ------------