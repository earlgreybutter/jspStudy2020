# 이클립스에서 직접 데이터를 확인하거나, 테이블을 생성하거나 할 때 사용하는 클라이언트 tool이다.  
# 명령창에서 sql을 작성 실행하면 창을 닫으면 sql이 모두 사라지지만, 현재 tool은 sql을 파일형태로 기록할 수가 있다. 
select * from extable ;

create table testtable(
	idx int not null, 
	name varchar(20) not null
)engine=innodb default charset=utf8;

insert into testtable values (1,'홍길동'); 
insert into testtable values (2,'김길동'); 
insert into testtable values (3,'고길동'); 

select * from testtable;

show tables;

create table tblRegister (
id	varchar(20) not null,
pwd	varchar(20) not null,
name char(6) null,
num1 char(6) null,
num2 char(7) null,
email varchar(30) null,
phone varchar(30) null,
zipcode char(5) null,
address varchar(60) null,
job varchar(30) null
)engine=innodb default charset=utf8;

insert into tblRegister values
('cat', '1111', '고양이', '12345','111233','cat@cat.com','000-1111-2222',
'5442','고양이네집','백수');


