-- Використовуємо базу даних з іменем "okten"
use okten;

-- Виводимо список всіх таблиць у базі даних
show tables;

-- Створюємо таблицю "users", якщо вона не існує
create table if not exists users(
    id int not null auto_increment primary key,
    name varchar(255) not null,
    age int not null,
    gender varchar(6) not null
);

-- Вставляємо дані про користувачів до таблиці "users"
insert into users values (null, 'Max', 15, 'male');
insert into users values (null, 'Kokos', 16, 'male');

-- Виконуємо запит для таблиці "application" (тут таблиці "application" не існує)
select * from application;

-- Вибираємо лише певні стовпці (id та gender) з таблиці "users"
select id, gender from users;

-- Вибираємо записи з таблиці "cars", де модель починається на "n" і має два символи
select * from cars where model like '__n%';

-- Вибираємо користувачів з іменем "max" (з урахуванням регістру)
select * from users where name='max';

-- Вибираємо користувачів з віком, не рівним 20
select * from users where age!=20;

-- Вибираємо користувачів з віком, рівним 20
select * from users where age=20;

-- Вибираємо користувачів з віком, меншим або рівним 20
select * from users where age<=20;

-- Вибираємо користувачів з віком в діапазоні від 20 до 30
select * from users where age between 20 and 30;

-- Вибираємо користувачів з віком, який знаходиться в списку {20, 45, 22}
select * from users where age in (20, 45, 22);

-- Вибираємо користувачів з віком рівним 20 або 25
select * from users where age=20 or age=25;

-- Вибірка всіх користувачів і сортування за зменшенням id
select * from users order by id desc;

-- Вибірка перших 5 користувачів і сортування за зменшенням id
select * from users order by id desc limit 5;

-- Вибірка перших 5 користувачів без сортування
select * from users limit 5;

-- Вибірка користувача з найвищим віком
select * from users order by age desc limit 1;

-- Вибірка максимального віку серед користувачів
select max(age) as maxAge from users;

-- Вибірка мінімального віку серед користувачів
select min(age) as minAge from users;

-- Вибірка середнього віку серед користувачів
select avg(age) as avgAge from users;

-- Вибірка суми віку серед користувачів
select sum(age) as sumAge from users;

-- Підрахунок кількості користувачів в таблиці
select count(*) from users;

-- Створення таблиці "people"
create table if not exists people(
                                     id int not null primary key auto_increment,
                                     name varchar(255) not null,
    age int not null,
    gender varchar(6) not null
    );

-- Вставляємо дані про людей до таблиці "people"
insert into people values (null, 'Max', 20, 'male');
insert into people values (null, 'Kokos', 25, 'male');

-- Оновлення віку користувача з id=11
update users set age=36 where id=11;

-- Видалення користувача з id=13
delete from users where id=13;
-- //////////////////////////////////////////////////////////////////////////////////
-- path#2
-- Використання бази даних okten:
use okten;

-- Виведення переліку наявних таблиць:
show tables;

-- Вибір всіх записів з таблиці users:
select * from users;

-- Створення таблиці users:
 create table users (
   id int auto_increment primary key,
   name varchar(20) not null,
   age int not null
);

-- Вставка нового користувача до таблиці users:
insert into users value (null, 'Max', 18);

-- Вибір всіх записів з таблиці users:
select * from users;

-- Вибір конкретних полів з таблиці users:
select id, name, age, gender from users;

-- Вибір користувачів з ім'ям 'Oleg':
select * from users where name = 'Oleg';

-- Вибір користувачів за віком 30 або статусом 'male':
select * from users where age = 30 or gender = 'male';

-- Вибір користувачів за віком 30 та статусом 'male':
select * from users where age = 30 and gender = 'male';

-- Вибір користувачів, ім'я яких починається з 'o':
select * from users where name like 'o%';

-- Вибір користувачів, ім'я яких містить 'o':
select * from users where name like '%o%';

-- Вибір користувачів, ім'я яких має три символи і закінчується на 'e':
select * from users where name like '__e%';

-- Вибір користувачів за віком 30:
select * from users where age = 30;

-- Вибір користувачів, вік яких не є 30:
select * from users where age != 30;

-- Вибір користувачів за віком в діапазоні 20-30:
select * from users where age between 20 and 30;

-- Вибір користувачів за віком, що не входить в діапазон 20-30:
select * from users where age not between 20 and 30;

-- Вибір користувачів за віком більше 30:
select * from users where age > 30;

-- Вибір користувачів за віком, який знаходиться в списку (20, 30, 45):
select * from users where age in (20, 30, 45);

-- Вибір користувачів за довжиною імені рівною 4:
select * from users where length(name) = 4;

-- Вибір всіх записів з таблиці users, впорядкованих за віком:
select * from users order by age;

-- Вибір всіх записів з таблиці users, впорядкованих за віком у зворотньому порядку:
select * from users order by age desc;

-- Вибір користувачів за віком більше 20, впорядкованих за віком у зворотньому порядку:
select * from users where age > 20 order by users.age desc;

-- Вибір користувачів за віком більше 20, впорядкованих за віком у зворотньому порядку, із обмеженням на кількість та зсувом:
select * from users where age > 20 order by age desc limit 3 offset 3;

-- Вибір мінімального віку серед користувачів:
select min(age) as minAge from users;

-- Вибір максимального віку серед користувачів:
select max(age) as maxAge from users;

-- Вибір суми віку серед користувачів:
select sum(age) as sumAge from users;

-- Вибір середнього віку серед користувачів:
select avg(age) as avgAge from users;

-- Вибір мінімального віку та статусу за групами статусів:
select min(age) as minAge, gender from users group by gender;

-- Вибір мінімального віку, середнього віку та статусу за групами статусів:
select min(age) as minAge, avg(age) as avgAge, gender from users group by gender;

-- Вибір кількості користувачів за групами статусів:
select count(*) as count, gender from users group by gender;

-- Вибір всіх записів з таблиці cars:
select * from cars;

-- Вибір кількості моделей автомобілів, випущених після 2020 року, за групами моделей, з умовою кількості більше або рівно 2:
select count(*) as modelCount, cars.model from cars where year > 2020 group by model having modelCount >= 2 order by modelCount desc;

-- Видалення користувача з id 9:
delete from users where id = 9;

-- Оновлення статусу користувача з ім'ям 'lina' на 'male':
update users set gender = 'male' where name = 'lina';
