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

Write a predicate min-above-min(L1, L2, N). L1 and L2 are both simple
lists, which do not contain nested lists. Both lists may have non-numeric elements. The
predicate is true if N is the minimum of the numbers in L1 that are larger than the smallest
number in L2. If there is no number in L2, all the numbers in L1 should be used to calculate
the minimum. If there is no number in L1 larger than the smallest number in L2, the
predicate is false.

Test cases:
L1 L2 N Result
[] [a,100,b,200,c,300,d] 100 False
[100] [] 100 True
[a,200,b,100,c,300,d] [] 100 True
[a] [] 100 False
[a] [a,200,b,300,c,100,d] 100 False
[a,b,c] [a,200,b,300,c,100,d] 100 False
[a,200] [a,200,b,300,c,100,d] 200 True
[a,100] [a,200,b,300,c,100,d] 100 False
[100,200,300] [300,100,200] 200 True
[a,300,b,100,c,200,d] [a,200,b,300,c,100,d] 200 True

*/



get-min-function([], []).


get-min-function([X|Y], M):-
	number(X),
	get-min-function(Y, Min),
	M is X < Min.



