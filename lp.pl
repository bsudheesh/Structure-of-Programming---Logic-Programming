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



