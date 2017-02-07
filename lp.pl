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

Write a predicate sum-up-numbers-general(L, N). L is a list, which may
contain as elements numbers and non-numbers. The predicate is true if N is the sum of all
the numbers (including those in nested lists) in L. If there are no such numbers, the result is
zero.

L N Result
[] 0 True
[100] 100 True
[100,200] 300 True
[a] 0 True
[a,100,b,200,c,300,d] 600 True
[[]] 0 True
[[100]] 100 True
[100,[200]] 300 True
[a,100,b,[200],c,300,d] 600 True
[a,100,[[b,[[200],c]],300,d]] 600 True

*/

sum-up-numbers-general([],0). 

sum-up-numbers-general([X|Y], N):- 
	not(number(X)), 
	sum-up-numbers-general(Y, Sum),
	N is 0 + Sum. 

sum-up-numbers-general([X|Y], N):-
	is_list(X),
	sum-up-numbers-general(X, Sum1),
	sum-up-numbers-general(Y, Sum),
	N is 0 + Sum1 + Sum.

sum-up-numbers-general([X|Y], N):- 
	number(X),  
	sum-up-numbers-general(Y, Sum),
	N is X + Sum.  



