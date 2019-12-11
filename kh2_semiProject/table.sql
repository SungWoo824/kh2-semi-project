create user hostel identified by hostel;
grant connect,resource, create view to hostel;

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
select * from member;

create table region(
region_no number primary key,
region_name varchar2(12) not null,
city_name varchar2(12),
district_name varchar2(12)
);
create sequence region_no_seq;

insert into region values(region_no_seq.nextval,'서울','서울시','종로구');
insert into region values(region_no_seq.nextval,'서울','서울시','중구');
insert into region values(region_no_seq.nextval,'서울','서울시','용산구');
insert into region values(region_no_seq.nextval,'서울','서울시','성동구');
insert into region values(region_no_seq.nextval,'서울','서울시','광진구');
insert into region values(region_no_seq.nextval,'서울','서울시','동대문구');
insert into region values(region_no_seq.nextval,'서울','서울시','중랑구');
insert into region values(region_no_seq.nextval,'서울','서울시','성북구');
insert into region values(region_no_seq.nextval,'서울','서울시','강북구');
insert into region values(region_no_seq.nextval,'서울','서울시','도봉구');
insert into region values(region_no_seq.nextval,'서울','서울시','노원구');
insert into region values(region_no_seq.nextval,'서울','서울시','은평구');
insert into region values(region_no_seq.nextval,'서울','서울시','서대문구');
insert into region values(region_no_seq.nextval,'서울','서울시','마포구');
insert into region values(region_no_seq.nextval,'서울','서울시','양천구');
insert into region values(region_no_seq.nextval,'서울','서울시','강서구');
insert into region values(region_no_seq.nextval,'서울','서울시','구로구');
insert into region values(region_no_seq.nextval,'서울','서울시','금천구');
insert into region values(region_no_seq.nextval,'서울','서울시','영등포구');
insert into region values(region_no_seq.nextval,'서울','서울시','동작구');
insert into region values(region_no_seq.nextval,'서울','서울시','관악구');
insert into region values(region_no_seq.nextval,'서울','서울시','서초구');
insert into region values(region_no_seq.nextval,'서울','서울시','강남구');
insert into region values(region_no_seq.nextval,'서울','서울시','송파구');
insert into region values(region_no_seq.nextval,'서울','서울시','강동구');

insert into region values(region_no_seq.nextval,'부산','부산시','중구');
insert into region values(region_no_seq.nextval,'부산','부산시','서구');
insert into region values(region_no_seq.nextval,'부산','부산시','동구');
insert into region values(region_no_seq.nextval,'부산','부산시','영도구');
insert into region values(region_no_seq.nextval,'부산','부산시','부산진구');
insert into region values(region_no_seq.nextval,'부산','부산시','동래구');
insert into region values(region_no_seq.nextval,'부산','부산시','남구');
insert into region values(region_no_seq.nextval,'부산','부산시','북구');
insert into region values(region_no_seq.nextval,'부산','부산시','강서구');
insert into region values(region_no_seq.nextval,'부산','부산시','해운대구');
insert into region values(region_no_seq.nextval,'부산','부산시','사하구');
insert into region values(region_no_seq.nextval,'부산','부산시','금정구');
insert into region values(region_no_seq.nextval,'부산','부산시','연제구');
insert into region values(region_no_seq.nextval,'부산','부산시','수영구');
insert into region values(region_no_seq.nextval,'부산','부산시','사상구');
insert into region values(region_no_seq.nextval,'부산','부산시','기장군');

insert into region values(region_no_seq.nextval,'대구','대구시','중구');
insert into region values(region_no_seq.nextval,'대구','대구시','동구');
insert into region values(region_no_seq.nextval,'대구','대구시','서구');
insert into region values(region_no_seq.nextval,'대구','대구시','남구');
insert into region values(region_no_seq.nextval,'대구','대구시','북구');
insert into region values(region_no_seq.nextval,'대구','대구시','수성구');
insert into region values(region_no_seq.nextval,'대구','대구시','달서구');
insert into region values(region_no_seq.nextval,'대구','대구시','달성군');

insert into region values(region_no_seq.nextval,'인천','인천시','중구');
insert into region values(region_no_seq.nextval,'인천','인천시','동구');
insert into region values(region_no_seq.nextval,'인천','인천시','미추홀구');
insert into region values(region_no_seq.nextval,'인천','인천시','연수구');
insert into region values(region_no_seq.nextval,'인천','인천시','남동구');
insert into region values(region_no_seq.nextval,'인천','인천시','부평구');
insert into region values(region_no_seq.nextval,'인천','인천시','계양구');
insert into region values(region_no_seq.nextval,'인천','인천시','서구');
insert into region values(region_no_seq.nextval,'인천','인천시','강화군');
insert into region values(region_no_seq.nextval,'인천','인천시','옹진군');

insert into region values(region_no_seq.nextval,'광주','광주시','동구');
insert into region values(region_no_seq.nextval,'광주','광주시','서구');
insert into region values(region_no_seq.nextval,'광주','광주시','남구');
insert into region values(region_no_seq.nextval,'광주','광주시','북구');
insert into region values(region_no_seq.nextval,'광주','광주시','광산구');

insert into region values(region_no_seq.nextval,'대전','대전시','서구');
insert into region values(region_no_seq.nextval,'대전','대전시','중구');
insert into region values(region_no_seq.nextval,'대전','대전시','동구');
insert into region values(region_no_seq.nextval,'대전','대전시','유성구');
insert into region values(region_no_seq.nextval,'대전','대전시','대덕구');

insert into region values(region_no_seq.nextval,'울산','울산시','중구');
insert into region values(region_no_seq.nextval,'울산','울산시','남구');
insert into region values(region_no_seq.nextval,'울산','울산시','동구');
insert into region values(region_no_seq.nextval,'울산','울산시','북구');

insert into region values(region_no_seq.nextval,'세종','세종시','세종시');

insert into region values(region_no_seq.nextval,'경기도','수원시','');
insert into region values(region_no_seq.nextval,'경기도','성남시','');
insert into region values(region_no_seq.nextval,'경기도','안양시','');
insert into region values(region_no_seq.nextval,'경기도','안산시','');
insert into region values(region_no_seq.nextval,'경기도','광명시','');
insert into region values(region_no_seq.nextval,'경기도','평택시','');
insert into region values(region_no_seq.nextval,'경기도','과천시','');
insert into region values(region_no_seq.nextval,'경기도','오산시','');
insert into region values(region_no_seq.nextval,'경기도','시흥시','');
insert into region values(region_no_seq.nextval,'경기도','군포시','');
insert into region values(region_no_seq.nextval,'경기도','의왕시','');
insert into region values(region_no_seq.nextval,'경기도','하남시','');
insert into region values(region_no_seq.nextval,'경기도','이천시','');
insert into region values(region_no_seq.nextval,'경기도','안성시','');
insert into region values(region_no_seq.nextval,'경기도','김포시','');
insert into region values(region_no_seq.nextval,'경기도','화성시','');
insert into region values(region_no_seq.nextval,'경기도','광주시','');
insert into region values(region_no_seq.nextval,'경기도','여주시','');
insert into region values(region_no_seq.nextval,'경기도','부천시','');
insert into region values(region_no_seq.nextval,'경기도','양평군','');
insert into region values(region_no_seq.nextval,'경기도','고양시','');
insert into region values(region_no_seq.nextval,'경기도','의정부시','');
insert into region values(region_no_seq.nextval,'경기도','동두천시','');
insert into region values(region_no_seq.nextval,'경기도','구리시','');
insert into region values(region_no_seq.nextval,'경기도','남양주시','');
insert into region values(region_no_seq.nextval,'경기도','파주시','');
insert into region values(region_no_seq.nextval,'경기도','양주시','');
insert into region values(region_no_seq.nextval,'경기도','포천시','');
insert into region values(region_no_seq.nextval,'경기도','연천군','');
insert into region values(region_no_seq.nextval,'경기도','가평군','');

insert into region values(region_no_seq.nextval,'강원도','춘천시','');
insert into region values(region_no_seq.nextval,'강원도','원주시','');
insert into region values(region_no_seq.nextval,'강원도','강릉시','');
insert into region values(region_no_seq.nextval,'강원도','동해시','');
insert into region values(region_no_seq.nextval,'강원도','태백시','');
insert into region values(region_no_seq.nextval,'강원도','속초시','');
insert into region values(region_no_seq.nextval,'강원도','삼척시','');
insert into region values(region_no_seq.nextval,'강원도','홍천군','');
insert into region values(region_no_seq.nextval,'강원도','횡성군','');
insert into region values(region_no_seq.nextval,'강원도','영월군','');
insert into region values(region_no_seq.nextval,'강원도','평창군','');
insert into region values(region_no_seq.nextval,'강원도','정선군','');
insert into region values(region_no_seq.nextval,'강원도','철원군','');
insert into region values(region_no_seq.nextval,'강원도','화천군','');
insert into region values(region_no_seq.nextval,'강원도','양구군','');
insert into region values(region_no_seq.nextval,'강원도','인제군','');
insert into region values(region_no_seq.nextval,'강원도','고성군','');
insert into region values(region_no_seq.nextval,'강원도','양양군','');

insert into region values(region_no_seq.nextval,'충청북도','청주시','');
insert into region values(region_no_seq.nextval,'충청북도','충주시','');
insert into region values(region_no_seq.nextval,'충청북도','제천시','');
insert into region values(region_no_seq.nextval,'충청북도','보은군','');
insert into region values(region_no_seq.nextval,'충청북도','옥천군','');
insert into region values(region_no_seq.nextval,'충청북도','영동군','');
insert into region values(region_no_seq.nextval,'충청북도','진천군','');
insert into region values(region_no_seq.nextval,'충청북도','괴산군','');
insert into region values(region_no_seq.nextval,'충청북도','음성군','');
insert into region values(region_no_seq.nextval,'충청북도','단양군','');
insert into region values(region_no_seq.nextval,'충청북도','증평군','');

insert into region values(region_no_seq.nextval,'충청남도','천안시','');
insert into region values(region_no_seq.nextval,'충청남도','공주시','');
insert into region values(region_no_seq.nextval,'충청남도','보령시','');
insert into region values(region_no_seq.nextval,'충청남도','아산시','');
insert into region values(region_no_seq.nextval,'충청남도','서산시','');
insert into region values(region_no_seq.nextval,'충청남도','논산시','');
insert into region values(region_no_seq.nextval,'충청남도','계룡시','');
insert into region values(region_no_seq.nextval,'충청남도','당진시','');
insert into region values(region_no_seq.nextval,'충청남도','금산군','');
insert into region values(region_no_seq.nextval,'충청남도','부여군','');
insert into region values(region_no_seq.nextval,'충청남도','서천군','');
insert into region values(region_no_seq.nextval,'충청남도','청양군','');
insert into region values(region_no_seq.nextval,'충청남도','홍성군','');
insert into region values(region_no_seq.nextval,'충청남도','예산군','');
insert into region values(region_no_seq.nextval,'충청남도','태안군','');

insert into region values(region_no_seq.nextval,'전라북도','전주시','');
insert into region values(region_no_seq.nextval,'전라북도','군산시','');
insert into region values(region_no_seq.nextval,'전라북도','익산시','');
insert into region values(region_no_seq.nextval,'전라북도','정읍시','');
insert into region values(region_no_seq.nextval,'전라북도','남원시','');
insert into region values(region_no_seq.nextval,'전라북도','김제시','');
insert into region values(region_no_seq.nextval,'전라북도','완주군','');
insert into region values(region_no_seq.nextval,'전라북도','진안군','');
insert into region values(region_no_seq.nextval,'전라북도','무주군','');
insert into region values(region_no_seq.nextval,'전라북도','장수군','');
insert into region values(region_no_seq.nextval,'전라북도','임실군','');
insert into region values(region_no_seq.nextval,'전라북도','순창군','');
insert into region values(region_no_seq.nextval,'전라북도','고창군','');
insert into region values(region_no_seq.nextval,'전라북도','부안군','');

insert into region values(region_no_seq.nextval,'전라남도','목포시','');
insert into region values(region_no_seq.nextval,'전라남도','여수시','');
insert into region values(region_no_seq.nextval,'전라남도','순천시','');
insert into region values(region_no_seq.nextval,'전라남도','나주시','');
insert into region values(region_no_seq.nextval,'전라남도','광양시','');
insert into region values(region_no_seq.nextval,'전라남도','담양군','');
insert into region values(region_no_seq.nextval,'전라남도','곡성군','');
insert into region values(region_no_seq.nextval,'전라남도','구례군','');
insert into region values(region_no_seq.nextval,'전라남도','고흥군','');
insert into region values(region_no_seq.nextval,'전라남도','보성군','');
insert into region values(region_no_seq.nextval,'전라남도','화순군','');
insert into region values(region_no_seq.nextval,'전라남도','장흥군','');
insert into region values(region_no_seq.nextval,'전라남도','강진군','');
insert into region values(region_no_seq.nextval,'전라남도','해남군','');
insert into region values(region_no_seq.nextval,'전라남도','영암군','');
insert into region values(region_no_seq.nextval,'전라남도','무안군','');
insert into region values(region_no_seq.nextval,'전라남도','함평군','');
insert into region values(region_no_seq.nextval,'전라남도','영광군','');
insert into region values(region_no_seq.nextval,'전라남도','장성군','');
insert into region values(region_no_seq.nextval,'전라남도','완도군','');
insert into region values(region_no_seq.nextval,'전라남도','진도군','');
insert into region values(region_no_seq.nextval,'전라남도','신안군','');

insert into region values(region_no_seq.nextval,'경상북도','포항시','');
insert into region values(region_no_seq.nextval,'경상북도','경주시','');
insert into region values(region_no_seq.nextval,'경상북도','김천시','');
insert into region values(region_no_seq.nextval,'경상북도','안동시','');
insert into region values(region_no_seq.nextval,'경상북도','구미시','');
insert into region values(region_no_seq.nextval,'경상북도','영주시','');
insert into region values(region_no_seq.nextval,'경상북도','영천시','');
insert into region values(region_no_seq.nextval,'경상북도','상주시','');
insert into region values(region_no_seq.nextval,'경상북도','문경시','');
insert into region values(region_no_seq.nextval,'경상북도','경산시','');
insert into region values(region_no_seq.nextval,'경상북도','군위군','');
insert into region values(region_no_seq.nextval,'경상북도','의성군','');
insert into region values(region_no_seq.nextval,'경상북도','청송군','');
insert into region values(region_no_seq.nextval,'경상북도','영양군','');
insert into region values(region_no_seq.nextval,'경상북도','영덕군','');
insert into region values(region_no_seq.nextval,'경상북도','청도군','');
insert into region values(region_no_seq.nextval,'경상북도','고령군','');
insert into region values(region_no_seq.nextval,'경상북도','성주군','');
insert into region values(region_no_seq.nextval,'경상북도','칠곡군','');
insert into region values(region_no_seq.nextval,'경상북도','예천군','');
insert into region values(region_no_seq.nextval,'경상북도','봉화군','');
insert into region values(region_no_seq.nextval,'경상북도','울진군','');
insert into region values(region_no_seq.nextval,'경상북도','울릉군','');

insert into region values(region_no_seq.nextval,'경상남도','창원시','');
insert into region values(region_no_seq.nextval,'경상남도','진주시','');
insert into region values(region_no_seq.nextval,'경상남도','통영시','');
insert into region values(region_no_seq.nextval,'경상남도','사천시','');
insert into region values(region_no_seq.nextval,'경상남도','김해시','');
insert into region values(region_no_seq.nextval,'경상남도','밀양시','');
insert into region values(region_no_seq.nextval,'경상남도','거제시','');
insert into region values(region_no_seq.nextval,'경상남도','양산시','');
insert into region values(region_no_seq.nextval,'경상남도','의령군','');
insert into region values(region_no_seq.nextval,'경상남도','함안군','');
insert into region values(region_no_seq.nextval,'경상남도','창녕군','');
insert into region values(region_no_seq.nextval,'경상남도','고성군','');
insert into region values(region_no_seq.nextval,'경상남도','남해군','');
insert into region values(region_no_seq.nextval,'경상남도','하동군','');
insert into region values(region_no_seq.nextval,'경상남도','산청군','');
insert into region values(region_no_seq.nextval,'경상남도','함양군','');
insert into region values(region_no_seq.nextval,'경상남도','거창군','');
insert into region values(region_no_seq.nextval,'경상남도','합천군','');

insert into region values(region_no_seq.nextval,'제주도','제주시','');
insert into region values(region_no_seq.nextval,'제주도','서귀포시','');

select * from region;
                                        
create table hostel(
hostel_no number primary key,
owner_no number not null CONSTRAINT fk_hostel_member_no references member(member_no),
region_no number not null constraint fk_hostel_region_no references region(region_no),
hostel_name varchar2(50) not null,
hostel_phone varchar2(11) not null,
hostel_detail_addr varchar2(255),
hostel_latitude varchar2(10),
hostel_longitude varchar2(10),
hostel_content varchar2(4000),
hostel_kind_name varchar2(21) not null
);
create sequence hostel_no_seq;
create table room_info(
room_no number primary key,
hostel_no number constraint fk_room_hostel_no references hostel(hostel_no),
region_no number constraint fk_room_region_no references region(region_no),
room_price number not null,
room_standard_people number,
room_max_people number,
room_bed number,
room_bath number,
room_spa varchar2(1),
room_cook varchar2(1),
room_content varchar2(4000)
);
create sequence room_no_seq;
create table qa(
qa_no number primary key,
room_no number constraint fk_qa_room_no references room_info(room_no),
member_no number constraint fk_qa_member_no references member(member_no),
qa_head varchar2(6),
qa_title varchar2(60) not null,
qa_content varchar2(4000) not null,
qa_wdate date default sysdate
);
create sequence qa_no_seq;
create table qa_reply(
qa_reply_no number primary key,
qa_no number constraint fk_reply_qa_no references qa(qa_no),
member_no number constraint fk_reply_member_no references member(member_no),
qa_reply_content varchar2(4000) not null,
qa_reply_wdate date default sysdate not null
);
create sequence qa_reply_no_seq;

create table couponlist(
coupon_no number primary key,
coupon_name varchar2(255) not null,
coupon_rate number not null,
coupon_date date not null,
coupon_explain varchar2(255) not null
);

create table havecoupon(
coupon_no number constraint fk_havecoupon_couponlist_no references couponlist(coupon_no),
member_no number constraint fk_havecoupon_member_no references member(member_no)
);

create table interest_room(
hostel_no number constraint fk_interest_hostel_no references hostel(hostel_no),
member_no number constraint fk_interest_member_no references member(member_no)
);

create table reservation_list(
reservation_no number primary key,
room_no number constraint fk_reservation_room_no references room_info(room_no),
customer_no number constraint fk_reservation_member_no references member(member_no),
customer_request varchar2(4000)
);
create sequence reservation_no_seq;
