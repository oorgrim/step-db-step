create table student(
	id int identity primary key,
	fio nvarchar(100),
	address nvarchar(100),
	scholarship float
)


create table groups (
	d int identity primary key,
	gName nvarchar(100)
)

create table groups_student (
	id int identity primary key,
	studentId int foreign key references student(id),
	groupsId int foreign key references groups(d)

)	



insert into student (fio, address, scholarship ) values ('Catina Fawcitt', '4766 Buena Vista Trail', 2737);
insert into student (fio, address, scholarship ) values ('Shaw Rosborough', '78498 4th Lane', 1791);
insert into student (fio, address, scholarship ) values ('Amabelle Bard', '4 Milwaukee Trail', 2767);
insert into student (fio, address, scholarship ) values ('Ignaz Saiz', '73 Westport Road', 5968);
insert into student (fio, address, scholarship ) values ('Junie Inchbald', '4 Continental Plaza', 5005);
insert into student (fio, address, scholarship ) values ('Tedmund Seakin', '441 Glacier Hill Way', 6698);
insert into student (fio, address, scholarship ) values ('Sylvia Sharma', '47 Nelson Center', 9486);
insert into student (fio, address, scholarship ) values ('Zeb Brocklehurst', '6678 Kinsman Court', 5120);
insert into student (fio, address, scholarship ) values ('Erastus Serraillier', '5763 Graceland Place', 6183);
insert into student (fio, address, scholarship ) values ('Inessa Mendes', '2756 Thompson Avenue', 8118);


insert into groups_student (studentId, groupsId) values (2, 4);
insert into groups_student (studentId, groupsId) values (3, 2);
insert into groups_student (studentId, groupsId) values (8, 3);
insert into groups_student (studentId, groupsId) values (3, 2);
insert into groups_student (studentId, groupsId) values (3, 10);
insert into groups_student (studentId, groupsId) values (6, 9);
insert into groups_student (studentId, groupsId) values (9, 2);
insert into groups_student (studentId, groupsId) values (3, 10);
insert into groups_student (studentId, groupsId) values (6, 5);
insert into groups_student (studentId, groupsId) values (5, 9);
insert into groups_student (studentId, groupsId) values (9, 5);
insert into groups_student (studentId, groupsId) values (1, 3);
insert into groups_student (studentId, groupsId) values (7, 2);
insert into groups_student (studentId, groupsId) values (5, 2);
insert into groups_student (studentId, groupsId) values (2, 5);

insert into student 
values('ivan', 'abay', 505.5)

select * 
from groups

-- пароль nastya1102
-- если при лобавлении  нового студента
-- такой уже есть, то добавлять ему порядкоыфй номер в конце фамилии

alter trigger task1 
on student 
after insert
as 
declare @c int = (select count(*) from student where fio like (select fio from inserted))
if (@c > 1)
begin 
	update student
	--set fio = fio + @c -- неправильный вид
	set fio = fio + CONVERT(NVARCHAR(10), @c)

	where id = (select id inserted)
end




-- запретить удаление студентов


alter trigger task2 
on student 
instead of delete
as
--select 'error'
select 'Нельзя удалить ' + fio    
from deleted

delete from student
where id = 1



select * 
from student as s join groups_student as gs
on gs.studentId = s.id join groups as g
on g.d = gs.groupsId

-- посчитать view которое считает кол-во студентов в каждой группе

create view tsk3 as
select count(*) as 'count', g.gName
from student as s join groups_student as gs
on gs.studentId = s.id join groups as g
on g.d = gs.groupsId
group by g.gName



select * from tsk3

SELECT avg(count) from tsk3

-- создать трииггер который находит авг студентов во всех группах 
-- и не добавляет нового студента в группу если колво превышает авг

alter trigger task4 
on groups_student
instead of insert
as
declare @avg int = (select avg(count) from tsk3)
declare @curGr int = (select groupsId from inserted)
declare @curCount int = (select count(*)
							from groups_student
							where groupsId = @curGr)
if (@avg > @curCount)
begin
	insert into groups_student (studentId, groupsId)
	select studentId, groupsId
	from inserted
end

--declare select avg(count) from tsk3

insert into groups_student
values(5, 5)

create table tovar (
	id int identity primary key,
	name nvarchar(30),
	type nvarchar(30),
	num_of int,
	own_price float,
	producer nvarchar(30),
	price float,
	archive bit
)

create table employers (
	id int identity primary key,
	fio nvarchar(50),
	status nvarchar(100),
	data datetime,
	gender bit,
	salary float
)

create table clients (
	id int identity primary key,
	fio nvarchar(100),
	email nvarchar(100),
	contactnum nvarchar(100),
	gender bit,
	sale float,
	subscribed bit
)

create table sales (
	id int identity primary key,
	cost float,
	amount int,
	datee datetime,
	tovarId int references tovar(id),
	clientId int references 
)		