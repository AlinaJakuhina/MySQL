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


select * from Students_hw