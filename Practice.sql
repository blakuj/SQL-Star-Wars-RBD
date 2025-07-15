alter session set nls_date_format = 'DD-MM-YYYY';

-- tables
-- Table: T_Category
CREATE TABLE T_Category (
    Id integer  NOT NULL,
    Name varchar2(50)  NOT NULL,
    CONSTRAINT T_Category_pk PRIMARY KEY (Id)
) ;

-- Table: T_Employee
CREATE TABLE T_Employee (
    Id integer  NOT NULL,
    Salary number(8,2)  NOT NULL,
    Boss integer  NULL,
    CONSTRAINT T_Employee_pk PRIMARY KEY (Id)
) ;

-- Table: T_Job
CREATE TABLE T_Job (
    Id integer  NOT NULL,
    Name varchar2(40)  NOT NULL,
    CONSTRAINT T_Job_pk PRIMARY KEY (Id)
) ;

-- Table: T_JobHistory
CREATE TABLE T_JobHistory (
    Job integer  NOT NULL,
    Employee integer  NOT NULL,
    "From" date  NOT NULL,
    "To" date  NULL,
    CONSTRAINT T_JobHistory_pk PRIMARY KEY (Job,Employee,"From")
) ;

-- Table: T_Person
CREATE TABLE T_Person (
    Id integer  NOT NULL,
    Name varchar2(50)  NOT NULL,
    Surname varchar2(50)  NOT NULL,
    CONSTRAINT T_Person_pk PRIMARY KEY (Id)
) ;

-- Table: T_Product
CREATE TABLE T_Product (
    Id integer  NOT NULL,
    Name varchar2(50)  NOT NULL,
    Price number(8,2)  NOT NULL,
    Category integer  NOT NULL,
    CONSTRAINT T_Product_pk PRIMARY KEY (Id)
) ;

-- Table: T_ProductList
CREATE TABLE T_ProductList (
    Purchase integer  NOT NULL,
    Product integer  NOT NULL,
    Quantity integer  NOT NULL,
    CONSTRAINT T_ProductList_pk PRIMARY KEY (Purchase,Product)
) ;

-- Table: T_Purchase
CREATE TABLE T_Purchase (
    Id integer  NOT NULL,
    "Date" date  NOT NULL,
    Customer integer  NOT NULL,
    CONSTRAINT T_Purchase_pk PRIMARY KEY (Id)
) ;

-- foreign keys
-- Reference: Employee_Employee (table: T_Employee)
ALTER TABLE T_Employee ADD CONSTRAINT Employee_Employee
    FOREIGN KEY (Boss)
    REFERENCES T_Employee (Id);

-- Reference: Employee_Person (table: T_Employee)
ALTER TABLE T_Employee ADD CONSTRAINT Employee_Person
    FOREIGN KEY (Id)
    REFERENCES T_Person (Id);

-- Reference: List_of_products_Product (table: T_ProductList)
ALTER TABLE T_ProductList ADD CONSTRAINT List_of_products_Product
    FOREIGN KEY (Product)
    REFERENCES T_Product (Id);

-- Reference: List_of_products_Purchase (table: T_ProductList)
ALTER TABLE T_ProductList ADD CONSTRAINT List_of_products_Purchase
    FOREIGN KEY (Purchase)
    REFERENCES T_Purchase (Id);

-- Reference: Product_Category (table: T_Product)
ALTER TABLE T_Product ADD CONSTRAINT Product_Category
    FOREIGN KEY (Category)
    REFERENCES T_Category (Id);

-- Reference: Purchase_Person (table: T_Purchase)
ALTER TABLE T_Purchase ADD CONSTRAINT Purchase_Person
    FOREIGN KEY (Customer)
    REFERENCES T_Person (Id);

-- Reference: T_JobHistory_T_Employee (table: T_JobHistory)
ALTER TABLE T_JobHistory ADD CONSTRAINT T_JobHistory_T_Employee
    FOREIGN KEY (Employee)
    REFERENCES T_Employee (Id);

-- Reference: T_JobHistory_T_Job (table: T_JobHistory)
ALTER TABLE T_JobHistory ADD CONSTRAINT T_JobHistory_T_Job
    FOREIGN KEY (Job)
    REFERENCES T_Job (Id);

--Person values
INSERT ALL
    INTO T_PERSON (ID, Name, Surname) VALUES (1, 'Ben', 'Cimon')
    INTO T_PERSON (ID, Name, Surname) VALUES (2, 'Nick', 'Nicias')
    INTO T_PERSON (ID, Name, Surname) VALUES (3, 'Peter', 'Paches')
    INTO T_PERSON (ID, Name, Surname) VALUES (4, 'Philip', 'Phormio')
    INTO T_PERSON (ID, Name, Surname) VALUES (5, 'Chris', 'Cnemus')
    INTO T_PERSON (ID, Name, Surname) VALUES (6, 'Eric', 'Eurymedon')
SELECT 1 FROM dual;

--Employee values
INSERT ALL
    INTO T_EMPLOYEE (ID, Salary, Boss) VALUES (1, 9888.65, null)
    INTO T_EMPLOYEE (ID, Salary, Boss) VALUES (3, 3225.34, 1)
    INTO T_EMPLOYEE (ID, Salary, Boss) VALUES (4, 2775.75, 1)
    INTO T_EMPLOYEE (ID, Salary, Boss) VALUES (6, 4566.91, 1)
SELECT 1 FROM dual;

--Job values
INSERT ALL
    INTO T_JOB (Id, Name) VALUES (1, 'manager')
    INTO T_JOB (Id, Name) VALUES (2, 'cashier')
    INTO T_JOB (Id, Name) VALUES (3, 'janitor')
SELECT 1 FROM dual;

--JobHistory values
INSERT ALL
    INTO T_JOBHISTORY (Job, Employee, "From", "To") VALUES (2, 1, '11-12-2018', '01-04-2020')
    INTO T_JOBHISTORY (Job, Employee, "From", "To") VALUES (1, 1, '01-04-2020', null)
    INTO T_JOBHISTORY (Job, Employee, "From", "To") VALUES (2, 3, '04-04-2022', null)
    INTO T_JOBHISTORY (Job, Employee, "From", "To") VALUES (3, 4, '13-09-2021', null)
    INTO T_JOBHISTORY (Job, Employee, "From", "To") VALUES (2, 6, '01-04-2020', '04-04-2022')
SELECT 1 FROM dual;

--Category values
INSERT ALL
    INTO T_Category (Id, Name) VALUES (1, 'fish')
    INTO T_Category (Id, Name) VALUES (2, 'vegetable')
    INTO T_Category (Id, Name) VALUES (3, 'fruit')
SELECT 1 FROM dual;

--Product values
INSERT ALL
    INTO T_Product (Id, Name, Price, Category) VALUES(1, 'cod', 2.20, 1)
    INTO T_Product (Id, Name, Price, Category) VALUES(2, 'herring', 2.75, 1)
    INTO T_Product (Id, Name, Price, Category) VALUES(3, 'garlic', 0.99, 2)
    INTO T_Product (Id, Name, Price, Category) VALUES(4, 'potato', 0.15, 2)
    INTO T_Product (Id, Name, Price, Category) VALUES(5, 'kiwi', 1.15, 3)
    INTO T_Product (Id, Name, Price, Category) VALUES(6, 'mango', 0.99, 3)
SELECT 1 FROM dual;

--Purchase values
INSERT ALL
    INTO T_PURCHASE (Id, "Date", Customer) VALUES (1, '04-05-2020', 5)
    INTO T_PURCHASE (Id, "Date", Customer) VALUES (2, '14-09-2021', 5)
    INTO T_PURCHASE (Id, "Date", Customer) VALUES (3, '19-11-2021', 5)
    INTO T_PURCHASE (Id, "Date", Customer) VALUES (4, '11-01-2020', 1)
    INTO T_PURCHASE (Id, "Date", Customer) VALUES (5, '09-12-2020', 1)
    INTO T_PURCHASE (Id, "Date", Customer) VALUES (6, '11-12-2019', 1)
    INTO T_PURCHASE (Id, "Date", Customer) VALUES (7, '07-03-2018', 1)
    INTO T_PURCHASE (Id, "Date", Customer) VALUES (8, '01-05-2020', 4)
    INTO T_PURCHASE (Id, "Date", Customer) VALUES (9, '17-11-2020', 4)
    INTO T_PURCHASE (Id, "Date", Customer) VALUES (10, '23-12-2021', 3)
    INTO T_PURCHASE (Id, "Date", Customer) VALUES (11, '13-08-2022', 3)
SELECT 1 FROM dual;

--ProductList values
INSERT ALL
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (1, 1, 3)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (2, 4, 15)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (2, 1, 4)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (3, 5, 2)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (3, 1, 12)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (4, 3, 5)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (4, 1, 3)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (4, 2, 11)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (5, 2, 13)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (5, 5, 4)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (5, 6, 13)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (6, 3, 12)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (6, 5, 3)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (7, 4, 2)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (7, 5, 13)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (8, 1, 11)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (8, 2, 3)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (9, 3, 13)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (9, 6, 5)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (10, 5, 14)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (10, 4, 100)
    INTO T_PRODUCTLIST (Purchase, Product, Quantity) VALUES (11, 4, 57)
SELECT 1 FROM dual;

commit;
















--zad1
--Znajdź wszystkie osoby których nazwiska nie zaczynają się od 'C' lub 'P'.
select Name || ' ' || SURNAME as PERSON
from T_PERSON
WHERE SURNAME not LIKE 'C%' and (surname not like 'P%');


--zad2
--Wypisz wszystkie produkty wraz z ich ilością i kategorią z
-- paragonu o ID == 4. Posortuj malejąco po ilości (quantity).
SELECT
    P.Name AS Product_Name,
    PL.Quantity,
    C.Name AS Category_Name
FROM
    T_Product P
    JOIN T_ProductList PL ON P.Id = PL.Product
    JOIN T_Purchase PU ON PL.Purchase = PU.Id
    JOIN T_Category C ON P.Category = C.Id
WHERE
    PU.Id = 4
ORDER BY
    PL.Quantity DESC;


--zad3 Wypisz wszystkich aktualnie zatrudnionych pracowników, ich aktualne stanowiska
-- oraz datę od kiedy pracują na tym stanowisku. Posortuj rosnąco po dacie.
select TP.NAME || ' ' || TP.SURNAME as EMPLOYEE,TJ.NAME,"From"
from T_JOBHISTORY join T_JOB TJ on T_JOBHISTORY.JOB = TJ.ID
join T_EMPLOYEE TE on T_JOBHISTORY.EMPLOYEE = TE.ID
join T_PERSON TP on TE.ID = TP.ID
where "To" is null
order by "From" asc;





--ZAD4
--Wypisz imiona i nazwiska wszystkich pracowników aktualnie zatrudnionych
-- (nazwij kolumnę "Employee") + nazwisko ich szefa (nazwij kolumnę "Boss").
-- Jeśli ktoś nie ma szefa to wypisz "No boss" w kolumnie "Boss". Podpowiedź: użyj UNION.
select TP.NAME || ' ' || TP.SURNAME as EMPLOYEE, 'No boss'
from T_JOBHISTORY join T_EMPLOYEE TE on T_JOBHISTORY.EMPLOYEE = TE.ID
join T_PERSON TP on TE.ID = TP.ID
where "To" is null and BOSS is null
UNION
select Person.NAME || ' ' || Person.SURNAME as EMPLOYEE, BOSS.SURNAME
from T_PERSON Person join T_EMPLOYEE Employee on Person.ID = Employee.ID
join T_PERSON BOSS on  Employee.boss = BOSS.ID
join T_JOBHISTORY on T_JOBHISTORY.EMPLOYEE = Employee.ID
where "To" is null;

--ZAD5
--Oblicz na ilu paragonach (T_Purchase) widnieją produkty z kategorii 'fruit'.
-- Wypisz nazwę produktu + ilość paragonów na których dany produkt widnieje.
select Produkt.NAME as OWOC, count(Distinct ProduktLista.PURCHASE) as Quantity
from T_PRODUCT Produkt join T_PRODUCTLIST ProduktLista on Produkt.ID = ProduktLista.PRODUCT
join T_PURCHASE Zakup on ProduktLista.PURCHASE = Zakup.ID
join T_CATEGORY Kategoria on Produkt.CATEGORY = Kategoria.ID
where Kategoria.NAME = 'fruit'
group by Produkt.NAME;

--ZAD6
--Oblicz ile zakupów zrobił każdy z klientów w 2020 i 2021 roku.
SELECT
    TP.Name,
    COUNT(TPUR."Date") AS LICZBA_TRANSAKCJI
FROM
    T_PERSON TP
    JOIN T_PURCHASE TPUR ON TP.Id = TPUR.CUSTOMER
WHERE
    EXTRACT(YEAR FROM TPUR."Date") IN (2020, 2021)
GROUP BY TP.Name;

--ZAD7
--Wypisz imiona i nazwiska klientów którzy kupili więcej niż 20 ryb.
SELECT
    TP.Name,
    TP.Surname
FROM
    T_PERSON TP
    JOIN T_PURCHASE TPUR ON TP.Id = TPUR.CUSTOMER
    JOIN T_PRODUCTLIST PL ON TPUR.ID = PL.Purchase
    JOIN T_PRODUCT PR ON  PL.PRODUCT = PR.ID
    JOIN T_CATEGORY TC on PR.CATEGORY = TC.ID
WHERE
    TC.NAME LIKE 'fish'
GROUP BY
    TP.Name,
    TP.Surname
HAVING SUM(PL.QUANTITY) > 20;

;



--ZAD8
--Wypisz wszystkie produkty wraz z ich ilością i kategorią które kupił szef Peter-a Paches-a
-- (we wszystkich swoich zakupach). Posortuj po ilości rosnąco.
SELECT Product.name AS Product, SUM(Productlist.quantity) AS Quantity, Category.name AS Category
FROM
    T_Purchase Purchase
    JOIN T_ProductList Productlist ON Purchase.id = ProductList.Purchase
    JOIN T_Product Product ON Productlist.product = Product.id
    JOIN T_Category Category ON Category.id = Product.category
WHERE
    Customer = (SELECT Employee.boss
            FROM T_Employee Employee JOIN T_Person Person ON Employee.id = Person.id
            WHERE Person.name = 'Peter' AND Person.surname = 'Paches')
GROUP BY Product.name, Category.name
ORDER BY 2 ASC;



--ZAD9
--Wypisz wszystkie produkty jakie kupił Chris Cnemus i
-- ile łącznie wydał na każdy z tych produktów (we wszystkich zakupach).
SELECT Product.name AS Product, SUM(quantity) * Product.price AS Value
FROM T_Purchase Purchase JOIN T_ProductList ProductList ON Purchase.id = ProductList.purchase
JOIN T_Product Product ON  Product.id = ProductList.product
JOIN T_Person Customer ON Purchase.customer = Customer.id
WHERE Customer.name = 'Chris' AND Customer.surname = 'Cnemus'
GROUP BY Product.name, Product.price;

--Zadanie 10
--Znajdź wszystkich klientów którzy wydali więcej niż 50 zł na
-- zakupy w naszym sklepie. Wypisz imię i nazwisko klienta + sumę
-- pieniędzy jaką wydał we wszystkich swoich zakupach.
SELECT Customer.name || ' ' || Customer.surname AS Customer, '$' || Sum(quantity * Product.price) AS Value
FROM T_Purchase Purchase JOIN T_ProductList ProductList ON Purchase.id = ProductList.purchase
JOIN T_Product Product ON Product.id = ProductList.product
JOIN T_Person Customer ON Purchase.customer = Customer.id
GROUP BY Customer.name, Customer.surname
HAVING Sum(quantity * Product.price) > 50;














--zad1
SELECT NAME || ' ' || SURNAME AS PERSON
FROM T_Person
WHERE Surname NOT LIKE 'C%' AND (SURNAME NOT LIKE 'P%');


--ZAD2
SELECT PROD.Name AS NAZWA_PRODUKTU, SUM(PL.Quantity) AS QUANTITY, TC.Name

FROM
    T_PRODUCTLIST PL JOIN T_PRODUCT PROD ON PL.PRODUCT = PROD.ID
    JOIN T_CATEGORY TC on PROD.CATEGORY = TC.ID
    JOIN T_PURCHASE PUR ON PL.PURCHASE = PUR.ID
WHERE PUR.ID = 4
GROUP BY PROD.Name, TC.NAME
ORDER BY QUANTITY DESC;

--ZAD3
SELECT
    TP.NAME || ' ' || TP.SURNAME AS PRACOWNIK,
    TJ.NAME AS JOB,
    TJH."From"

FROM
    T_PERSON TP JOIN T_EMPLOYEE TE ON TP.ID = TE.ID
    JOIN T_JobHistory TJH ON TJH.EMPLOYEE = TE.ID
    JOIN T_JOB TJ ON TJ.ID = TJH.JOB
WHERE TJH."To" IS NULL
ORDER BY TJH."From" ASC;

--ZAD4

SELECT
    Person.name || ' ' || Person.surname AS Employee, Boss.surname AS Boss
FROM
    T_Employee Employee JOIN T_Person Person ON Person.id = Employee.id
    JOIN T_Person Boss ON Boss.id= Employee.boss
    JOIN T_JobHistory JobHistory ON JobHistory.employee = Employee.id
WHERE Employee.boss IS NOT NULL AND JobHistory."To" IS NULL
UNION
SELECT
    Person.name || ' ' || Person.surname, 'No boss'
FROM
    T_Employee Employee JOIN T_Person Person ON Person.id = Employee.id
    JOIN T_JobHistory JobHistory ON JobHistory.employee = Employee.id
WHERE Employee.boss IS NULL AND JobHistory."To" IS NULL;

--ZAD5

SELECT
    PROD.Name, COUNT(TPL.Quantity) AS ILOSC

FROM
    T_PURCHASE TPUR JOIN T_PRODUCTLIST TPL ON TPUR.ID = TPL.Purchase
    JOIN T_PRODUCT PROD ON PROD.ID = TPL.Product
    JOIN T_CATEGORY TC ON TC.ID = PROD.CATEGORY
WHERE TC.Name LIKE 'fruit'
GROUP BY PROD.Name;

--ZAD6

SELECT TP.Name || ' ' || TP.Surname AS KLIENT, COUNT(*) AS TRANSAKCJE

FROM
    T_PERSON TP JOIN T_PURCHASE TPUR ON TP.ID = TPUR.CUSTOMER
WHERE EXTRACT(YEAR FROM TPUR."Date") IN (2020, 2021)
group by TP.Name || ' ' || TP.Surname;

--ZAD7
SELECT
    TP.Name,
    TP.Surname

FROM
    T_PERSON TP JOIN T_PURCHASE TPUR ON TP.ID = TPUR.CUSTOMER
    JOIN T_PRODUCTLIST PL ON PL.Purchase = TPUR.ID
    JOIN T_PRODUCT PROD ON PL.Product = PROD.ID
    JOIN T_CATEGORY TC ON PROD.CATEGORY = TC.ID
WHERE
    TC.Name LIKE 'fish'
GROUP BY
    TP.Name, TP.Surname
HAVING
    SUM(PL.QUANTITY) > 20;



--ZAD8

SELECT
    Product.name AS Product, SUM(Productlist.quantity) AS Quantity, Category.name AS Category
FROM
    T_Purchase Purchase JOIN T_ProductList Productlist ON Purchase.id = ProductList.Purchase
    JOIN T_Product Product ON Productlist.product = Product.id
    JOIN T_Category Category ON Category.id = Product.category
WHERE Purchase.Customer = (SELECT Employee.boss
            FROM T_Employee Employee JOIN T_Person Person ON Employee.id = Person.id
            WHERE Person.name = 'Peter' AND Person.surname = 'Paches')
GROUP BY Product.name, Category.name
ORDER BY 2 ASC;

--ZAD9
SELECT
    PROD.Name AS PRODUKT, SUM(quantity) * PROD.price AS Value

FROM
    T_Purchase Purchase JOIN T_ProductList ProductList ON Purchase.id = ProductList.purchase
    JOIN T_Product PROD ON  PROD.id = ProductList.product
    JOIN T_Person Customer ON Purchase.customer = Customer.id
WHERE Customer.Name like 'Chris' and Customer.Surname like 'Cnemus'
group by PROD.Name, PROD.price;

--ZADANIE 10
SELECT
    Customer.name || ' ' || Customer.surname AS Customer, '$' || Sum(quantity * Product.price) AS Value
FROM
    T_Purchase Purchase JOIN T_ProductList ProductList ON Purchase.id = ProductList.purchase
    JOIN T_Product Product ON Product.id = ProductList.product
    JOIN T_Person Customer ON Purchase.customer = Customer.id
GROUP BY
    Customer.name, Customer.surname
HAVING
    Sum(quantity * Product.price) > 50;




















--zad1
SELECT
    NAME || ' ' || SURNAME AS OSOBA
FROM
    T_PERSON
WHERE
    Surname NOT LIKE 'C%' AND Surname NOT LIKE 'P%';


--ZAD2
SELECT
    PROD.Name, PL.Quantity, TC.Name
FROM
    T_PRODUCTLIST PL JOIN T_PRODUCT PROD ON PL.Product =  PROD.ID
    JOIN T_CATEGORY TC ON PROD.CATEGORY = TC.ID
    JOIN T_PURCHASE PUR ON PUR.ID = PL.Purchase
WHERE
    PL.Purchase = 4
ORDER BY
    PL.Quantity DESC;

--ZAD3
SELECT
    TP.Name || ' ' || TP.Surname AS PERSON,
    TJ.Name,
    JH."From"

FROM
    T_PERSON TP JOIN T_EMPLOYEE TE ON TP.ID = TE.ID
    JOIN T_JOBHISTORY JH ON JH.EMPLOYEE = TE.ID
    JOIN T_JOB TJ ON TJ.ID = JH.JOB
WHERE
    JH."To" IS NULL
ORDER BY
    JH."From" ASC;


--ZAD4
SELECT
    Person.name || ' ' || Person.surname AS Employee, Boss.surname AS Boss
FROM
    T_Employee Employee JOIN T_Person Person ON Person.id = Employee.id
    JOIN T_Person Boss ON Boss.id= Employee.boss
    JOIN T_JobHistory JobHistory ON JobHistory.employee = Employee.id
WHERE
    Employee.boss IS NOT NULL AND JobHistory."To" IS NULL
UNION
SELECT
    Person.name || ' ' || Person.surname, 'No boss'
FROM
    T_Employee Employee JOIN T_Person Person ON Person.id = Employee.id
    JOIN T_JobHistory JobHistory ON JobHistory.employee = Employee.id
WHERE
    Employee.boss IS NULL AND JobHistory."To" IS NULL;

--ZAD5
SELECT
    PROD.Name AS PRODUKT, COUNT(PL.Purchase) AS ILOSC

FROM
    T_PURCHASE PUR JOIN T_PRODUCTLIST PL ON PUR.ID = PL.Purchase
    JOIN T_PRODUCT PROD ON PROD.ID = PL.Product
    JOIN T_CATEGORY TC ON TC.ID = PROD.Category
WHERE
    TC.NAME LIKE 'fruit'
GROUP BY PROD.Name;

--ZAD6
SELECT
    TP.Name, COUNT(PUR."Date")
FROM
    T_PERSON TP JOIN T_PURCHASE PUR ON TP.ID = PUR.CUSTOMER
WHERE
    EXTRACT(YEAR FROM PUR."Date") IN (2020,2021)
GROUP BY TP.Name;

--ZAD7
SELECT
    TP.Name, TP.Surname

FROM
    T_PERSON TP JOIN T_PURCHASE PUR ON TP.ID = PUR.CUSTOMER
    JOIN T_PRODUCTLIST PL ON PL.Purchase = PUR.ID
    JOIN T_PRODUCT PROD ON PROD.ID = PL.Product
    JOIN T_CATEGORY TC ON TC.ID = PROD.CATEGORY
WHERE
    TC.Name LIKE 'fish'
HAVING
    SUM(PL.QUANTITY) > 20
GROUP BY TP.Name, TP.Surname;

--ZAD8

SELECT
    PROD.Name, sum(pl.Quantity) AS ILOSC, TC.Name
FROM
    T_PRODUCT PROD JOIN T_PRODUCTLIST PL ON PROD.ID = PL.Product
    JOIN T_CATEGORY TC ON TC.ID = PROD.CATEGORY
    JOIN T_PURCHASE PUR ON PL.Purchase = PUR.ID
WHERE PUR.Customer = (SELECT TE.Boss
                        FROM
                            T_PERSON TP JOIN T_EMPLOYEE TE ON TE.ID = TP.ID
                        WHERE TP.NAME LIKE 'Peter' and TP.SURNAME LIKE 'Paches')
group by PROD.Name, TC.Name
ORDER BY ILOSC ASC;

--ZAD9

SELECT
    PROD.Name AS PRODUKT, '$' ||SUM(PL.Quantity) * PROD.Price AS WARTOSC
FROM
    T_PERSON TP
    JOIN T_PURCHASE PUR ON TP.ID = PUR.CUSTOMER
    JOIN T_PRODUCTLIST PL ON PL.Purchase = PUR.ID
    JOIN T_PRODUCT PROD ON PROD.ID = PL.Product
WHERE
    TP.Name LIKE 'Chris' AND Surname LIKE 'Cnemus'
GROUP BY PROD.Name, PROD.Price;

--ZAD10
SELECT
    TP.Name || ' ' || TP.Surname AS KLIENT,
    '$' || SUM(PL.Quantity * PROD.Price) AS WARTOSC
FROM
    T_PERSON TP
    JOIN T_PURCHASE PUR ON TP.ID = PUR.CUSTOMER
    JOIN T_PRODUCTLIST PL ON PL.Purchase = PUR.ID
    JOIN T_PRODUCT PROD ON PROD.ID = PL.Product

GROUP BY
    TP.Name, TP.Surname
HAVING
    SUM(PL.Quantity * PROD.Price) > 50;








--ZAD1

SELECT
    NAME || ' ' || SURNAME AS OSOBA
FROM
    T_PERSON
WHERE Surname NOT LIKE 'C%' AND Surname NOT LIKE 'P%';


--ZAD2

SELECT
    PROD.Name AS PRODUKT, PL.Quantity AS ILOSC, TC.Name AS KATEGORIA
FROM
    T_PRODUCTLIST PL
    JOIN T_PRODUCT PROD ON PROD.ID =  PL.Product
    JOIN T_CATEGORY TC ON TC.ID = PROD.CATEGORY
WHERE
    PL.Purchase = 4
ORDER BY ILOSC DESC;

--ZAD3
SELECT
    TP.Name || ' ' || TP.Surname AS PRACOWNIK,
    TJ.Name,
    TJH."From"
FROM
    T_PERSON TP JOIN T_EMPLOYEE TE ON TE.ID = TP.Id
    JOIN T_JOBHISTORY TJH ON TJH.Employee = TE.Id
    JOIN T_JOB TJ ON TJ.Id = TJH.Job
WHERE
    TJH."To" IS NULL
ORDER BY
    TJH."From" ASC;


--ZAD4
SELECT
    Person.name || ' ' || Person.surname AS Employee, Boss.surname AS Boss
FROM
    T_Employee TE JOIN T_Person Person ON Person.id = TE.id
    JOIN T_Person Boss ON Boss.id= TE.boss
    JOIN T_JobHistory JobHistory ON JobHistory.employee = TE.id
WHERE
    TE.boss IS NOT NULL AND JobHistory."To" IS NULL
UNION
SELECT
    Person.name || ' ' || Person.surname, 'No boss'
FROM
    T_Employee TE JOIN T_Person Person ON Person.id = TE.id
    JOIN T_JobHistory JobHistory ON JobHistory.employee = TE.id
WHERE
    TE.boss IS NULL AND JobHistory."To" IS NULL;

--zad 4 ale lepsze
SELECT
    Person.name || ' ' || Person.surname AS Employee,
    CASE
        WHEN TE.boss IS NULL
            THEN 'No boss'
            ELSE Boss.surname
    END as BOSS
FROM
    T_Employee TE
    JOIN T_Person Person ON Person.id = TE.id
    LEFT JOIN T_Person Boss ON Boss.id = TE.boss
    JOIN T_JobHistory JobHistory ON JobHistory.employee = TE.id
WHERE
    JobHistory."To" IS NULL;
