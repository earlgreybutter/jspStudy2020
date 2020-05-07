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


# 우편번호를 한번 입력하게 되면 다음버전으로 업데이트 할때까지 
# 주로 검색만 하게 되므로 char로 하는 것이 적합 
# 

desc tblzipcode;

