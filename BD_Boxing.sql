create database box
use box

CREATE TABLE users
(
	iduser int IDENTITY(1,1) primary key,
	names varchar (50),
	lastname  varchar (50),
	birthdate date,
	mail varchar (50) ,
	phone int,
	users  varchar (50),
	pass varbinary(max),
	token varchar(max) ,
	states bit 
	
) 


create procedure sp_validate_user
@users varchar (100),
@pass varchar (100),
@patroness varchar (50)
as
begin 
select* from users where @users=@users and convert (varchar(100),ENCRYPTBYPASSPHRASE(@patroness,pass))=@pass
end

select* from users

CREATE PROCEDURE sp_validate
@token VARCHAR(max)
AS BEGIN
DECLARE @mail VARCHAR(100)
SET @mail=(SELECT mail from users where token=@token)
Update users set states=1 where Token=@Token
Update users set token=null where mail=@mail
END



CREATE PROCEDURE sp_register
@names VARCHAR(50),
@lastname VARCHAR(50),
@birthdate date,
@mail VARCHAR(50),
@phone int,
@users VARCHAR(50),
@patroness varchar(50),
@Pass VARCHAR(50),
@token VARCHAR(max),
@states bit
AS BEGIN
INSERT INTO users VALUES(@names, @lastname, @birthdate, @mail,@phone, @users, ENCRYPTBYPASSPHRASE(@patroness,@pass),@token, @states)
END