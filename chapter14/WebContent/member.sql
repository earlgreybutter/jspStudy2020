create table tblmember(
id char(20) not null primary key,
pwd char(20) not null,
name char(20) not null,
gender char(1) not null,
birthday char(6) not null,
email char(30) not null,
zipcode char(5) not null,
address char(50) not null,
hobby char(5) not null,
job char(20) not null
)engine=innodb default charset=utf8;

create table tblzipcode(
zipcode char(5) not null,
area1 char(10) default null,
area2 char(20) default null,
area3 char(30) default null
)engine=innodb default charset=utf8;


# �����ȣ�� �ѹ� �Է��ϰ� �Ǹ� ������������ ������Ʈ �Ҷ����� 
# �ַ� �˻��� �ϰ� �ǹǷ� char�� �ϴ� ���� ���� 
# 

desc tblzipcode;

