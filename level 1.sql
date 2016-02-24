create table sunil1 
( 
id varchar(6) check(id like 'Y%'), 
sex enum('M','F') not null, 
dob date check((YEAR(curdate)-YEAR(date))<30), 
tep varchar(10) not null
);

create table std
     (
     cid varchar(5) unique,
     instr varchar(40) not null,
     course_time varchar(1) not null,
     check(cid not like 'CS%' and course_time='2')
     );

alter table sunil1
    add constraint pk primary key(id);
alter table std
    add constraint sd check(instr like 'PROF%');
insert into sunil1 values('Y12345','M','2000-01-01',6784374545);
insert into sunil1 values('T12345','t','1900-01-01',6784374545);

create trigger hello11 before insert on sunil1 
for each row 
begin 
declare msg varchar(56) 
if new.id not like 'Y%' 
then set msg='eoor' ; 
end if; 
end
//