USE Proj02

DROP TABLE LikeTypes;
DROP TABLE LikeRegions;
DROP TABLE EventTypes;
DROP TABLE Regions;
DROP TABLE Photos;
DROP TABLE Blogs;
DROP TABLE Members;

/*�|��*/
CREATE TABLE Members 
(
/*MemberId int identity (1,1) not null,             �|��ID*/
MemberEmail varchar(50),                          /*�|���b��email*/
MemberPassword varchar(20),                       /*�|���K�X*/
MemberNickname varchar(20),                       /*�|���ʺ�*/
MemberGender varchar(4),                          /*�ʧO*/	
MemberBdate date,                                 /*�|���ͤ�*/
MemberPhoto varbinary(max),                       /*�j�Y��*/
MemberEpaper bit,                                 /*�O�_�q�\�q�l��*/
MemberType varchar(10),                           /*�|������*/
MemberRole varchar(10),                           /*�|������*/
CONSTRAINT PK_Members_MemberEmail PRIMARY KEY CLUSTERED (MemberEmail) /*Members.MemberEmail���D��*/
);

/*�|�������
INSERT INTO Members VALUES('aaa@gmail.com', 'abc123', '�p�p', '�k��', '2000-12-22', null, 1, null, null);
INSERT INTO Members VALUES('bbb@gmail.com', 'abc123', '�j�j', '�k��', '2000-12-22', null, 1, null, null);
INSERT INTO Members VALUES('ccc@gmail.com', 'abc123', '����', '�k��', '2000-12-22', null, 1, null, null);
INSERT INTO Members VALUES('ddd@gmail.com', 'zzz', null, null, null, null, null, null, null);
INSERT INTO Members (memberemail, memberpassword) VALUES('eee@gmail.com', 'eee');
*/

/*EventTypes*/
CREATE TABLE EventTypes
(
TypeId int identity(1,1) not null,                 
/*TypeId int,                                      �ߦn����ID*/
Type varchar(20),                                  /*�����W��*/
CONSTRAINT PK_Type_Type PRIMARY KEY CLUSTERED (Type) /*EventTypes.Type���D��*/
);

insert into EventTypes values ('��t�U�H');
insert into EventTypes values ('�i���s��');
insert into EventTypes values ('���ֲ{��');
insert into EventTypes values ('���y���');
insert into EventTypes values ('�q�v�A��');
insert into EventTypes values ('�����U�ᵩ');
insert into EventTypes values ('�ˤl����');
insert into EventTypes values ('��~��}');

/*Regions*/
create table Regions                                  
(
Region varchar(20),                                  /*�a�ϦW��*/
RegionCode int not null,
CONSTRAINT PK_Region_Region PRIMARY KEY CLUSTERED (Region) /*Regions.RegionId���D��*/
);

insert into Regions values ('����', '100');
insert into Regions values ('�j�P', '103');
insert into Regions values ('���s', '104');
insert into Regions values ('�Q�s', '105');
insert into Regions values ('�j�w', '106');
insert into Regions values ('�U��', '108');
insert into Regions values ('�H�q', '110');
insert into Regions values ('�h�L', '111');
insert into Regions values ('�_��', '112');
insert into Regions values ('����', '114');
insert into Regions values ('�n��', '115');
insert into Regions values ('��s', '116');


CREATE TABLE LikeTypes
(
MemberEmail varchar(50) FOREIGN KEY REFERENCES Members(MemberEmail)
ON DELETE CASCADE    
ON UPDATE CASCADE,
Type varchar(20) FOREIGN KEY REFERENCES EventTypes(Type)
ON DELETE CASCADE    
ON UPDATE CASCADE,
primary key(MemberEmail,Type)
);

/*
insert into LikeTypes values ('aaa@gmail.com','��t�U�H')
insert into LikeTypes values ('aaa@gmail.com','�i���s��')
insert into LikeTypes values ('aaa@gmail.com','��~��}')
insert into LikeTypes values ('aaa@gmail.com','�����U�ᵩ')
insert into LikeTypes values ('bbb@gmail.com','��t�U�H')
insert into LikeTypes values ('bbb@gmail.com','�i���s��')
insert into LikeTypes values ('ccc@gmail.com','�q�v�A��')
*/

create table LikeRegions
(
MemberEmail varchar(50) FOREIGN KEY REFERENCES Members(MemberEmail)
ON DELETE CASCADE    
ON UPDATE CASCADE,
Region varchar(20) FOREIGN KEY REFERENCES Regions(Region)
ON DELETE CASCADE    
ON UPDATE CASCADE,
primary key(MemberEmail,Region)
);

/*
insert into LikeRegions values ('aaa@gmail.com','�j�w')
insert into LikeRegions values ('aaa@gmail.com','�U��')
insert into LikeRegions values ('bbb@gmail.com','�j�w')
insert into LikeRegions values ('bbb@gmail.com','�U��')
insert into LikeRegions values ('ccc@gmail.com','�j�w')
insert into LikeRegions values ('ccc@gmail.com','����')
*/

CREATE TABLE Blogs
(
ArticleId int identity(1,1) PRIMARY KEY,
ArticleName varchar(20),
ArticleContent varchar(max),
PostTime smalldatetime,
ArticleType varchar(20),
Pravicy bit,
LikeNum int,
ViewNum int,
MemberEmail varchar(50) FOREIGN KEY REFERENCES Members(MemberEmail),
);

CREATE TABLE Photos
(
PhotoId int identity(1,1) PRIMARY KEY,
Photo varbinary(max),
ArticleId int FOREIGN KEY REFERENCES Blogs(ArticleId)
);