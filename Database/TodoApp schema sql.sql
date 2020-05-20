create database todoApp
go

use todoApp
go

create table users (
	id int identity(100,1), 
	fullName varchar(32) not null,
	email varchar(64) primary key,
	password varchar(64) not null,
	authority varchar(32),
	createOn smalldatetime,
	isActive bit,
);
go

create table todo(
	id int primary key identity(100,1),
	title varchar(255) not null,
	userEmail varchar(64) not null foreign key references users(email) on delete cascade on update cascade
					);
go

create proc createUser
	@fullName varchar(32),
	@email varchar(64),
	@password varchar(64),
	@authority varchar(32) = 'ROLE_USER',
	@isActive bit = 1
	
as
begin
	insert into users(fullName,email,password, authority, createOn,isActive) 
	values(@fullName, @email, @password, @authority, GETDATE(), @isActive);
end
go

exec createUser 'masbha','masbha@gmail.com','123','ROLE_ADMIN'
go

create proc selectAllUser
as
begin
	select * from users
end
go

exec selectAllUser
go

create proc selectSingleUser
	@email varchar(64)
as
begin
	select * from users where email = @email
end
go

exec selectSingleUser 'masbha@gmail.com'
go

create proc deleteUser
	@email varchar(64)
as
begin
 delete from users where email = @email;
end
go

execute deleteUser 'masbhauddi@gmail.com'
go

create proc updateUser
	@email varchar(64),
	@fullName varchar(32) = null,
	@pass varchar(64) = null
as
begin
	update users set fullName = ISNULL(@fullName, fullName),
	password = ISNULL(@pass, password)
					
	where email = @email;
end
go

exec updateUser 'masbha@gmail.com', null, '456'
go


create proc createTodo
	@title varchar(255),
	@userEmail varchar(32)
as
begin
	insert into todo (title, userEmail)
	values (@title, @userEmail)
end
go

execute createTodo 'hello puja','puja@gmail.com'
go

create proc updateTodo 
	@id int,
	@title varchar(255)
as
begin
	update todo set title = ISNULL(@title, title) where id = @id
end
go

exec updateTodo 101, 'updated hello world'
go

create proc selectTodo
as
begin
	select * from todo
end
go

exec selectTodo
go

create proc deleteTodo
	@id int
as
begin
	delete from todo where id = @id
end
go

execute deleteTodo 101
go