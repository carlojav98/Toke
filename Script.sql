  
create database DB_boxing

use DB_boxing
CREATE TABLE users
(
	id_user int IDENTITY(1,1) primary key,
	names varchar (50),
	lastname  varchar (50),
	birthdate date,
	mail varchar (50) ,
	users  varchar (50),
	pass varchar (50),
	token varchar(max) ,
	states bit 
) 



CREATE PROCEDURE sp_register
@names VARCHAR(50),
@lastname VARCHAR(50),
@birthdate date,
@mail VARCHAR(50),
@users VARCHAR(50),
@Pass VARCHAR(50),
@token VARCHAR(max),
@states bit
AS BEGIN
INSERT INTO users VALUES(@names, @lastname, @birthdate, @mail, @users, @Pass, @token, @states)
END




CREATE PROCEDURE sp_validate

@token VARCHAR(max)
AS BEGIN
DECLARE @mail VARCHAR(100)
SET @mail=(SELECT mail from users where token=@token)
Update users set states=1 where Token=@Token
Update users set token=null where mail=@mail
END

