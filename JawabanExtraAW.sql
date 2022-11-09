--1. Import ‘stawbucks.sql’ & Use Database ‘stawbucks’!
CREATE DATABASE stawbucks
-->lalu import file sql yg dikasi aslab

--2. Create a table called ‘barista_grades’ with the following criteria :
-->(CREATE TABLE, REGEXP)
CREATE TABLE barista_grades (
	barista_grade_id char(5) CHECK (barista_grade_id REGEXP 'BG[0-9][0-9][0-9]'),
    barista_grade_name varchar(255) NOT NULL
)
-->In Case u fucked up dan lupa bikin primary key
ALTER TABLE barista_grades
ADD PRIMARY KEY (barista_grade_id)

--3. Insert the following values into the newly created barista_grades table.
-->(INSERT INTO)
INSERT INTO barista_grades VALUES ('BG001', 'Junior Barista'), ('BG002', 'Senior Barista'), ('BG003', 'Coffee Master'), ('BG004', 'Shop Manager')

--4. Add a new column on baristas with the following criteria :
-->(ALTER TABLE, FOREIGN KEY, NULL)

ALTER TABLE baristas
ADD barista_grade_id char(5) REFERENCES barista_grades(barista_grade_id)
ON DELETE CASCADE

-->dalam kasus alter table ini, ketika ingin membuat foreign key lgsg reference sadja.

--5. Add a constraint on customers table that validates is_member column must be either ‘Yes’ or ‘No’!
-->(IN)

ALTER TABLE customers ADD CONSTRAINT ck_is_member CHECK(is_member IN('YES', 'NO'))

--6. Update barista_grade_id from baristas to ‘BG001’ for every barista whose *barista_salary is less than 5000000, 
-->then commit the change!
-->****(START TRANSACTION, COMMIT)****

START TRANSACTION;
UPDATE baristas
set barista_grade_id = 'BG001'
WHERE barista_salary < 5000000;
COMMIT;

--7. Delete barista whose barista_address ends with ‘ Street’!
-->(DELETE, REGEXP)

DELETE FROM baristas
WHERE barista_address REGEXP 'Street$'

Street$ --> Artinya berakhir dengan kata street
Street^ --> Artinya berawal dengan kata street

-->8. Display transaction_id, coffee_name, customer_name, Price (obtained from quantity coffee_price 1000/coffee_size_quantity rounded to ---3 place decimal and ‘Rp. ’ added to the start of the price), Transaction Date (obtained from *transaction_date like the following ---format ‘Dec 25, 2022’)* for every coffee whose coffee_strength is above 7.
-->(CONCAT, ROUND, DATE_FORMAT, JOIN)

SELECT th.transaction_id,
co.coffee_name,
cu.customer_name,
CONCAT('Rp. ', ROUND((td.quantity*co.coffee_price*1000 / cs.coffee_size_quantity),3)) AS 'price',
DATE_FORMAT(th.transaction_date, '%b %e %Y')
FROM transaction_headers AS th JOIN transaction_details AS td on th.transaction_id = td.transaction_id
JOIN coffees as co on td.coffee_id = co.coffee_id
JOIN customers as cu on th.customer_id = cu.customer_id
JOIN coffee_sizes as cs on td.coffee_size_id = cs.coffee_size_id
JOIN coffee_types as ct on co.coffee_type_id = ct.coffee_type_id
WHERE ct.coffee_strength > 7

-->9. Display customer_id, First Name (obtained from first name of customer_name in uppercase format), Gender (obtained from first letter of customer_gender) for every customers whose done a transaction on December 25, 2021 and is a member of stawbucks.
-->(SUBSTRING, LEFT, LIKE, UPPER, DAY, MONTH, YEAR)

SELECT cu.customer_id,
UPPER(LEFT(cu.customer_name, LOCATE(' ', cu.customer_name)-1)) AS `first name`,
substring(cu.customer_gender, 1, 1) AS `Gender`,
th.transaction_date
FROM customers as cu JOIN transaction_headers as th on cu.customer_id = th.customer_id
WHERE day('2021-12-25') = day(th.transaction_date) AND MONTH('2021-12-25') = MONTH(th.transaction_date) AND YEAR('2021-12-25') = YEAR(th.transaction_date) AND cu.is_member LIKE '%Yes%'

