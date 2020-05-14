CREATE table tblpollList (
	num smallint(6) not null auto_increment,
	question varchar(200) not null default '',
	sdate date DEFAULT NULL,
	edate date DEFAULT NULL,
	wdate date DEFAULT NULL,
	`type` smallint(6) NOT NULL DEFAULT '1',
	active smallint(6) DEFAULT '1',
	primary key(num)
)engine=innodb default charset=utf8;

create table tblPollItem (
	listnum smallint(6) not null,
	itemnum smallint(6) not null default '0',
	item varchar(50) not null default '',
	count smallint(6) not null default 0,
	primary key(listnum, itemnum)
)engine=innodb default charset=utf8;