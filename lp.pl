/*

Question 1

There are 3 cases. 
1) If the list is empty, return 0.
2) If the first number is not number, we recursively call the function by adding 0.
3) Else if number, we add the first element and the rest of the list.
*/



sum-up-numbers-simple([],0). //if the list is empty

sum-up-numbers-simple([X|Y], N):- 
	not(number(X)), //if the first element is not a number
	sum-up-numbers-simple(Y, Sum),
	N is 0 + Sum. //we add zero

sum-up-numbers-simple([X|Y], N):- 
	number(X),   //if the first element is a number
	sum-up-numbers-simple(Y, Sum),
	N is X + Sum.   //we add the first element



