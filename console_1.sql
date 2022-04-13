create table magazin(
    id int primary key ,
    name varchar(255) not null ,
    address varchar(255),
    mobile varchar(255)
);

create table torgoviy_agent(
    id int primary key,
    name varchar(255) not null ,
    mobile varchar(255)
);

insert into magazin(id, name, address, mobile) values (1,'alatoo','ortosay','0555111111');
insert into torgoviy_agent(id, name, mobile) values (1,'aza','0700000001');
alter table magazin add column torgoviy_agent_id int references torgoviy_agent(id);
update magazin set torgoviy_agent_id = 1 where name ='alatoo';


create table teams (
    id int primary key,
    name varchar(55)
);

insert into teams(id, name) values (1,'arsenal');
insert into teams(id, name) values (2,'liverpool');

create table fans(
    id int primary key,
    name varchar(55),
    favorite_team_id int references teams(id)
);
insert into fans(id, name, favorite_team_id) values (1,'aza',1);
insert into fans(id, name, favorite_team_id) values (2,'ali',1);

create table cars(
    id int primary key,
    model varchar(55),
    color varchar(55)
);
insert into cars(id, model, color) values (1,'toyota','white');
insert into cars(id, model, color) values (2,'mers','blue');

create table drivers(
    id int primary key,
    name varchar(55),
    car_id int references cars(id)
);

insert into drivers(id, name, car_id) values (1,'aza',2);
insert into drivers(id, name, car_id) values (2,'ali',1);

alter table cars add column driver_id int references drivers(id);
update cars set driver_id = 1 where model='mers';

create table citizen (
    id int primary key,
    name varchar(255),
    job varchar(255),
    magazin_id int references magazin(id)
);

insert into citizen(id, name, job, magazin_id) values (1,'bob','backend Dev',1);

create table city(
    id int primary key,
    name varchar(55),
    postalcode int
);

insert into  city(id, name, postalcode) values (1,'bishkek',720000);
alter table citizen add column city_id int references city(id);
update citizen set city_id =  1 where name = 'bob';

create table actor(
    id int primary key,
    gender varchar(8),
    name varchar(55),
    year int
);
insert into actor(id, gender, name, year) values (1,'male','mark wallberg',35);

create table movies(
    id int primary key,
    name varchar(255),
    year int,
    actor_id int references actor(id)
);
insert into movies(id, name, year, actor_id) values(7,'two guns',2020,1);

select * from movies where actor_id = 1;

create table mobile(
    id int primary key,
    model varchar(55),
    year int,
    price int
);

alter table mobile rename to mobiles;

create table customers(
    id int primary key,
    name varchar(255),
    mobile_id int references mobiles(id),
    city_id int references city(id)
);

insert into mobiles(id, model, year, price) values (1,'iphone13',2022,1000);
insert into mobiles(id, model, year, price) values (2,'redmi',2022,300);

insert into customers(id, name, mobile_id, city_id) values (1,'john',2,1);
select * from customers where city_id=1 and mobile_id=2;

create table author(
    id int primary key,
    name varchar(255),
    date_of_birth date
);

insert into author(id, name, date_of_birth) values(1,'Chyngyz Aitmatov','1928-05-05');
insert into author(id, name, date_of_birth) values(2,'Tologon Kasymbekov','1930-06-06');

create table books(
    id int primary key,
    title varchar(255) not null,
    printhouse varchar,
    year int,
    author_id int references author(id)
);

insert into books(id, title, printhouse, year, author_id)
values(1,'Syngan Kylych','Uchkun',2020,2);

select * from books;

create table student(
    id int primary key,
    name varchar not null,
    gender varchar not null
);

insert into student(id, name, gender) values (1,'spiderman','male');
alter table student rename to students;

create table kabinet(
    id int primary key,
    kabinet_nomer int unique not null,
    etaj int
);

insert into kabinet(id, kabinet_nomer, etaj) values (1,201,2);
insert into kabinet(id, kabinet_nomer, etaj) values (2,202,2);

create table instructor(
    id int primary key,
    name varchar not null
);

insert into instructor(id, name) values (1,'bob marley');

create table courses(
    id int primary key,
    name varchar,
    kabinet_id int references kabinet(id),
    instructor_id int references instructor(id),
    student_id int references students(id)
);

insert into courses(id, name, kabinet_id, instructor_id, student_id)
values (1,'Java',1,1,1);

select * from courses;

























