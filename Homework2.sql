-- Создаём базу данных
create database FE37_38;

show databases;

use FE37_38;

create table products(
id integer primary key auto_increment,
title varchar(128),
quantity integer check(quantity between 0 and 10)
);

insert into products (title, quantity) 
values  ('Apple', 3), 
		('Orange', 2), 
		('Banana', 10), 
		('Pineapple', 7), 
		('Kiwi', 4);
        
select * from products;
alter table products
add price integer default 0

-- numeric (precision, scale)
-- Изменить тип на numeric(8, 2);
alter table products
modify column price numeric(8, 2);

alter table products
modify column price integer;

-- Переиминовать поле change
alter table products 
change price item_price integer;

-- Удалить поле 
alter table products 
drop column item_price;

-- Добавить поле quality типа numeric(2, 2) со значение по умолчанию 0
alter table products
add quality numeric(2, 2) default 0;

-- Изменить тип quality на integer
alter table products
modify column quality integer;

-- Чтобы удалить или обновить данные нужно отключить режима безопасных обновлений
set sql_safe_updates = 0;

-- Удалить все продукты с количеством 10
delete from products
where quantity = 10;

-- Изменить количество на 10 и качество на 0 для всех апельсинов
update products
set quantity = 10, quality = 10
where title = 'Orange';

-- Удалить все данные
delete from products;

-- Удалить таблицу
drop table products;

select * from products;

-- Создать таблицу students с полями
-- 		name строка (не null)
-- 		lastname строка (не null)
-- 		avg_mark целое число (от 0 до 10)
-- 		gender строка(128) (или “M” или “F”)

create table students(
name varchar(128)not null,
lastname varchar(128)not null,
avg_mark integer check(avg_mark between 0 and 10),
gender varchar(128) check(gender in ("M", "F"))
);

-- Добавить поле id integer primary key auto_increment
alter table students
add id integer primary key auto_increment;

-- Поменять тип у gender на char(1)
alter table students
modify column gender char(1)

-- Поменять тип у avg_mark на numeric(2,1)
alter table students
modify column avg_mark numeric(2, 1);

-- Переименовать поле name на firstname
alter table students
change name firstname varchar(128);

insert into students(firstname,lastname,avg_mark, gender)
values ('Олег', 'Петров', '4.3', 'M' ),
       ('Семён', 'Степанов', '3.1', 'M' ),
       ('Ольга', 'Семёнова', '4.7', 'F' ),
       ('Игорь', 'Романов', '3.1', 'M' ),
       ('Ирина', 'Иванова', '2.2', 'F' );

--  Найти учеников, у которых оценка больше 4
select * from students
where avg_mark >4;

--  Найти учеников, у которых оценка не входит в диапазон от 3 до 4
select * from students
where avg_mark not between 3 and 4;

--  Найти учеников, у которых имя начинается на И
select * from students
where firstname like "И%";

--  Найти учеников, у которых оценка 2.2 или 3.1 или 4.7
select * from students
where avg_mark in(2.2, 3.1,4.7);

-- Увеличить всем учащимся оценку в 2 раза
update students
set avg_mark = avg_mark * 2;

-- Поменять у Олега Петрова фамилию на Сидоров
update students
set lastname = 'Сидоров'
where firstname = 'Олег' and lastname = 'Петров';

select * from students;

 CREATE TABLE Staff (
id INTEGER PRIMARY KEY auto_increment,
firstname VARCHAR(64) NOT NULL,
lastname VARCHAR(64) NOT NULL,
position VARCHAR(128),
age INTEGER CHECK(age BETWEEN 0 and 110), 
has_child CHAR(1) CHECK(has_child IN (‘Y’, ‘N’)),
username VARCHAR(128) unique
);

-- 1. Создать таблицу employees;
-- employee_id целое число первичный ключ автоинкремент старт = 100, 
-- fname строка не null,
-- last_name строка не null,
-- email строка не null,
-- phone строка не null

create table employees(
employee_id integer primary key auto_increment,
fname varchar(128)not null,
last_name varchar(128)not null,
email varchar(128)not null,
phone varchar(128)not null
);

-- 2. Ой, забыли про зарплату)) Добавить поле salary numeric(9, 2),
alter table employees
add salary numeric(9, 2);

-- 3. Ойййй, нет, зарплата должна быть целым числом. Изменить тип salary на integer.
alter table employees
modify column salary integer;

-- 4. Переименовать поле fname на first_name
alter table employees
change fname first_name varchar(128);

-- 5. Удалить поле phone
alter table employees
drop column phone;

-- 6. Добавить поле department строка не null
alter table employees
add department varchar(128) not null;

alter table employees
change departament department varchar(128);

alter table employees
drop column departament;

-- 7. Заполнить таблицу (employees.txt)

insert into employees(first_name, last_name, email, salary, department) values("Steven","King", "SKING", 24000, "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Neena" , "Kochhar" , "NKOCHHAR" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Lex" , "De Haan" , "LDEHAAN" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Hunold" , "AHUNOLD" , 9000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Bruce" , "Ernst" , "BERNST" , 6000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Valli" , "Pataballa" , "VPATABAL" , 4800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Diana" , "Lorentz" , "DIANALO" , 8800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Nancy" , "Greenberg" , "NGREENBE" , 12008 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Daniel" , "Faviet" , "DFAVIET" , 9000 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Jose Manuel" , "Urman" , "JMURMAN" , 7800 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Luis" , "Popp" , "LPOPP" , 6900 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Den" , "Raphaely" , "DRAPHEAL" , 11000 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Khoo" , "AKHOO" , 3100 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Shelli" , "Baida" , "SBAIDA" , 2900 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Sigal" , "Tobias" , "STOBIAS" , 2800 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Matthew" , "Weiss" , "MWEISS" , 8000 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Fripp" , "AFRIPP" , 8200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Payam" , "Kaufling" , "PKAUFLIN" , 7900 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Shanta" , "Vollman" , "SVOLLMAN" , 6500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Kevin" , "Mourgos" , "KMOURGOS" , 5800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Julia" , "Nayer" , "JNAYER" , 3200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Markle" , "SMARKLE" , 2200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Bissot" , "LBISSOT" , 3300 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Mozhe" , "Atkinson" , "MATKINSO" , 2800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Joshua" , "Patel" , "JPATEL" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Trenna" , "Rajs" , "TRAJS" , 3500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("John" , "Russell" , "JRUSSEL" , 14000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Karen" , "Partners" , "KPARTNER" , 13500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Alberto" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Gerald" , "Cambrault" , "GCAMBRAU" , 11000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Eleni" , "Zlotkey" , "EZLOTKEY" , 10500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Vargas" , "PVARGAS" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");

-- 8. Найти всех ИТ работников с зарплатой выше 12000
select * from employees
where salary > 12000 and department = 'IT';

-- 9. Повысить зарплату работников отдела Human Resources в 5 раз
update employees
set salary = salary*5
where department = "Human Resources";

-- 10. Найти работников отдела Marketing с зарплатой ниже 2850.
select * from employees
where salary < 2850 and department = "Marketing";

-- 11. У руководителя родились близнецы Лаура и Адам, в честь праздника он решил повысить
-- зарплату работников с именами Лаура и Адам в 10 раз.
update employees
set salary = salary*10
where first_name in("Laura", "Adam");

-- 12. Diana Lorentz вышла замуж и поменяла фамилию на King. Поменяйте у Diana Lorentz фамилию
-- на King
update employees
set last_name = "King"
where first_name = "Diana" and last_name = "Lorentz";


-- 13. Всех работников отдела sales уволили. Удалите работников sales из таблицы.
set sql_safe_updates = 0;
delete from employees
where department = "sales";

-- 14. John Russell перевели в отдел Marketing и повысили зарплату на 5000. Измените данные для
-- работника John Russell.
update employees
set department = " Marketing", salary = salary + 5000
where first_name = "John" and last_name = "Russell";

-- 15. После праздника руководитель протрезвел и уменьшил зарплаты работников с именами
-- Лаура и Адам в 10 раз.
update employees
set salary = salary/10
where first_name in ("Laura","Adam");

-- 16. Laura Bissot поменяла свой мейл на BISSOTLAURA. Измените данные для работника Laura
-- Bissot.
update employees
set email = 'BISSOTLAURA'
where first_name = 'Laura' and last_name = 'Bissot';

-- 17. Diana King развелась и поменяла фамилию обратно на Lorentz. И в честь развода руководитель
-- повысил ее зарплату на 2000. Измените данные для работника Diana King.
update employees
set last_name = 'Lorentz', salary = salary + 2000
where first_name = 'Diana' and last_name = 'King';

select * from employees


-- 1. Создать таблицу students
-- id уникальное значение, не null, автозаполнение 
-- firstname varchar not null
-- lastname varchar not null
-- class integer от 1 до 10
-- subject varchar not null
-- mark integer от 0 до 5

create table Students_hw(
id integer primary key auto_increment,
firstname varchar(128) not null,
lastname varchar(128) not null,
class integer check(class between 1 and 10),
subject varchar(128) not null,
mark integer check(mark between 0 and 5)
);

-- 2. Заполнить таблицу строками (10 шт)

insert into Students_hw(firstname, lastname, class, subject, mark) values("Laura" , "Kirova" , "3" , "informatica", "4");
insert into Students_hw(firstname, lastname, class, subject, mark) values("Marija" , "Rrima" , "5" , "matematica", "5");
insert into Students_hw(firstname, lastname, class, subject, mark) values("Rita" , "Bissot" , "5" , "informatica", "2");
insert into Students_hw(firstname, lastname, class, subject, mark) values("Uljana" , "Bistrova" , "7" , "himija" , "5");
insert into Students_hw(firstname, lastname, class, subject, mark) values("Laura" , "Ribkina" , "2" , "anatomija" , "3");
insert into Students_hw(firstname, lastname, class, subject, mark) values("Kristine" , "Tomina" , "1" , "geologija" , "4");
insert into Students_hw(firstname, lastname, class, subject, mark) values("Alina" , "Nurisina" , "5" , "geografija" , "4");
insert into Students_hw(firstname, lastname, class, subject, mark) values("Ana" , "Modina" , "10" , "sport", "5");
insert into Students_hw(firstname, lastname, class, subject, mark) values("Olga" , "Tuja" , "9" , "english", "5");
insert into Students_hw(firstname, lastname, class, subject, mark) values("Irina" , "Krishina" , "8" , "literatura" , "4");

-- 3. Удалить из таблицы студентов, у которых оценка 0
 select * from Students_hw
 where mark = '0';
 
-- 4. Найти всех студентов, у которых оценка выше 3
select * from Students_hw
where mark > 3;

-- 5. Найти всех студентов, которые учатся в первом классе и у них оценка меньше 3
select * from Students_hw
where class = "1" and mark <3;

-- 6. Удалить из таблицы этих студентов


-- 7. Найти всех студентов, у которых длина имени больше 4 букв
select * from Students_hw
where firstname like '%_____%';

-- 8. Найти всех студентов, у которых фамилия начинается с буквы "a" и имеет длину не менее 3
-- символов.
select * from Students_hw
where firstname like '%a___%';

-- 9. В таблице оставить тех студентов, которые (проходят Х предмет и оценка выше 4) и тех
-- студентов (которые учатся 7-10 классах и у них оценки ниже 3).
delete from Students_hw
where mark <4 and class <7;

-- 10. Удалить таблицу.
drop table Students_hw

-- 1.	Создать базу данных lesson4
create database lesson4

-- 2.	Удалить ее
set sql_safe_updates = 0;
show databases
use lesson4;
DROP DATABASE lesson4
show databases;

create DATABASE sakila
use sakila

select * from address

-- 1.	Создать базу данных lesson4
create database lesson4;
-- 2.	Удалить ее
drop database lesson4;
-- 3.	Использовать базу данных sakila
use sakila;
-- 4.	Посмотреть какие есть таблицы в ней
show tables;
-- 5.	Из таблицы address вывести столбцы address, district, city_id, phone и postal_code
select address, district, city_id, phone, postal_code
from address;
-- 6.	Вывести те адреса, у которых district либо QLD, либо Alberta
select * from address
where district in ("QLD", "Alberta");
-- 7.	Вывести те адреса, у которых city_id меньше либо равно 300, или больше либо равно 560
select * from address
where city_id not between 301 and 561;
-- 8.	Вывести те адреса, у которых postal_code пустое значение
select * from address
where postal_code = '';
-- 9.	Вывести те адреса, у которых phone начинается с 8 и заканчивается на 1
select * from address
-- where phone like '8%' and phone like '%1';
where phone like '8%1';
-- 10.	Из таблицы film вывести столбцы title, description и special_features
select title, description, special_features
from film;
-- 11.	Вывести те фильмы, названия которых начинаются на буквы A, B, E
select * from film
where title like 'A%' or title like 'B%' or title like 'E%';
-- 12.	Вывести те фильмы, в описании которых есть слово girl.
select * from film
where description like '%girl%';

-- 13.	Вывести те фильмы, в описании которых нет слов unbelieavable, но есть слово drama, и в special_features есть trailers.
select * from film
where description not like '%unbelieavable%' and description like '%drama%' and special_features like '%trailers%';

-- 14.	Из таблицы customer вывести столбцы first_name, last_name, address_id и active
select first_name, last_name, address_id, active
from customer;

-- 15.	Вывести тех покупателей, у которых active 0
select * from customer
where active = 0;
-- 16.	Вывести тех покупателей, у которых address_id не находится в интервале [10, 15]
select * from customer
where address_id not between 10 and 15;

-- 17.	Вывести тех покупателей, у которых имя начинается с букв An, а фамилия заканчивается на букву L.
select * from customer
where first_name like '%An%' and last_name like '%l';

-- 18.	Из таблицы country найти и вывести id Германии.
select * from city;
select country_id from country
where country = 'germany';

-- 19.	Из таблицы city найти все города Германии и вывести их.
select * from country
where country_id = 38;

-- 20.	Из таблицы city вывести все города с country_id 3, 5, 13, 46 и 107.
select * from city
where country_id in (3, 5, 13, 46, 107);




-- 1.	Использовать базу данных fe37_38
use FE37_38

-- 2.	Вывести все таблицы из этой бд
show tables

-- 3.	Создать таблицу customers
-- id целое число первичный ключ автоинкремент, 
-- first_name строка не null,
-- last_name строка не null,
-- age целое число больше 18,
-- order_name строка не null,
-- delivery_status целое число 1 или 0

create table customers(
id integer primary key auto_increment,
first_name varchar(128) not null,
last_name varchar(128) not null,
age integer check(age > 18),
order_name varchar(128) not null,
delivery_status integer check (delivery_status in (0, 1))
);

-- 4.	Удалить поля first_name и last_name 
alter table customers
drop column first_name, drop column last_name; 

-- 5.	Добавить поле full_name строка не null
alter table customers
add full_name varchar(128) not null;

-- 6.	Переименовать поле id на customer_id
alter table customers
change column id customer_id integer auto_increment;

-- 7.	Добавить поле price целое число не null
alter table customers
add price integer not null;

-- 8.	Изменить тип phone на строку 
alter table customers
add column phone integer;
select * from customers;

alter table customers
modify column phone varchar(128);

-- 9.	Удалить поле phone
alter table customers
drop column phone;

-- 10.	Переименовать поле price на sum_price целое число не null
alter table customers
change column price sum_price integer not null;
select * from customers;


-- 11.	Заполнить таблицу (customers.txt)

insert into customers(full_name, age, order_name, delivery_status, sum_price) 
			values( "Kris Krill" , 20 , "math_book, pen" , 0 , 9000 ) ,
				( "Kristin Brooks" , 50 , "notebook, pen, drawing_block" , 0 , 4500 ) ,
				( "Kristina Livshits" , 55 , "pencil, sharpener" , 1 , 2340 ) ,
				( "Kristina Nunez" , 43 , "math_book, eng_book, phil_book" , 1 , 18000 ) ,
				( "Kurtis Parham" , 19 , "pencil" , 1 , 350 ) ,
				( "Lai Kurtich" , 22 , "pen, sharpener" , 1 , 1200 ) ,
				( "Lakia Fitzen" , 21 , "notebook, pen" , 1 , 3500 ) ,
				( "Landon Neville" , 34 , "colored papers, pencil" , 1 , 2450 ) ,
				( "Latoria Siprasoeuth" , 32 , "pen, sharpener, rubber" , 1 , 4600 ) ,
				( "Laurice Goffredo" , 76 , "watercolors, drawing_block" , 1 , 1200 ) ,
				( "Laurice Grimstead" , 54 , "notebook" , 1 , 4500 ) ,
				( "Laurice Karl" , 19 , "colored papers" , 0 , 2250 ) ,
				( "Laveta Wida" , 34 , "pen, math_book" , 0 , 1170 ) ,
				( "Lecia Alvino" , 45 , "pencil, sharpener, notebook" , 1 , 9000 ) ,
				( "Lenore Sullivan" , 55 , "eng_book, notebook" , 1 , 175 ) ,
				( "Leon Schoepfer" , 67 , "notebook" , 0 , 600 ) ,
				( "Lexie Magee" , 54 , "watercolors, drawing_block, brushes" , 0 , 1750 ) ,
				( "Li Robleto" , 76 , "brushes, pencil, notebook" , 0 , 1225 ) ,
				( "Libby Krauss" , 78 , "brushes, watercolor" , 0 , 2300 ) ,
				( "Lillia Talbott" , 65 , "eng_book, pen, rubber" , 0 , 600 ) ,
				( "Linda Merida" , 54 , "notebook, pen, drawing_block" , 1 , 7700 ) ,
				( "Lisa Hughes" , 34 , "flag" , 1 , 5450 ) ,
				( "Lloyd Shackley" , 23 , "brushes, watercolor" , 1 , 4370 ) ,
				( "Lola Whitley" , 24 , "notebook" , 0 , 12200 ) ,
				( "Lonnie Colby" , 74 , "notepad" , 1 , 3375 ) ,
				( "Lorilee Bautista" , 24 , "pencil, sharpener" , 1 , 3800 ) ,
				( "Loris Thibadeau" , 54 , "notepad" , 1 , 4950 ) ,
				( "Lorita Koenig" , 59 , "flag" , 0 , 4425 ) ,
				( "Love Whistlehunt" , 47 , "notepad" , 1 , 5500 ) ,
				( "Lovie Ritacco" , 23 , "colored papers" , 1 , 3800 ) ,
				( "Loyd Huckeba" , 26 , "flag" , 0 , 300 ) ,
				( "Loyd Puchalla" , 25 , "notebook" , 1 , 3850 ) ,
				( "Luana Berends" , 38 , "pencil, sharpener, rubber" , 1 , 2725 ) ,
				( "Lucas Summerill" , 36 , "notepad, pen" , 0 , 2185 ) ,
				( "Luciano Lingenfelter" , 80 , "sharpener" , 1 , 6100 ) ,
				( "Lucila Heck" , 58 , "brushes, watercolor" , 1 , 1687.5 ) ,
				( "Luigi Nored" , 23 , "notepad" , 1 , 1900 ) ,
				( "Luis Pothoven" , 38 , "flag" , 1 , 2475 ) ,
				( "Luther Ardinger" , 49 , "notebook" , 1 , 2212.5 ) ,
				( "Mable Ballard" , 59 , "colored papers, pencil" , 1 , 2750 ) ,
				( "Maia Leggett" , 71 , "notepad" , 1 , 1900 ) ,
				( "Marc Domanski" , 58 , "rubber, pencil" , 1 , 4930 ) ,
				( "Marco Slivka" , 80 , "brushes, watercolor" , 1 , 2680 ) ,
				( "Margaret Bennett" , 82 , "pencil, sharpener, pen" , 1 , 1600 ) ,
				( "Marissa Pontius" , 69 , "notebook" , 1 , 9430 ) ,
				( "Markita Larner" , 58 , "notepad, flag" , 1 , 605 ) ,
				( "Martha Baker" , 38 , "colored papers, notebook" , 1 , 1030 ) ,
				( "Marvis Chou" , 27 , "pencil, sharpener" , 0 , 2180 ) ,
				( "Mary Barnes" , 28 , "brushes, watercolor" , 0 , 1655 ) ,
				( "Mary Wilson" , 78 , "notebook" , 0 , 2730 );
  select * from customers              

-- 12.	Найти тех покупателей, которым больше 30 лет, и они заказывали ручку(pen).
select * from customers
where age > 30 and (order_name like '%pen,%' or order_name like '%pen')

-- 13.	Найти тех покупателей, которые заказывали и ручку, и тетради (notebook), и у них статус доставки 0. 
select * from customers
where (order_name like '%pen,%' or order_name like '%pen') and order_name like '%notebook%' and delivery_status = 0;

-- 14.	Найти тех покупателей, у которых сумма заказа больше 4000 и меньше 8000.
select * from customers
where sum_price > 4000 and sum_price < 8000;

-- 15.	Увеличить сумму заказа на 100 у тех покупателей, которые заказали карандаши(pencil).
set sql_safe_updates = 0;
update customers
set sum_price = sum_price + 100 
where order_name like '%pencil%';
 
-- 16.	Удалить записи тех покупателей, которые заказывали только тетради.
delete from customers
where order_name = 'notebook';

-- 17.	Найти тех покупателей, которые заказывали math_book, но не eng_book. 
select * from customers
where order_name like '%math_book%' and order_name not like '%eng_book%';

-- 18.	Поменять статус заказа на 1 для тех покупателей, у которых сумма заказа больше 1200 и статус заказа 0.
select * from customers
where sum_price > 12000

update customers
set delivery_status = 1
where sum_price > 1200 and delivery_status = 0;
 
-- 19.	Удалить записи тех покупателей, у которых имя начинается на букву L, а фамилия заканчивается на O.

delete from customers 
where full_name like 'L%'and full_name like '%o';

-- 20.	Сделать скидку на 10% для тех покупателей, у которых статус заказа 0.

update customers
set sum_price = sum_price - sum_price/10
where delivery_status = 0;

-- 21.	Сделать скидку на столько процентов, сколько лет покупателю, если ему меньше 30.
update customers
set sum_price = sum_price - sum_price * age/100
where age < 30 ;

-- 22.	Удалить записи тех покупателей, у которых статус доставки 0.
delete from customers 
where delivery_status = 0;

-- 23.	Увеличить сумму заказа на 5% для тех покупателей, которые заказывали цветные бумаги.
update customers
set sum_price = sum_price + sum_price * 5/100
where order_name like '%colored papers%';

-- 24.	Удалить таблицу
drop table customers;

-- Д/З 
-- 25. Создать таблицу Jobs 
-- Job_id целое число первичный ключ автоинкремент,  
-- Добавить поля title строка не null, 
-- description строка не null, 
-- salary целое число 

create table Jobs(
Job_id integer primary key auto_increment,
title varchar(128) not null,
descriptions varchar(128) not null,
salary integer
 );
 select * from Jobs;
 
-- 26. Переименовать поле title на job_title, 
-- descriptions на job_description.

alter table Jobs
change title job_title varchar(128);

alter table Jobs
change descriptions job_decrription varchar(128);

-- 27. Удалить поле salary 
set sql_safe_updates = 0;
alter table Jobs
drop column salary;
-- 28. Добавить поля min_salary тип numeric(2,1), max_salary целое число 
alter table Jobs
add min_salary numeric(2,1);

alter table Jobs
add max_salary integer;

-- 29. Изменить тип min_salary на целое число 
alter table Jobs
modify column min_salary integer;

-- 30. Удалить таблицу 

drop table Jobs;
 
