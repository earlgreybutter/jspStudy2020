create table tblboard(
num int(11) not null auto_increment,
name varchar(20),
subject varchar(50),
content text,
pos smallint(7) unsigned,
ref smallint(7),
depth smallint(7) unsigned,
regdate date,
pass varchar(15),
ip varchar(15),
count smallint(7) unsigned,
filename varchar(30),
filesize int(11),
primary key(num)
)engine=myisam default charset=utf8;

drop table tblboard;

select * from tblboard; 

select * from tblboard where num=1;
