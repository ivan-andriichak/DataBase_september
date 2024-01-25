-- Використовуємо базу даних з іменем "okten"
use okten;

-- Створення таблиці "cities" для міст
create table cities
(
    id   int primary key auto_increment,
    city varchar(20) not null
);

-- Створення таблиці "users" для користувачів з посиланням на місто
create table users
(
    id      int primary key auto_increment,
    name    varchar(20) not null,
    age     int         not null,
    city_id int         null,
    foreign key (city_id) references cities (id)
);

-- Вставка даних про місто "Rivne" в таблицю "cities"
insert into cities
values (null, 'Rivne');

-- Вставка даних про користувача "Petro" в таблицю "users" з посиланням на місто
insert into users
values (null, 'Petro', 18, null);

-- Вибірка всіх користувачів з таблиці "users"
select *
from users;

-- Вибірка всіх міст з таблиці "cities"
select *
from cities;

-- Вибірка всіх користувачів з інформацією про їх місто, яке вони обрали
select *
from users
         join cities on cities.id = users.city_id;

-- Вибірка користувачів разом з їх містами
select users.id, name, age, city
from users
         join cities on cities.id = users.city_id;

-- Вибірка користувачів разом з інформацією про місто
select users.*, city
from users
         join cities on cities.id = users.city_id;

-- Вибірка всіх користувачів та їх міст (включаючи тих, у кого місто не вказане)
select *
from users
         left join cities c on c.id = users.city_id;

-- Вибірка всіх міст і користувачів, у яких місто вказане (з правим з'єднанням)
select *
from users
         right join cities c on c.id = users.city_id;

-- Вибірка користувачів з містом "Lviv"
select users.*
from users
         join cities c on c.id = users.city_id
where city = 'Lviv';

-- Вибірка міста, до якого належить користувач з id = 3
select city
from users
         join cities c on c.id = users.city_id
where users.id = 3;

-- Вибірка усіх клієнтів, їх заявок та відділів з декількох таблиць
select *
from client
         join okten.application a on client.idClient = a.Client_idClient
         join okten.department d on d.idDepartment = client.Department_idDepartment;

-- Вибірка унікальних імен користувачів
select distinct name from users;

-- Об'єднання результатів двох запитів: найстарший користувач і наймолодший користувач
(select * from users order by age desc limit 1) union (select * from users order by age limit 1);

-- Вибірка міст, які пов'язані з користувачами іменами 'karina', 'max' і 'tolik'
select * from cities where id in (select city_id from users where name in ('karina','max', 'tolik'));

-- Вибірка міст з id 1 і 2
select * from cities where id in (1,2);

-- Підрахунок кількості автомобілів для кожної моделі та виведення моделі з найбільшою кількістю
select count(*) as count, model from cars group by model order by count desc limit 1;
#/////////////////////////////////////////////////////////////////////////////////////////////
# Path#2
use okten;

-- Створення таблиці для міст
create table cities
(
    id   int primary key auto_increment, -- Унікальний ідентифікатор міста
    city varchar(25) not null -- Назва міста
);

-- Створення таблиці для користувачів
create table users
(
    id      int primary key auto_increment, -- Унікальний ідентифікатор користувача
    name    varchar(25) not null, -- Ім'я користувача
    age     int         not null, -- Вік користувача
    city_id int         null, -- Зовнішній ключ, посилається на ідентифікатор міста
    foreign key (city_id) references cities (id) -- Зовнішній ключ, посилається на ідентифікатор міста у таблиці cities
);

-- Вибірка всіх користувачів
select * from users;

-- Вибірка всіх міст
select * from cities;

-- Вибірка даних користувачів та міст, використовуючи INNER JOIN
select users.id, name, age, city from users
                                          join cities on city_id = cities.id;

-- Вибірка всіх стовпців з обох таблиць за допомогою INNER JOIN
select users.*, city from users
                              join cities on city_id = cities.id;

-- Вибірка всіх стовпців з обох таблиць за допомогою INNER JOIN з оберненим порядком таблиць
select * from cities c
                  join users u on c.id = u.city_id;

-- Вибірка всіх записів з таблиці cities та відповідні користувачі, використовуючи RIGHT JOIN
select * from cities c
                  right join users u on c.id = u.city_id;

-- Вибірка всіх користувачів з міста Львів
select * from users
                  join cities c on c.id = users.city_id where city ='Lviv';

-- Приклад вибірки даних з декількох таблиць
select * from client
                  join okten.application a on client.idClient = a.Client_idClient
                  join okten.department d on client.Department_idDepartment = d.idDepartment;

-- Вибірка унікальних імен користувачів
select distinct name from users;

-- Об'єднання результатів вибірки суми віку користувачів та максимального віку користувачів
select sum(users.age) from users
union
select max(users.age) from users;

-- Вибірка всіх автомобілів, ціна яких є віком користувачів
select * from cars where price in (select age from users);

-- Вибірка всіх автомобілів, ціна яких перевищує середню ціну всіх автомобілів
select * from cars
where price > (select avg(price) from cars);
