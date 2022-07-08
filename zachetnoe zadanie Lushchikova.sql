create sequence if not exists news_id;

create table if not exists news (
id int not null default nextval('news_id') primary key,
release_data date,
description_film varchar
);

insert into news (release_data, description_film) values
('11-11-22', 'Таня Бабанина из подмосковного Протвино 
мастерски печет и мечтает о своём кафе. Но чтобы исполнить 
мечту, говорят, нужно выйти из зоны комфорта. И Таня выходит 
с международным размахом, найдя безумные приключения на свои булки. 
Одна на Шри-Ланке. Без денег, документов и мужа, который изменил ей
 сразу после свадьбы. Зато с похмельем, в зимнем пальто и... под одной 
 крышей с тремя парнями, которые ей совсем не рады'),
('7-08-22', 'Медведь Брэмбл всегда хотел стать героем. И однажды ему выпал
 шанс стать не просто героем, а супергероем. Познакомившись в лесу с пришельцем 
 Эви, Брэмбл становится обладателем суперспособностей. Теперь он может реализовать 
 любое желание одной силой мысли. Высокоразвитый народ Эви покинул Землю миллионы лет назад.
 И вот теперь Эви вернулся, чтобы передать новейшую технологию землянам, а также в 
 надежде найти давно покинутый древний город и, может быть, свою семью. Однако следом 
 за Эви из космоса прибывают пираты, которые хотят захватить власть во Вселенной.
 Медведь Брэмбл и его пушистые друзья должны помочь новому другу Эви и заодно спасти Вселенную'), 
('10-08-22', 'Добрая и могущественная колдунья Долорес обучает одаренных детеи основам магии. 
 Однажды она спасает озорную и бесстрашную девочку Паолу, на которую объявил охоту ужасныи барон, 
 ненавидящии всех ведьм. Из-за его коварных планов существование всеи Школы волшебства оказывается под угрозои'), 
('25-12-22','Бэтмен обнаруживает коррупцию в Готэм-сити, которая связана с его собственной семьей, когда сталкивается
 с серийным убийцей, известным как Загадочник'),
('8-07-22', 'Джим и Энн готовятся к поступлению в университет, но неожиданно в их стройные планы вмешивается 
 разгоревшееся первое серьезное романтическое чувство. Им придется сделать сложнейший выбор и решить, что ждет 
 их в будущем');

create sequence if not exists comments_id;

create table if not exists "comments" (
id int not null default nextval('comments_id') primary key,
first_name varchar,
Last_name varchar,
nike_name varchar,
comments varchar );

insert into "comments" (first_name, Last_name, nike_name, "comments") values

('Валентина','Юдашкина', 'vally',  'Отличная киношка'),
('Гена', 'Крокодилов', 'Green',  'Даже не знаю,что это было'),
('Петя', 'Загороний', 'Fence',  'Посмотрю еще раз'),
('Клава', 'Иванова', 'Klava',  'Ожидала большего'),
('Рамир', 'Родригес', 'Shlyapa',  'Ничего интересного');

create sequence if not exists subscription_id;

create table if not exists subscription (
id int not null default nextval('subscription_id') primary key,
light  boolean,
medium  boolean,
vip  boolean );

insert into subscription (light, medium, vip) values
('true', 'false', 'false'),
('false', 'true', 'false'),
('false', 'false', 'true');


create sequence if not exists personal_account_id;

create table if not exists personal_account (
id int not null default nextval('personal_account_id') primary key,
first_name varchar,
Last_name varchar,
nike_name varchar,
subscription_id int );

insert into personal_account (first_name, Last_name, nike_name, subscription_id) values
('Валентина','Юдашкина', 'vally',  '3'),
('Гена', 'Крокодилов', 'Green',  '1'),
('Петя', 'Загороний', 'Fence',  '2'),
('Клава', 'Иванова', 'Klava',  '3'),
('Рамир', 'Родригес', 'Shlyapa','2');

alter table personal_account add constraint subscription_fk
foreign  key (subscription_id) references subscription(id);


create sequence if not exists films_id;

create table if not exists films (
id serial,
name_film varchar,
news_id int,
comments_id int,
personal_account_id int
);

insert into films ( name_film, news_id, comments_id, personal_account_id) values
('Булки', '1', '3', '1'),
('Побег из космоса', '2', '1', '3'),
('Школа Волшебства', '3', '4', '2'),
('Бэтмен','4','2','5' ),
('Первая любовь', '5','5','4');

alter table films add constraint news_fk
foreign  key (news_id) references news(id);

alter table films add constraint comments_fk
foreign  key (comments_id) references comments(id);

alter table films add constraint personal_account_fk
foreign  key (personal_account_id) references personal_account(id);

select personal_account.nike_name, personal_account.subscription_id  from personal_account left join "subscription" 
on personal_account.id="subscription".id;










