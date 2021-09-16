##20 Quaries:

1. select a.cname,c.balance from customer a join haschecking b join account c on a.cid = b.c_id and c.accno = b.acc_no;

2. select a.cname as customerName,c.ename as employeeName from customer a join workswith b join employee c on a.cid = b.c_id and c.eid = b.e_id;

3. select a.ename as employeeName,c.bname as branchName from employee a join worksat b join branch c on a.eid = b.e_id and c.bid = b.b_id;

4. select a.cname,d.bname from customer a join haschecking b join ownedby c join branch d on a.cid = b.c_id and b.acc_no = c.acc_no and c.b_id = d.bid;

5. select a.cname,c.loanamt from customer a join borrows b join loan c on a.cid = b.c_id and b.loan_no = c.loanno;

6. select a.cname,c.date from customer a join borrows b join payment c on a.cid = b.c_id and b.loan_no = c.loan_no;

7. select a.cname,c.amt from customer a join borrows b join payment c on a.cid = b.c_id and b.loan_no = c.loan_no;

8. select a.cname,d.bname from customer a join borrows b join loan c join branch d on a.cid = b.c_id and b.loan_no = c.loanno and c.b_id = d.bid;

9. select a.bname,count(b.acc_no) from branch a join ownedby b on a.bid = b.bid group by a.bname;

10. select a.bname,count(b.e_id) as no_of_employees from branch a join worksat b on a.bid = b.b_id group by a.bname;

11. select a.cname, c.balance from customer a join haschecking b join account c on a.cid = b.c_id and b.acc_no = c.accno where c.balance = (select max(balance) from account);

12. select a.cname from customer a where not exists(select * from borrows b where a.cid = b.c_id);

13. select a.cname from customer a where a.cid in( select c_id from borrows);

14. select bname from branch where basset > some (select basset from branch where bcity = 'Garsangi');

15. select max(total_bal) as largest_total from (select a.bname, sum(c.balance) as total_bal from branch a join ownedby b join account c on c.accno = b.acc_no and b.b_id = a.bid group by a.bname) as totals (bname, total_bal);

16. select a.bname, b.loanamt from branch a join loan b on a.bid = b.b_id where b.loanamt = (select max(loanamt) from loan);

17. select title as Designations, count(ename) as no_of_employees from employee group by title;

18. select a.b_id from loan a where a.loanno in (select b.loan_no from payment b join loan a on a.loanno = b.loan_no and date > 2020-01-01);

19. select a.ename from employee a where title = 'Cashier' and a.eid in (select b.e_id from worksat b join branch c on b.b_id = c.bid where c.bid in (select bid from branch where bcity = 'Kamatagi'));

20. select eid, ename from employee where eid in (select e_id from worksat where b_id = (select b_id from worksat where e_id = (select eid from employee where ename = 'Avantas Ghosal')));

##Views:

1.
DROP view IF EXISTS ce;
CREATE view ce as SELECT a.cname,c.ename,c.title,c.telno FROM customer a join workswith b join employee c on a.cid = b.c_id and b.e_id = c.eid;

2.
DROP view IF EXISTS rich;
CREATE view rich as SELECT c.accno,a.cname,a.ccity,c.balance FROM customer a join haschecking b join account c on c.accno = b.acc_no and a.cid = b.c_id WHERE c.balance > 50000;

3.
DROP view IF EXISTS cb;
create view cb as select a.cname,a.ccity,d.name,d.bcity from customer a join haschecking b join ownedby c join branch d on a.cid = b.c_id and b.acc_no = c.acc_no and c.b_id = d.bid;

4.
DROP view IF EXISTS b_avg;
create view b_avg as select a.bname,avg(c.balance) from branch a join ownedby b join account c on a.bid = b.b_id and c.accno = b.acc_no group by a.bname;

5.
DROP view IF EXISTS remain;
create view remain as select a.cname,b.loanno,b.loanamt as total_loan,(b.loanamt-d.amt) as remaining_amount from customer a join loan b join borrows c join payment d on a.cid = c.c_id and c.loan_no = b.loanno and c.loan_no = d.loan_no;

##Storage Functions:

1.
DROP FUNCTION IF EXISTS GetCustomerLevel;
DELIMITER //
CREATE FUNCTION GetCustomerLevel(acc_no INT) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
DECLARE credit DECIMAL(10,2) DEFAULT 0;
DECLARE lvl VARCHAR(20);
SELECT balance INTO credit FROM account WHERE accno = acc_no;
IF credit > 0 and credit <= 300000.00 THEN SET lvl = 'IRON';
END IF;
IF credit > 300000.00 and credit <= 600000.00 THEN SET lvl = 'SILVER';
END IF;
IF credit > 600000.00 and credit <= 900000.00 THEN SET lvl = 'GOLD';
END IF;
IF credit > 900000.00 THEN SET lvl = 'PLATINUM';
END IF;
RETURN(lvl);
END //
DELIMITER ;

select accno,GetCustomerLevel(accno) from account;

2.
DROP FUNCTION IF EXISTS SP_ACCOUNT_EXISTS;
DELIMITER $$
CREATE FUNCTION SP_ACCOUNT_EXISTS( acc_no INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
DECLARE temp INT default 0;
DECLARE STATE VARCHAR(100);
SELECT count(accno) INTO temp FROM account WHERE accno = acc_no;
IF temp = 1 THEN SET state = "Account present";
END IF;
IF temp = 0 THEN SET state = "No Account Present";
END IF;
RETURN(state);
END$$
DELIMITER ;


select accno,SP_ACCOUNT_EXISTS(accno) from account;

3.
DROP FUNCTION IF EXISTS balance_check;
DELIMITER $$
CREATE FUNCTION balance_check(acc_no INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE balance DECIMAL(10,2);
SELECT c.balance INTO balance from customer a join haschecking b join account c on a.cid = b.c_id and c.accno = b.acc_no WHERE c.accno = acc_no;
RETURN(balance);
END$$
DELIMITER ;


select accno,balance_check(accno) from account;

4.
DROP FUNCTION IF EXISTS emp_count;
DELIMITER $$
CREATE FUNCTION emp_count(b_name VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE countt INT;
SELECT count(b.e_id) INTO countt from branch a join worksat b on a.bid = b.b_id WHERE a.bname = b_name group by a.bname;
RETURN(countt);
END$$
DELIMITER ;


select bname,emp_count(bname) from branch;

5.
DROP FUNCTION IF EXISTS emp_search;
DELIMITER $$
CREATE FUNCTION emp_search(designation VARCHAR(100),branch VARCHAR(100))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
DECLARE name VARCHAR(100);
SELECT a.ename INTO name from employee a where a.title = designation and a.eid in (SELECT b.e_id from worksat b join branch c on b.b_id = c.bid where c.bid in (SELECT bid from branch where bcity = branch));
RETURN(name);
END$$
DELIMITER ;

select a.title,c.bcity,emp_search(a.title,c.bcity) from employee a join worksat b join branch c on a.eid = b.e_id and c.bid = b.b_id;

##Storage Procedures:

DROP TABLE IF EXISTS transaction_history;
CREATE TABLE transaction_history (acc_no INT, amt_deposited INT, amt_withdrew INT);

1.
DROP PROCEDURE IF EXISTS WITHDRAW;
DELIMITER //
CREATE PROCEDURE WITHDRAW(IN
gaccno INT,
withdrew_amt INT)
BEGIN
	UPDATE account
	SET balance = balance-withdrew_amt
	WHERE accno = gaccno;
INSERT INTO transaction_history (acc_no, amt_deposited, amt_withdrew)
VALUES (gaccno,0, withdrew_amt);
SELECT * FROM transaction_history WHERE acc_no = gaccno;
END//
DELIMITER ;

CALL WITHDRAW(2002,75000);

2.
DROP PROCEDURE IF EXISTS DEPOSIT;
DELIMITER //
CREATE PROCEDURE DEPOSIT(IN
gaccno INT,
deposit_amt INT)
BEGIN
	UPDATE account
	SET balance = balance + deposit_amt 
	WHERE accno = gaccno;
INSERT INTO transaction_history (acc_no, amt_deposited, amt_withdrew)
VALUES (gaccno, deposit_amt, 0);
SELECT * FROM transaction_history WHERE acc_no = gaccno;
END//
DELIMITER ;

CALL DEPOSIT(2004,25000);

3.
DROP PROCEDURE IF EXISTS NEW_ACC;
DELIMITER //
CREATE PROCEDURE NEW_ACC(IN
gaccno INT,
initial_deposit INT,
customer INT,
branch INT)
BEGIN
INSERT INTO account (accno, balance) VALUES (gaccno, initial_deposit);
INSERT INTO haschecking (acc_no, c_id) VALUES (gaccno, customer);
INSERT INTO ownedby (acc_no, b_id) VALUES (gaccno, branch);
END//
DELIMITER ;

CALL NEW_ACC(2011,50000,7,5);

4.
DROP PROCEDURE IF EXISTS NEW_CUSTOMER;
DELIMITER //
CREATE PROCEDURE NEW_CUSTOMER(IN
custno INT,
name VARCHAR(20),
city VARCHAR(20),
empno INT)
BEGIN
INSERT INTO customer (cid, cname, ccity) VALUES (custno, name, city);
INSERT INTO workswith(c_id, e_id) VALUES (custno , empno);
END//
DELIMITER ;

CALL NEW_CUSTOMER(11,"Arya Chopda","Raipur",11);

5.
DROP PROCEDURE IF EXISTS NEW_EMPLOYEE;
DELIMITER //
CREATE PROCEDURE NEW_EMPLOYEE(IN
empno INT,
name VARCHAR(20),
position VARCHAR(20),
telph INT,
branch INT)
BEGIN
INSERT INTO employee (eid, ename, title, telno) VALUES (empno, name, position, telph);
INSERT INTO worksat (e_id, b_id) VALUES (empno, branch);
END//
DELIMITER ;


CALL NEW_EMPLOYEE(16,"Harush Kengal","Cashier",623812,3);

##Triggers:

1. 
DROP TRIGGER IF EXISTS c_trigger;
DELIMITER //
CREATE TRIGGER c_trigger
AFTER INSERT ON transaction_history
FOR EACH ROW
BEGIN
	UPDATE account SET balance = balance - amt_withdrew*0.015 where new.acc_no=accno; 
END//

DELIMITER ;

2.
DROP TRIGGER IF EXISTS d_trigger;
DELIMITER //
CREATE TRIGGER d_trigger
AFTER INSERT ON transaction_history
FOR EACH ROW
BEGIN
	UPDATE account SET balance = balance + amt_deposited where new.acc_no=accno; 
END//

DELIMITER ;

3.
DROP TRIGGER IF EXISTS a_trigger;
DELIMITER //
CREATE TRIGGER a_trigger
BEFORE DELETE ON transaction_history
FOR EACH ROW
BEGIN
INSERT INTO transaction_history_archive (acc_no, amt_deposited, amt_withdrew)
    SELECT old.acc_no, old.amt_deposited, old.amt_withdrew;
END//
DELIMITER ;