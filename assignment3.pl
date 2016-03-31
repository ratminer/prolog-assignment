class(animal).
class(bird).
class(fish).
class(ostrich).
class(penguin).
class(canary).
class(robin).
class(opus).
class(tweety).

value(fly).
value(skin).
value(feathers).
value(swim).
value(walk).
value(brown).
value(yellow).
value(red).
value(sing).
value(white).

property(cover).
property(travel).
property(colour).
property(sound).

isa(fish, animal).
isa(bird, animal).
isa(robin, bird).
isa(canary, bird).
isa(penguin, bird).
isa(ostrich, bird).
isa(tweety, canary).
isa(opus, penguin).

hasproperty(animal, cover, skin).
hasproperty(bird, cover, feathers).
hasproperty(bird, travel, fly).
hasproperty(ostrich, travel, walk).
hasproperty(penguin, travel, walk).
hasproperty(penguin, colour, brown).
hasproperty(canary, colour, yellow).
hasproperty(tweety, colour, white).
hasproperty(robin, colour, red).
hasproperty(robin, sound, sing).
hasproperty(fish, travel, swim).

whatProperty(X):-
	hasproperty(X, Type, Value),
	display("PropertyType = "), writeln(Type),
	display("PropertyValue = "), writeln(Value),
	writeln("").

whatProperty(X, PropertyType, PropertyValue):-
	hasproperty(X, Type, Value),
	%not(member(Type, PropertyType)),
	%not(member(Value, PropertyValue)),
	writeln(X),
	display("PropertyType = "), writeln([Type|PropertyType]),
	display("PropertyValue = "), writeln([Value|PropertyValue]),
	writeln(""),
	isa(X, Y), whatProperty(Y, [Type|PropertyType], [Value|PropertyValue]).



member(X, [X | _]).
member(X, [_|Tail]) :-
	member(X, Tail).

myunion([H|T], [], [H|T]).
myunion([], [H|T], [H|T]).
myunion([H|T], List_2, X) :-
	member(H, List_2), myunion(T, List_2, X).
myunion([H|T], List_2, [H|X]) :-
	not(member(H, List_2)), myunion(T, List_2, X).

del(X, [X|Tail], Tail).
del(X, [Y|Tail], [Y|Tail1]):-
	del(X, Tail, Tail1).

indexOf([Element|_], Element, 0).
indexOf([_|Tail], Element, Index):-
	indexOf(Tail, Element, Index1),
	Index is Index1 + 1.

remove_at([H|T], Pos, H, T):-
	Pos == 0.
%remove_at([H|T], Pos, Element, X):-
