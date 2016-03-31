isa(bird, animal).
isa(fish, animal).
isa(ostrich, bird).
isa(penguin, bird).
isa(canary, bird).
isa(robin, bird).
isa(opus, penguin).
isa(tweety, canary).

hasproperty(animal, covering, skin).
hasproperty(fish, travel, swim).
hasproperty(bird, travel, fly).
hasproperty(bird, covering, feathers).
hasproperty(ostrich, travel, walk).
hasproperty(penguin, travel, walk).
hasproperty(penguin, colour, brown).
hasproperty(canary, colour, yellow).
hasproperty(robin, colour, red).
hasproperty(robin, sound, sing).
hasproperty(tweety, colour, white).

whatProperty(Object, Property, Value) :-
	hasproperty(Object, Property, Value).
whatProperty(Object, Property, Value) :-
	isa(Object, Parent),
	whatProperty(Parent, Property, Value).

myunion([H|T], [], [H|T]).
myunion([], [H|T], [H|T]).
myunion([H|T], List_2, X) :-
	member(H, List_2), myunion(T, List_2, X).
myunion([H|T], List_2, [H|X]) :-
	not(member(H, List_2)), myunion(T, List_2, X).

remove_at([H|T], Pos, Element, T):-
	Pos == 0,
	H == Element.
remove_at([H|T], Pos, Element, Y):-
	Pos > 0,
	I is Pos - 1,
	append([H], X, Y),
	remove_at(T, I, Element, X).
