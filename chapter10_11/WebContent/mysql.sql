# ��Ŭ�������� ���� �����͸� Ȯ���ϰų�, ���̺��� �����ϰų� �� �� ����ϴ� Ŭ���̾�Ʈ tool�̴�.  
# ���â���� sql�� �ۼ� �����ϸ� â�� ������ sql�� ��� ���������, ���� tool�� sql�� �������·� ����� ���� �ִ�. 
select * from extable ;

create table testtable(
	idx int not null, 
	name varchar(20) not null
)engine=innodb default charset=utf8;

insert into testtable values (1,'ȫ�浿'); 
insert into testtable values (2,'��浿'); 
insert into testtable values (3,'��浿'); 

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
('cat', '1111', '�����', '12345','111233','cat@cat.com','000-1111-2222',
'5442','����̳���','���');


