

P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* * * * * 
* * * * 
* * * 
* * 
*
Write a query to print the pattern P(20).


SELECT REPLICATE('* ', ones.n + 10*tens.n) FROM (VALUES(0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) ones(n), (VALUES(0),(1),(2),(3),(4),(5) ) tens(n) WHERE ones.n + 10*tens.n BETWEEN 1 AND 20 ORDER BY ones.n + 10*tens.n DESC;


(No column name)
* * * * * * * * * * * * * * * * * * * * 
* * * * * * * * * * * * * * * * * * * 
* * * * * * * * * * * * * * * * * * 
* * * * * * * * * * * * * * * * * 
* * * * * * * * * * * * * * * * 
* * * * * * * * * * * * * * * 
* * * * * * * * * * * * * * 
* * * * * * * * * * * * * 
* * * * * * * * * * * * 
* * * * * * * * * * * 
* * * * * * * * * * 
* * * * * * * * * 
* * * * * * * * 
* * * * * * * 
* * * * * * 
* * * * * 
* * * * 
* * * 
* * 
* 

