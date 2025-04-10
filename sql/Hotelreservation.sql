--로그인 / 회원 가입 테이블 생성 
CREATE TABLE member( 
    mid varchar2(30) primary key, --아이디 
    midx number(5) unique not null, --회원번호
    mpwd varchar2(50) not null, --비밀번호
    mfname varchar2(50) not null, --이름
    mlname varchar2(50) not null, --성
    mbirth date not null, --생년월일
    memail varchar2(100) not null, --이메일
    mtel varchar2(50) not null, --전화번호
    maddr varchar2(150) not null, -- 주소
    mgrade varchar2(50) default 'BRONZE', --등급 (외래키) 
    mjoin_date date not null, -- 가입날짜
    mpoint number(10) default 0, --누적포인트 
    mmoney number(10) default 0, --사용가능금액  
    mquestion number(2) not null, --질문번호 (외래키) 
    manswer varchar2(50) not null, --답변 
    
    constraint fk_grade foreign key(mgrade) references grade(grade),
    constraint fk_question foreign key(mquestion) references question(question)
)

--등급 테이블 생성  
CREATE TABLE grade (
    grade varchar2(50) primary key, --등급 
    min_point number(10) not null, --최소 포인트  
    max_point number(10) not null, -- 최대 포이트  
    discount number(10) not null --할인율
)

--질문 테이블 생question성
CREATE TABLE  (
    question number(2) primary key, -- 질문번호
    content varchar(50) not null -- 질문내용 
) 

--예약 테이블 생성 
CREATE TABLE reser (
    ridx number(5) primary key, --예약번호  
    rid varchar2(50) not null, --아이디 (외래키) 
    rname varchar2(50) not null, -- 호텔 이름 (외래키) 
    rtype varchar2(50) not null, -- 객실타입 (외래키) 
    rcheckin date not null, --체크인 시간
    rcheckout date not null, --체크아웃 시간
    radult number(3) default 0, --성인
    rkid number(3) default 0, --어린이 
    rbaby number(3) default 0, --유아
    rmoney number(10) not null, -- 결제금액 
    
    constraint fk_member_id foreign key(rid) references member(mid),
    constraint fk_room_type foreign key(rtype) references room(type),
    constraint fk_hotel_name foreign key(rname) references hotel(hname)
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
    hname varchar2(30) primary key, --호텔 이름 (외래키) 
    hidx number(5) not null, --호텔 고유번호
    standard number(10) not null, --스탠다드
    deluxe number(10) not null, --디럭스 
    suite number(10) not null, --스위트 
    grand number(10) not null -- 그랜드  
) 
--환불 테이블 생성
CREATE TABLE refund (
    bidx number (5) primary key, --환불 번호 
    bid varchar2 (30) not null, -- 회원 아이디 (외래키) 
    bbank varchar2 (20) not null, -- 은행 
    bacount varchar2 (30) not null, -- 계좌번호 
    brefund number (10) not null, -- 환불금액 
    bdate DATE not null, --환불 날짜 
    
    constraint fk_member_mid foreign key(bid) references member(mid)
)
--문의 테이블 생성 
CREATE TABLE inquiry (
    iidx number(5) primary key, --문의 회원번호 (기본키)  
    iid varchar2(50) not null, --문의 아이디 (외래키) 
    ititle varchar2(100) not null, --문의 제목 
    icontent varchar2(3000) not null, -- 문의 내용 
    idate date not null, --문의 날짜 
    iref number(4) default 0,
    ilev number(4) default 0,
    isunbun number(4) default 0,

constraint fk_member_id2 foreign key(iid) references member(mid)
)   
--후기 테이블 생성
CREATE TABLE review (
    vidx number(5) primary key, --후기 번호 
    vid varchar2(50) NOT NULL, -- 후기 아이디 
    vtitle varchar2(100) NOT NULL, -- 후기 제목 
    vcontent varchar2(3000) NOT NULL, -- 후기 내용 
    vdate DATE NOT NULL, --작성날짜 
    vreadnum number(5) default 0, --조회수 
    vrecommend number(5) default 0, --추천수 
    vcomment number(5) default 0, --댓글 달린 수
    vtotal number(1) default 0, -- 평점
    
    constraint fk_member_id3 foreign key(vid) references member(mid)
)
-- 댓글 테이블 생성
CREATE TABLE reply (
    cidx number(5) primary key, --댓글 번호
    cid  varchar2(50) NOT NULL, --댓글 아이디
    ccontent varchar2(1000) NOT NULL, --댓글 내용
    cdate DATE NOT NULL, -- 댓글 날짜
    crecommend number(5) default 0, --추천수 
    cnotrecommend number(5) default 0, --비 추천수 
    cref number(5) default 0, 
    clev number(5) default 0,
    csunbun number(5) default 0,
    constraint fk_member_id4 foreign key(cid) references member(mid),
    constraint fk_review_vidx foreign key(cidx) references review(vidx)
) 
--사진 테이블 생성 
CREATE TABLE photo (
    pidx number(5) default 0, --사진 번호
    pnum number(5) not null, --후기 번호
    pname varchar2(100) NOT NULL,
    
    constraint fk_review_vidx2 foreign key(pidx) references review(vidx) 
)


--시퀀스 생성  
CREATE SEQUENCE sq_member_idx --로그인/회원가입 테이블  회원번호 시퀀스  
CREATE SEQUENCE sq_reser_idx -- 예약 테이블 예약번호 시퀀스 
CREATE SEQUENCE sq_room_idx -- 객실 테이블 객실번호 시퀀스 
CREATE SEQUENCE sq_hotel_idx -- 호텔 테이블 호텔번호 시퀀스 
CREATE SEQUENCE sq_refund_idx -- 환불 테이블 환불 번호 시퀀스
CREATE SEQUENCE sq_inquiry_idx --문의 테이블 문의 번호 시퀀스 
CREATE SEQUENCE sq_review_idx --후기 테이블 후기 번호 시퀀스
CREATE SEQUENCE sq_commet_idx -- 댓글 테이블 댓글 번호 시퀀스
CREATE SEQUENCE sq_photo_idx -- 사진 테이블 사진 번호 시퀀스 

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
INSERT INTO room values('s_standard',sq_room_idx.nextval,'s_st.jpg',250000,4) 
INSERT INTO room values('s_deluxe',sq_room_idx.nextval,'s_sd.jpg',400000,4)
INSERT INTO room values('s_suite',sq_room_idx.nextval,'s_s.jpg',200000,2)
INSERT INTO room values('s_grand',sq_room_idx.nextval,'s_g.jpg',600000,6)
INSERT INTO room values('u_standard',sq_room_idx.nextval,'u_st.jpg',150000,4)
INSERT INTO room values('u_deluxe',sq_room_idx.nextval,'u_d.jpg',300000,4)
INSERT INTO room values('u_suite',sq_room_idx.nextval,'u_s.jpg',100000,2)
INSERT INTO room values('u_grand',sq_room_idx.nextval,'u_g.jpg',500000,6)

--hotel 기본 데이터 입력  
INSERT INTO hotel values('h_seoul',sq_hotel_idx.nextval,20,15,10,10)
INSERT INTO hotel values('h_ulsan',sq_hotel_idx.nextval,25,10,10,15)

-- 전체 테이블 조회 
SELECT * FROM TAB 

-- 테이블 조회
SELECT * FROM member
SELECT * FROM grade
SELECT * FROM reser
SELECT * FROM room
SELECT * FROM hotel
SELECT * FROM refund
SELECT * FROM inquiry

--데이터 삭제 
DELETE reser
DELETE member
DELETE hotel
DELETE room
DELETE question
DELETE grade
DELETE refund
DELETE inquiry
--테이블 삭제 
DROP TABLE reser
DROP TABLE member
DROP TABLE hotel
DROP TABLE room
DROP TABLE question
DROP TABLE grade
DROP TABLE refund
DROP TABLE inquiry
DROP TABLE review
DROP TABLE reply
DROP TABLE photo
--시퀀스 삭제 
DROP SEQUENCE sq_member_idx
DROP SEQUENCE sq_reser_idx
DROP SEQUENCE sq_room_idx
DROP SEQUENCE sq_hotel_idx
DROP SEQUENCE sq_refund_idx
DROP SEQUENCE sq_inquiry_idx
 
--
COMMIT

desc member
desc grade 
desc reser
desc room
desc hotel
desc question
desc refund
desc inquiry
