-- Використовуємо базу даних "okten"
use okten;

# -- Створення таблиці "users" для користувачів зі зв'язком до таблиці "profile"
# create table users
# (
#     id       int primary key auto_increment,
#     username varchar(20) not null,
#     password varchar(20) not null
# );
#
# -- Створення таблиці "profile" для профілів користувачів з посиланням на користувачів
# create table profile
# (
#     id      int auto_increment primary key,
#     name    varchar(20)  not null,
#     surname varchar(20)  not null,
#     photo   varchar(255) null,
#     phone   varchar(10)  not null,
#     user_id int          null unique,
#     foreign key (user_id) references users (id)
# );
#
# -- Вибірка всіх користувачів разом з їх профілями
# select *
# from users
#          join profile p on users.id = p.user_id;
#
# -- Вибірка певних полів інформації про користувачів та їх профілів
# select users.id, username, password, name, surname, photo, phone
# from users
#          join profile p on users.id = p.user_id;
#
# -- Створення таблиці "users_cars" для зв'язку користувачів і автомобілів
# create table users_cars
# (
#     user_id int    not null,
#     car_id  bigint not null,
#     primary key (user_id, car_id),
#     foreign key (user_id) references users (id),
#     foreign key (car_id) references cars (id)
# );
#
# -- Вибірка інформації про користувачів та моделі автомобілів, які вони володіють
# select u.*, model
# from cars
#          join users_cars uc on cars.id = uc.car_id
#          join okten.users u on u.id = uc.user_id
# where name = 'kira';
#
# -- Обчислення суми замовлень для кожного клієнта
# select sum(Sum), Client_idClient from application group by Client_idClient;
#
# -- Додавання нового стовпця "status" до таблиці "users"
# ALTER TABLE users
#     ADD status tinyint;
-- ////////////////////////////////////////////////////////////////////
create table users_cars
(
    user_id int,
    car_id  bigint,
    primary key (user_id, car_id),
    foreign key (user_id) references users (id),
    foreign key (car_id) references cars (id)

);


select users.name, c.*
from users
         join users_cars uc on users.id = uc.user_id
         join okten.cars c on c.id = uc.car_id
where name = 'natali';


create table auth_user
(
    id       int primary key auto_increment,
    username varchar(255) not null,
    password varchar(255) not null,
    user_id  int          not null unique,
    foreign key (user_id) references users (id)
);

select *
from users
         join auth_user au on users.id = au.user_id;



# select sum(Sum) as sum, idDepartment, DepartmentCity
# from department
#     join okten.client c on department.idDepartment = c.Department_idDepartment
#     join okten.application a on c.idClient = a.Client_idClient
# group by idDepartment order by Sum desc limit 1;