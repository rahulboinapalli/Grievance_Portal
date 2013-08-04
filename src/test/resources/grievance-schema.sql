drop table grievance if exists;

create table grievance (memberId bigint,
memberName varchar(200),requestType varchar(200), comments varchar(200), primary key (memberId));