create table member(
member_no number primary key,
member_id varchar2(20) unique not null,
member_pw varchar2(20) not null,
member_name varchar2(21),
member_grade varchar2(9) not null check(member_grade in('관리자','판매자','사용자')),
member_birthday date,
member_phone varchar2(11) not null,
member_email varchar2(30)
);

create sequence member_no_seq;
drop table member;

insert into member values(member_no_seq.nextval,'admin','admin','관리자','관리자',sysdate,'01012345678','kh2@gmail.com');

create table region(
region_no number primary key,
region_name varchar2(12)
);

create sequence region_no_seq;
drop sequence region_no_seq;

insert into region values(region_no_seq.nextval,'서울시');
insert into region values(region_no_seq.nextval,'부산시');
insert into region values(region_no_seq.nextval,'대구시');
insert into region values(region_no_seq.nextval,'인천시');
insert into region values(region_no_seq.nextval,'광주시');
insert into region values(region_no_seq.nextval,'대전시');
insert into region values(region_no_seq.nextval,'울산시');
insert into region values(region_no_seq.nextval,'세종시');
insert into region values(region_no_seq.nextval,'경기도');
insert into region values(region_no_seq.nextval,'강원도');
insert into region values(region_no_seq.nextval,'충청북도');
insert into region values(region_no_seq.nextval,'충청남도');
insert into region values(region_no_seq.nextval,'전라북도');
insert into region values(region_no_seq.nextval,'전라남도');
insert into region values(region_no_seq.nextval,'경상북도');
insert into region values(region_no_seq.nextval,'경상남도');
insert into region values(region_no_seq.nextval,'제주도');

select * from region;

commit;

create table city(
city_no number PRIMARY key,
region_no constraint fk_city_region references region(region_no),
city_name varchar2(12)
);
drop sequence city_no_seq;
drop table city;
