/*

Question 1

Write a predicate sum-up-numbers-simple(L, N). L is a list, which may
contain as elements numbers and non-numbers. The predicate is true if N is the sum of the
numbers not in nested lists in L. If there are no such numbers, the result is zero.

[] 0 True
[100,200] 300 True
[a,b,c] 0 True
[100,a] 100 True
[a,100] 100 True
[a,100,b,200,c,300,d] 600 True
[[]] 0 True
[[100]] 0 True
[100,[200]] 100 True
[a,100,b,[200],c,300,d] 400 True
*/



sum-up-numbers-simple([],0).

sum-up-numbers-simple([X|Y], N):-
	number(X),
	sum-up-numbers-simple(Y, SUM),
	N is X + SUM,
	N is 0 + SUM.








