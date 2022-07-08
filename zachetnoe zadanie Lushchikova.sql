create sequence if not exists news_id;

create table if not exists news (
id int not null default nextval('news_id') primary key,
release_data date,
description_film varchar
);

insert into news (release_data, description_film) values
('11-11-22', '���� �������� �� ������������� �������� 
��������� ����� � ������� � ���� ����. �� ����� ��������� 
�����, �������, ����� ����� �� ���� ��������. � ���� ������� 
� ������������� ��������, ����� �������� ����������� �� ���� �����. 
���� �� ���-�����. ��� �����, ���������� � ����, ������� ������� ��
 ����� ����� �������. ���� � ���������, � ������ ������ �... ��� ����� 
 ������ � ����� �������, ������� �� ������ �� ����'),
('7-08-22', '������� ������ ������ ����� ����� ������. � ������� ��� �����
 ���� ����� �� ������ ������, � �����������. �������������� � ���� � ���������� 
 ���, ������ ���������� ����������� �����������������. ������ �� ����� ����������� 
 ����� ������� ����� ����� �����. �������������� ����� ��� ������� ����� �������� ��� �����.
 � ��� ������ ��� ��������, ����� �������� �������� ���������� ��������, � ����� � 
 ������� ����� ����� ��������� ������� ����� �, ����� ����, ���� �����. ������ ������ 
 �� ��� �� ������� ��������� ������, ������� ����� ��������� ������ �� ���������.
 ������� ������ � ��� �������� ������ ������ ������ ������ ����� ��� � ������ ������ ���������'), 
('10-08-22', '������ � �������������� �������� ������� ������� ��������� ����� ������� �����. 
 ������� ��� ������� ������� � ����������� ������� �����, �� ������� ������� ����� ������� �����, 
 ����������� ���� �����. ��-�� ��� �������� ������ ������������� ���� ����� ���������� ����������� ��� �������'), 
('25-12-22','������ ������������ ��������� � �����-����, ������� ������� � ��� ����������� ������, ����� ������������
 � �������� �������, ��������� ��� ����������'),
('8-07-22', '���� � ��� ��������� � ����������� � �����������, �� ���������� � �� �������� ����� ����������� 
 ������������� ������ ��������� ������������� �������. �� �������� ������� ���������� ����� � ������, ��� ���� 
 �� � �������');

create sequence if not exists comments_id;

create table if not exists "comments" (
id int not null default nextval('comments_id') primary key,
first_name varchar,
Last_name varchar,
nike_name varchar,
comments varchar );

insert into "comments" (first_name, Last_name, nike_name, "comments") values

('���������','��������', 'vally',  '�������� �������'),
('����', '����������', 'Green',  '���� �� ����,��� ��� ����'),
('����', '���������', 'Fence',  '�������� ��� ���'),
('�����', '�������', 'Klava',  '������� ��������'),
('�����', '��������', 'Shlyapa',  '������ �����������');

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
('���������','��������', 'vally',  '3'),
('����', '����������', 'Green',  '1'),
('����', '���������', 'Fence',  '2'),
('�����', '�������', 'Klava',  '3'),
('�����', '��������', 'Shlyapa','2');

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
('�����', '1', '3', '1'),
('����� �� �������', '2', '1', '3'),
('����� ����������', '3', '4', '2'),
('������','4','2','5' ),
('������ ������', '5','5','4');

alter table films add constraint news_fk
foreign  key (news_id) references news(id);

alter table films add constraint comments_fk
foreign  key (comments_id) references comments(id);

alter table films add constraint personal_account_fk
foreign  key (personal_account_id) references personal_account(id);

select personal_account.nike_name, personal_account.subscription_id  from personal_account left join "subscription" 
on personal_account.id="subscription".id;










