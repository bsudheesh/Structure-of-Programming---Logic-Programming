/*

Question 1

There are 3 cases. 
1) If the list is empty, return 0.
2) If the first number is not number, we recursively call the function by adding 0.
3) Else if number, we add the first element and the rest of the list.
*/



sum-up-numbers-simple([],0). %if the list is empty

sum-up-numbers-simple([X|Y], N):- 
	not(number(X)), %if the first element is not a number
	sum-up-numbers-simple(Y, Sum),
	N is 0 + Sum. %we add zero

sum-up-numbers-simple([X|Y], N):- 
	number(X),   %if the first element is a number
	sum-up-numbers-simple(Y, Sum),
	N is X + Sum.   %we add the first element



/*
Question 2

There are 4 cases.
1) If the list is empty, return 0.
2) If the first element is not a number or a list, we add zero and call the function recursively.
3) If the first element is a list, we recursively call the function with the first element of the list
and then we do the same for the other element. We add the two sum obtained.
4) Else if number, we add the first element and the rest of the list.

*/

sum-up-numbers-general([],0). %if the list is empty

sum-up-numbers-general([X|Y], N):- 
	not(number(X)),  %if not number or a list
	sum-up-numbers-general(Y, Sum), 
	N is 0 + Sum. %add zero and call the function again

sum-up-numbers-general([X|Y], N):-
	is_list(X),   %if list
	sum-up-numbers-general(X, Sum1),  %call the function with the first element
	sum-up-numbers-general(Y, Sum),   %we call the function with the first element removed
	N is 0 + Sum1 + Sum.   %we add the sum of the first element and the remamining element

sum-up-numbers-general([X|Y], N):- 
	number(X),   %if number
	sum-up-numbers-general(Y, Sum),
	N is X + Sum.  %we add the first element


/*
Question 3

The idea here is to have a helper function that gives the min of a list.
If the list is empty, the function returns null, if no numberic value, a symbol is returned.
We then have a function that returns a list with all numbers. The function is number-list.
min-above-min-helper-function returns a list with all numbers less than the min element in L2.
min-above-min returns the min value that the function min-above-min-helper-function returns.


*/





get-min-function([X], X). %base case

get-min-function([X|Y], M):-
	not(number(X)),  %if first element not number
	get-min-function(Y, M).   %we recursively call the function

get-min-function([X,Y|Z], M):-
	not(number(Y)),  %if second element is not number
	get-min-function([X|Z], M).   %we recursively call the function

get-min-function([X,Y|Z], M):-
	number(X),
	number(Y),
	X =< Y,  %if first and second number are numbers, and first element is less than or equal to second
	get-min-function([X|Z], M).   %remove second element and call the function

get-min-function([X,Y|Z], M):-
	number(X),
	number(Y),
	X > Y,    %if first and second number are numbers, and first element is less than or equal to second
	get-min-function([Y|Z], M).   %removes first element and call the function

min-above-min(L1, _, N):- %handles case when there is no number in list L1
	get-min-function(L1, M1),
	not(number(M1)),
	get-min-function(L1,N).

min-above-min(L1, _, N):-  %handles case when the list1 is empty
	length(L1,0),
	get-min-function(L1,N).

min-above-min(L1, L2, N):-   %handles case when the list2 is empty
	length(L2,0),
	get-min-function(L1, N).

min-above-min(L1, L2, N):-    %handles case if there is no number in list l2.
	get-min-function(L2, M2),
	not(number(M2)),
	get-min-function(L1,N).   %returns the min element of L1.



number-list([],[]).   %base case. Function that adds only numeric values to list

number-list(L, Lists) :- %handles case when the first element is not number
	[X | Y] = L,
	not(number(X)),
	number-list(Y, Lists).

number-list([X | Y], [X | Lists]):- %handles case when first element is number-list
	%[X|Lists] adds the X to lists.
	number(X),
	number-list(Y, Lists).

min-above-min(L1, L2, N):-
	/*
		1. Get all numeric value in list 1.
		2. Get the minimum value in list 2.
		3. Store all values greater than min of L2 in list Z.
		4. return min of Z.
	*/
	number-list(L1, List1),
	get-min-function(L2, M2),
	min-above-min-helper-function(List1, M2, Z),
	get-min-function(Z, N).

min-above-min-helper-function([],_,[]). %Base case. Adds values less than min of L2 to a list.

min-above-min-helper-function(L, M2, Z):- %if number in L1 is less than min of L2.
	[X | Y] = L,
	X =< M2,
	min-above-min-helper-function(Y, M2, Z).

min-above-min-helper-function([X | Y], M2, [X | Z]):-  %if L1 is greater than min of L2.
	%adds X to Z -> [X|Z]
	min-above-min-helper-function(Y, M2, Z).


/*
	Question4.
	The main idea here is
	1) Make nested list into a simple list. make-nested-list-simple does that
	2) Next, send the simple list of l1 and l2 to common-unique-elements-helper-function.
	3) common-unique-elements-helper-function uses member function to see if the first element 
	   of L1 is a member of L2. If yes, append it to a new list and the new list with N.
*/

common-unique-elements([],_,[]).


make-nested-list-simple([],[]).

%makes nested list simple: condition, the first element of L1 is a list
make-nested-list-simple(L, Lists):-
	[X1 | Y1] = L,
	is_list(X1),
	make-nested-list-simple(X1, Lists2), %make list2 having the elements from the first list
	make-nested-list-simple(Y1, Lists1),  %make list1 having the elements from the remamining part.
	append(Lists2,Lists1, Lists). %append both lists2 and list1.


%makes nested list simple: condition, the first element of L1 is not a list.
make-nested-list-simple(L, Lists):-
	[X1 | Y1] = L,
	not(is_list(X1)),
	make-nested-list-simple(Y1, Lists1),
	append([X1], Lists1, Lists).  %add the element to Lists
	

common-unique-elements([],_,[]).
common-unique-elements-helper-function([],_,[]).

common-unique-elements(L1, L2, N):- %makes list1 and list2 simple and then calls the helper function.
	make-nested-list-simple(L1, Lists1),
	make-nested-list-simple(L2, Lists2),
	common-unique-elements-helper-function(Lists1, Lists2, N).


%if the first element of L1 is a member of L1, we add it to X1 and call function again.
common-unique-elements-helper-function(Lists1, Lists2, N):-
	[X1 | Y1] = Lists1,
	member(X1, Lists2),
	common-unique-elements-helper-function(Y1, Lists2, N1),
	append([X1], N1, N ).

%if not a member of L1, we call the function again.
common-unique-elements-helper-function(Lists1, Lists2, N):-
	[X1 | Y1] = Lists1,
	not(member(X1, Lists2)),
	common-unique-elements-helper-function(Y1, Lists2, N).














