USE Proj02

DROP TABLE LikeTypes;
DROP TABLE LikeRegions;
DROP TABLE EventTypes;
DROP TABLE Regions;
DROP TABLE Photos;
DROP TABLE Blogs;
DROP TABLE Members;

/*會員*/
CREATE TABLE Members 
(
/*MemberId int identity (1,1) not null,             會員ID*/
MemberEmail varchar(50),                          /*會員帳號email*/
MemberPassword varchar(20),                       /*會員密碼*/
MemberNickname varchar(20),                       /*會員暱稱*/
MemberGender varchar(4),                          /*性別*/	
MemberBdate date,                                 /*會員生日*/
MemberPhoto varbinary(max),                       /*大頭照*/
MemberEpaper bit,                                 /*是否訂閱電子報*/
MemberType varchar(10),                           /*會員類型*/
MemberRole varchar(10),                           /*會員角色*/
CONSTRAINT PK_Members_MemberEmail PRIMARY KEY CLUSTERED (MemberEmail) /*Members.MemberEmail為主鍵*/
);

/*會員假資料
INSERT INTO Members VALUES('aaa@gmail.com', 'abc123', '小小', '女生', '2000-12-22', null, 1, null, null);
INSERT INTO Members VALUES('bbb@gmail.com', 'abc123', '大大', '女生', '2000-12-22', null, 1, null, null);
INSERT INTO Members VALUES('ccc@gmail.com', 'abc123', '中中', '女生', '2000-12-22', null, 1, null, null);
INSERT INTO Members VALUES('ddd@gmail.com', 'zzz', null, null, null, null, null, null, null);
INSERT INTO Members (memberemail, memberpassword) VALUES('eee@gmail.com', 'eee');
*/

/*EventTypes*/
CREATE TABLE EventTypes
(
TypeId int identity(1,1) not null,                 
/*TypeId int,                                      喜好類型ID*/
Type varchar(20),                                  /*類型名稱*/
CONSTRAINT PK_Type_Type PRIMARY KEY CLUSTERED (Type) /*EventTypes.Type為主鍵*/
);

insert into EventTypes values ('表演萬象');
insert into EventTypes values ('展覽廣場');
insert into EventTypes values ('音樂現場');
insert into EventTypes values ('講座研習');
insert into EventTypes values ('電影瞭望');
insert into EventTypes values ('城市萬花筒');
insert into EventTypes values ('親子活動');
insert into EventTypes values ('戶外行腳');

/*Regions*/
create table Regions                                  
(
Region varchar(20),                                  /*地區名稱*/
RegionCode int not null,
CONSTRAINT PK_Region_Region PRIMARY KEY CLUSTERED (Region) /*Regions.RegionId為主鍵*/
);

insert into Regions values ('中正', '100');
insert into Regions values ('大同', '103');
insert into Regions values ('中山', '104');
insert into Regions values ('松山', '105');
insert into Regions values ('大安', '106');
insert into Regions values ('萬華', '108');
insert into Regions values ('信義', '110');
insert into Regions values ('士林', '111');
insert into Regions values ('北投', '112');
insert into Regions values ('內湖', '114');
insert into Regions values ('南港', '115');
insert into Regions values ('文山', '116');


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
insert into LikeTypes values ('aaa@gmail.com','表演萬象')
insert into LikeTypes values ('aaa@gmail.com','展覽廣場')
insert into LikeTypes values ('aaa@gmail.com','戶外行腳')
insert into LikeTypes values ('aaa@gmail.com','城市萬花筒')
insert into LikeTypes values ('bbb@gmail.com','表演萬象')
insert into LikeTypes values ('bbb@gmail.com','展覽廣場')
insert into LikeTypes values ('ccc@gmail.com','電影瞭望')
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
insert into LikeRegions values ('aaa@gmail.com','大安')
insert into LikeRegions values ('aaa@gmail.com','萬華')
insert into LikeRegions values ('bbb@gmail.com','大安')
insert into LikeRegions values ('bbb@gmail.com','萬華')
insert into LikeRegions values ('ccc@gmail.com','大安')
insert into LikeRegions values ('ccc@gmail.com','中正')
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