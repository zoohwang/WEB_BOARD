create table board
(
     idx int(10) NOT NULL AUTO_INCREMENT,
     title varchar(200) not null,
     writer varchar(20) not null,
     regdate varchar(20) not null,
     count int(10),
     content MEDIUMTEXT,
    PRIMARY KEY(idx)
);

���߿� �߰�.
alter table board add regip varchar(20);
alter table board add filename varchar(50);