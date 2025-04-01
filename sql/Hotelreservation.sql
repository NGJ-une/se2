--로그인 / 회원 가입 테이블 생성 
CREATE TABLE h_user ( 
    id varchar2(30) primary key, --아이디 
    idx number(5) unique not null, --회원번호
    pwd varchar2(50) not null, --비밀번호
    fname varchar2(50) not null, --이름
    lname varchar2(50) not null, --성
    birth date not null, --생년월일
    email varchar2(100) not null, --이메일
    tel varchar2(50) not null, --전화번호
    addr varchar2(150) not null, -- 주소
    u_grade varchar2(50) default 'BRONZE', --등급 (외래키) 
    join_date date not null, -- 가입날짜
    u_point number(10) default 0, --누적포인트 
    u_money number(10) default 0, --사용가능금액  
    u_question number(2) not null, --질문번호 (외래키) 
    u_answer varchar2(50) not null --답변 
    
    constraint fk_grade foreign key(u_grade) references grade(u_grade),
    constraint fk_question foreign key(u_question) references question(u_question)
)

--등급 테이블 생성  
CREATE TABLE grade (
    u_grade varchar2(50) primary key, --등급 
    g__min_point number(10) not null, --최소 포인트  
    g_max_point number(10) not null, -- 최대 포이트  
    g_discount number(10) not null --할인율
)

--질문 테이블 생성
CREATE TABLE question (
    u_question number(2) not null, -- 질문번호
    u_content varchar(50) not null -- 질문내용 
) 


--예약 테이블 생성 
CREATE TABLE h_reser (
    r_idx number(5) primary key, --예약번호  
    id varchar2(30) unique not null, --아이디 (외래키) 
    h_name varchar2(5) not null, -- 호텔 이름 (외래키) 
    room_type varchar2(50) not null, -- 객실타입 (외래키) 
    r_checkin date not null, --체크인 시간
    r_checkout date not null, --체크아웃 시간
    adult number(2) default 0, --성인
    kid number(2) default 0, --어린이 
    baby number(2) default 0, --유아
    h_money number(10) not null, -- 결제금액  
    
    constraint fk_id foreign key(id) references h_user(id),
    constraint fk_room_type foreign key(room_type) references h_room(room_type),
    constraint fk_h_name foreign key(h_name) references h_hotel(h_name)
)

--객실 테이블 생성  
CREATE TABLE h_room (
    room_type varchar2(50) primary key, --객실타입 (외래키) 
    room_idx number(5) not null, --고유 객실번호
    room_img_name varchar2(50) not null, --객실이미지파일이름 
    room_price number(10) not null, --객실 가격
    room_max number(5) not null --최대수용인원    
)

--호텔 테이블 생성 
CREATE TABLE h_hotel ( 
    h_name varchar2(30) primary key, --호텔 이름 (외래키) 
    h_idx number(5) not null, --호텔 고유번호
    h_standard number(10) not null, --스탠다드
    h_deluxe number(10) not null, --디럭스 
    h_suite number(10) not null, --스위트 
    h_grand number(10) not null -- 그랜드  
) 

--시퀀스 생성  
CREATE SEQUENCE sq_h_user_idx --로그인/회원가입 테이블  회원번호 시퀀스  
CREATE SEQUENCE sq_h_reser_r_idx -- 예약 테이블 예약번호 시퀀스 
CREATE SEQUENCE sq_h_room_room_idx -- 객실 테이블 객실번호 시퀀스 
CREATE SEQUENCE sq_h_hotel_h_idx -- 호텔 테이블 호텔번호 시퀀스 

--grade 기본데이터 입력  
INSERT INTO grade values('BRONZE',0,200000,0)
INSERT INTO grade values('SILVER',200001,1000000,5)
INSERT INTO grade values('GOLD',1000001,3000000,10)
INSERT INTO grade values('DIAMOND',3000001,10000000,15) 

--question 기본데이터 입력 
INSERT INTO question values(1,'보물 1호는?')
INSERT INTO question values(2,'내가 다닌 초등학교 이름은?') 
INSERT INTO question values(3,'짝사랑했던 이성친구 이름은?') 
INSERT INTO question values(4,'좋아하는 연예인은?') 
INSERT INTO question values(5,'내가 살던 고향은?') 

--h_room 기본 데이터 입력 
INSERT INTO h_room values('S-STANDARD',sq_h_room_room_idx.nextval,'S_ST.jpg',250000,4) 
INSERT INTO h_room values('S-DELUXE',sq_h_room_room_idx.nextval,'S_SD.jpg',400000,4)
INSERT INTO h_room values('S-SUITE',sq_h_room_room_idx.nextval,'S_S.jpg',200000,2)
INSERT INTO h_room values('S-GRAND',sq_h_room_room_idx.nextval,'S_G.jpg',600000,6)
INSERT INTO h_room values('U-STANDARD',sq_h_room_room_idx.nextval,'U_ST.jpg',150000,4)
INSERT INTO h_room values('U-DELUXE',sq_h_room_room_idx.nextval,'U_D.jpg',300000,4)
INSERT INTO h_room values('U-SUITE',sq_h_room_room_idx.nextval,'U_S.jpg',100000,2)
INSERT INTO h_room values('U-GRAND',sq_h_room_room_idx.nextval,'U_G.jpg',500000,6)

--h_hotel 기본 데이터 입력  
INSERT INTO h_hotel values('H_SEOUL',sq_h_hotel_h_idx.nextval,20,15,10,10)
INSERT INTO h_hotel values('H_ULSAN',sq_h_hotel_h_idx.nextval,25,10,10,15)

-- 전체 테이블 조회 
SELECT * FROM TAB 

-- 테이블 조회
SELECT * FROM h_user
SELECT * FROM grade
SELECT * FROM h_reser
SELECT * FROM h_room
SELECT * FROM h_hotel

--데이터 삭제 
DELETE grade
DELETE question
DELETE h_room
DELETE h_hotel

--테이블 삭제 
DROP TABLE h_user
DROP TABLE grade
DROP TABLE h_reser
DROP TABLE h_room
DROP TABLE h_hotel

--시퀀스 삭제 
DROP SEQUENCE sq_h_user_idx
DROP SEQUENCE sq_h_reser_r_idx
DROP SEQUENCE sq_h_room_room_idx
DROP SEQUENCE sq_h_hotel_h_idx
 
--
COMMIT

desc h_user
desc grade 
desc h_reser
desc h_room
desc h_hotel