/*
The PADS

Generate the following two result sets:

1.Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

2. There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.

Input Format

COLUMN		TYPE
Name		String
Occupation	String

The OCCUPATIONS table is described as follows:  Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

Sample Input

An OCCUPATIONS table that contains the following records:

Name		Occupation
Samantha	Doctor
Julia		Actor
Maria		Actor
Meera		Singer
Ashely		Professor
Ketty		Professor
Christeen	Professor
Jane		Actor
Jenny 		Doctor
Priya		Singer

Sample Output

Ashely(P)
Christeen(P)
Jane(A)
Jenny(D)
Julia(A)
Ketty(P)
Maria(A)
Meera(S)
Priya(S)
Samantha(D)
There are a total of 2 doctors.
There are a total of 2 singers.
There are a total of 3 actors.
There are a total of 3 professors.
Explanation

The results of the first query are formatted to the problem description's specifications.
The results of the second query are ascendingly ordered first by number of names corresponding to each profession (2 <= 2 <= 3 <= 3), and then alphabetically by profession (Doctor <= singer and actor <= professor ).
*/

/* Create a table called OCCUPATIONS */
CREATE TABLE OCCUPATIONS(
NAME 	VARCHAR(50),
OCCUPATION 	VARCHAR(50));

/*select 'insert into OCCUPATIONS values ('''||Name||''','''||Occupation||''');' from OCCUPATIONS;*/
insert into OCCUPATIONS values ('Ashley','Professor'); 
insert into OCCUPATIONS values ('Samantha','Actor'); 
insert into OCCUPATIONS values ('Julia','Doctor'); 
insert into OCCUPATIONS values ('Britney','Professor'); 
insert into OCCUPATIONS values ('Maria','Professor'); 
insert into OCCUPATIONS values ('Meera','Professor'); 
insert into OCCUPATIONS values ('Priya','Doctor'); 
insert into OCCUPATIONS values ('Priyanka','Professor'); 
insert into OCCUPATIONS values ('Jennifer','Actor'); 
insert into OCCUPATIONS values ('Ketty','Actor'); 
insert into OCCUPATIONS values ('Belvet','Professor'); 
insert into OCCUPATIONS values ('Naomi','Professor'); 
insert into OCCUPATIONS values ('Jane','Singer'); 
insert into OCCUPATIONS values ('Jenny','Singer'); 
insert into OCCUPATIONS values ('Kristeen','Singer'); 
insert into OCCUPATIONS values ('Christeen','Singer'); 
insert into OCCUPATIONS values ('Eve','Actor'); 
insert into OCCUPATIONS values ('Aamina','Doctor'); 


select CONCAT(name,'(',substring(occupation,1,1),')') from OCCUPATIONS order by name;

select CONCAT('There are a total of ', a.pcount, ' ', case when a.pcount > 1 then concat(lower(a.occupation), 's') else lower(a.occupation) end,'.') from (select occupation, count(name) as pcount from OCCUPATIONS group by occupation having count(name) > 0 ) as a order by a.pcount;