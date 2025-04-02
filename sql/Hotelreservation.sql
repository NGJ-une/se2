--로그인 / 회원 가입 테이블 생성 
CREATE TABLE member( 
    id varchar2(30) primary key, --아이디 
    idx number(5) unique not null, --회원번호
    pwd varchar2(50) not null, --비밀번호
    fname varchar2(50) not null, --이름
    lname varchar2(50) not null, --성
    birth date not null, --생년월일
    email varchar2(100) not null, --이메일
    tel varchar2(50) not null, --전화번호
    addr varchar2(150) not null, -- 주소
    grade varchar2(50) default 'BRONZE', --등급 (외래키) 
    join_date date not null, -- 가입날짜
    point number(10) default 0, --누적포인트 
    money number(10) default 0, --사용가능금액  
    question number(2) not null, --질문번호 (외래키) 
    answer varchar2(50) not null, --답변 
    
    constraint fk_grade foreign key(grade) references grade(grade),
    constraint fk_question foreign key(question) references question(question)
)

--등급 테이블 생성  
CREATE TABLE grade (
    grade varchar2(50) primary key, --등급 
    min_point number(10) not null, --최소 포인트  
    max_point number(10) not null, -- 최대 포이트  
    discount number(10) not null --할인율
)

--질문 테이블 생성
CREATE TABLE question (
    question number(2) primary key, -- 질문번호
    content varchar(50) not null -- 질문내용 
) 

--예약 테이블 생성 
CREATE TABLE reser (
    idx number(5) primary key, --예약번호  
    id varchar2(50) unique not null, --아이디 (외래키) 
    name varchar2(50) not null, -- 호텔 이름 (외래키) 
    type varchar2(50) not null, -- 객실타입 (외래키) 
    checkin date not null, --체크인 시간
    checkout date not null, --체크아웃 시간
    adult number(3) default 0, --성인
    kid number(3) default 0, --어린이 
    baby number(3) default 0, --유아
    money number(10) not null, -- 결제금액 
    
    constraint fk_member_id foreign key(id) references member(id),
    constraint fk_room_type foreign key(type) references room(type),
    constraint fk_hotel_name foreign key(name) references hotel(name)
)

--객실 테이블 생성  
CREATE TABLE room (
    type varchar2(50) primary key, --객실타입 (외래키) 
    idx number(5) not null, --고유 객실번호
    img_name varchar2(50) not null, --객실이미지파일이름 
    price number(10) not null, --객실 가격
    capacity number(5) not null --최대수용인원    
)

--호텔 테이블 생성 
CREATE TABLE hotel ( 
    name varchar2(30) primary key, --호텔 이름 (외래키) 
    idx number(5) not null, --호텔 고유번호
    standard number(10) not null, --스탠다드
    deluxe number(10) not null, --디럭스 
    suite number(10) not null, --스위트 
    grand number(10) not null -- 그랜드  
) 

--시퀀스 생성  
CREATE SEQUENCE sq_member_idx --로그인/회원가입 테이블  회원번호 시퀀스  
CREATE SEQUENCE sq_reser_idx -- 예약 테이블 예약번호 시퀀스 
CREATE SEQUENCE sq_room_idx -- 객실 테이블 객실번호 시퀀스 
CREATE SEQUENCE sq_hotel_idx -- 호텔 테이블 호텔번호 시퀀스 

--grade 기본데이터 입력  
INSERT INTO grade values('BRONZE',0,200000,0)
INSERT INTO grade values('SILVER',200001,1000000,5)
INSERT INTO grade values('GOLD',1000001,3000000,10)
INSERT INTO grade values('DIAMOND',3000001,10000000,15) 

--question 기본데이터 입력 
INSERT INTO question values(1,'보물 1호는?')
INSERT INTO question values(2,'내가 다닌 초등학교 이름은?') 
INSERT INTO question values(3,'짝사랑했던 이성친구 이름은?') 
INSERT INTO question values(4,'어렸을 적 별명은?') 
INSERT INTO question values(5,'내가 살던 고향은?') 

--room 기본 데이터 입력 
INSERT INTO room values('S_STANDARD',sq_room_idx.nextval,'S_ST.jpg',250000,4) 
INSERT INTO room values('S_DELUXE',sq_room_idx.nextval,'S_SD.jpg',400000,4)
INSERT INTO room values('S_SUITE',sq_room_idx.nextval,'S_S.jpg',200000,2)
INSERT INTO room values('S_GRAND',sq_room_idx.nextval,'S_G.jpg',600000,6)
INSERT INTO room values('U_STANDARD',sq_room_idx.nextval,'U_ST.jpg',150000,4)
INSERT INTO room values('U_DELUXE',sq_room_idx.nextval,'U_D.jpg',300000,4)
INSERT INTO room values('U_SUITE',sq_room_idx.nextval,'U_S.jpg',100000,2)
INSERT INTO room values('U_GRAND',sq_room_idx.nextval,'U_G.jpg',500000,6)

--hotel 기본 데이터 입력  
INSERT INTO hotel values('H_SEOUL',sq_hotel_idx.nextval,20,15,10,10)
INSERT INTO hotel values('H_ULSAN',sq_hotel_idx.nextval,25,10,10,15)

-- 전체 테이블 조회 
SELECT * FROM TAB 

-- 테이블 조회
SELECT * FROM member
SELECT * FROM grade
SELECT * FROM reser
SELECT * FROM room
SELECT * FROM hotel

--데이터 삭제 
DELETE grade
DELETE question
DELETE room
DELETE hotel
DELETE member
DELETE reser

--테이블 삭제 
DROP TABLE grade
DROP TABLE question
DROP TABLE room
DROP TABLE hotel
DROP TABLE member
DROP TABLE reser

--시퀀스 삭제 
DROP SEQUENCE sq_user_idx
DROP SEQUENCE sq_reser_idx
DROP SEQUENCE sq_room_idx
DROP SEQUENCE sq_hotel_idx
 
--
COMMIT

desc member
desc grade 
desc reser
desc room
desc hotel
desc question
