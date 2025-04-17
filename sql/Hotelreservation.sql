
--등급 테이블 생성  1번  
CREATE TABLE grade (
    grade varchar2(50) primary key, --등급 
    min_point number(10) not null, --최소 포인트  
    max_point number(10) not null, -- 최대 포이트  
    discount number(10) not null --할인율
)

--객실 테이블 생성 2번  
CREATE TABLE room (
    type varchar2(50) primary key, --객실타입 (외래키) 
    idx number(5) not null, --고유 객실번호
    img_name varchar2(50) not null, --객실이미지파일이름 
    price number(10) not null, --객실 가격
    capacity number(5) not null --최대수용인원    
)

--호텔 테이블 생성 3번  
CREATE TABLE hotel ( 
    hname varchar2(30) primary key, --호텔 이름 (외래키) 
    hidx number(5) not null, --호텔 고유번호
    standard number(10) not null, --스탠다드
    deluxe number(10) not null, --디럭스 
    suite number(10) not null, --스위트 
    grand number(10) not null -- 그랜드  
) 


--질문 테이블 생question성 4번 
CREATE TABLE question (
    question number(2) primary key, -- 질문번호
    content varchar(50) not null -- 질문내용 
) 

--로그인 / 회원 가입 테이블 생성 5번  
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

--예약 테이블 생성 6번  
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


--환불 테이블 생성 7번  
CREATE TABLE refund (
    bidx number (5) primary key, --환불 번호 
    bid varchar2 (30) not null, -- 회원 아이디 (외래키) 
    bbank varchar2 (20) not null, -- 은행 
    bacount varchar2 (30) not null, -- 계좌번호 
    brefund number (10) not null, -- 환불금액 
    bdate DATE not null, --환불 날짜 
    
    constraint fk_member_mid foreign key(bid) references member(mid)
)


--문의 테이블 생성 8번  
CREATE TABLE inquiry (
    iidx number(5) primary key, --문의 회원번호 (기본키)  
    iid varchar2(50) not null, --문의 아이디 (외래키)
    itype varchar2(30) not null, 
    ititle varchar2(100) not null, --문의 제목 
    icontent varchar2(3000) not null, -- 문의 내용 
    idate date not null, --문의 날짜 
    iref number(4) default 0,
    ilev number(4) default 0,
    isunbun number(4) default 0,

constraint fk_member_id2 foreign key(iid) references member(mid)
)   

   
--후기 테이블 생성 9번  
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
    vridx number(5) not null, --예약 번호 
    
    constraint fk_member_id3 foreign key(vid) references member(mid),
    constraint fk_reser_idx foreign key(vridx) references reser(ridx)
)


-- 댓글 테이블 생성 10번  
CREATE TABLE reply (
    cidx number(5) primary key, --댓글 번호
    vidx NUMBER(5) NOT NULL, -- 어떤 리뷰 글에 달린 댓글인지 알기위한 외래키
    cid  varchar2(50) NOT NULL, --댓글 아이디
    ccontent varchar2(1000) NOT NULL, --댓글 내용
    cdate DATE NOT NULL, -- 댓글 날짜
    crecommend number(5) default 0, --추천수
    cnotrecommend number(5) default 0, --비 추천수
    cref number(5) default 0,
    clev number(5) default 0,
    csunbun number(5) default 0,
    constraint fk_member_id4 foreign key(cid) references member(mid),
    constraint fk_review_vidx foreign key(vidx) references review(vidx)
) 

--사진 테이블 생성 11번  
CREATE TABLE photo (
    pidx number(5) default 0, --후기 번호 
    pnum number(5) primary key, --사진 번호
    pname1 varchar2(100) NOT NULL, --사진 1  
    pname2 varchar2(100) NOT NULL,-- 사진 2
    pname3 varchar2(100) NOT NULL, --사진 3 
    constraint fk_review_vidx2 foreign key(pidx) references review(vidx) 
)
commit



--시퀀스 생성  
CREATE SEQUENCE sq_member_idx START WITH 11--로그인/회원가입 테이블  회원번호 시퀀스  
CREATE SEQUENCE sq_reser_idx -- 예약 테이블 예약번호 시퀀스 
CREATE SEQUENCE sq_room_idx -- 객실 테이블 객실번호 시퀀스 
CREATE SEQUENCE sq_hotel_idx -- 호텔 테이블 호텔번호 시퀀스 
CREATE SEQUENCE sq_refund_idx -- 환불 테이블 환불 번호 시퀀스
CREATE SEQUENCE sq_inquiry_idx START WITH 11 --문의 테이블 문의 번호 시퀀스 
CREATE SEQUENCE sq_review_idx START WITH 51 --후기 테이블 후기 번호 시퀀스
CREATE SEQUENCE sq_reply_idx START WITH 12 -- 댓글 테이블 댓글 번호 시퀀스
CREATE SEQUENCE sq_photo_num -- 사진 고유번호 시퀀스 

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
DELETE review
DELETE reply
DELETE photo

commit

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
DROP TABLE photo
DROP TABLE reply

--시퀀스 삭제 
DROP SEQUENCE sq_member_idx
DROP SEQUENCE sq_reser_idx
DROP SEQUENCE sq_room_idx
DROP SEQUENCE sq_hotel_idx
DROP SEQUENCE sq_refund_idx
DROP SEQUENCE sq_inquiry_idx
DROP SEQUENCE sq_review_idx --후기 테이블 후기 번호 시퀀스
DROP SEQUENCE sq_reply_idx -- 댓글 테이블 댓글 번호 시퀀스
DROP SEQUENCE sq_photo_idx -- 사진 테이블 사진 번호 시퀀스
DROP SEQUENCE sq_photo_num  --사진 테이블 사진 고유번호 시퀀스 

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




INSERT ALL
  INTO member (mid, midx, mpwd, mfname, mlname, mbirth, memail, mtel, maddr, mgrade, mjoin_date, mpoint, mmoney, mquestion, manswer) 
  VALUES ('user001', 1, 'password123', '민수', '김', TO_DATE('1990-05-01', 'YYYY-MM-DD'), 'minsu.kim@example.com', '010-1234-5678', '서울시 강남구 역삼동 123-45', 'BRONZE', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 1500, 50000, 1, '이순신')
  INTO member (mid, midx, mpwd, mfname, mlname, mbirth, memail, mtel, maddr, mgrade, mjoin_date, mpoint, mmoney, mquestion, manswer) 
  VALUES ('user002', 2, 'mypassword456', '지은', '박', TO_DATE('1992-08-20', 'YYYY-MM-DD'), 'jieun.park@example.com', '010-2345-6789', '서울시 송파구 방이동 456-78', 'BRONZE', TO_DATE('2022-12-25', 'YYYY-MM-DD'), 2500, 120000, 2, '동양초등학교')
  INTO member (mid, midx, mpwd, mfname, mlname, mbirth, memail, mtel, maddr, mgrade, mjoin_date, mpoint, mmoney, mquestion, manswer) 
  VALUES ('user003', 3, 'securepass789', '수현', '이', TO_DATE('1985-02-10', 'YYYY-MM-DD'), 'soohyun.lee@example.com', '010-3456-7890', '부산시 해운대구 우동 789-01', 'BRONZE', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 3500, 200000, 3, '지민')
  INTO member (mid, midx, mpwd, mfname, mlname, mbirth, memail, mtel, maddr, mgrade, mjoin_date, mpoint, mmoney, mquestion, manswer) 
  VALUES ('user004', 4, 'secretpass101', '윤아', '정', TO_DATE('1995-11-14', 'YYYY-MM-DD'), 'yoona.jeong@example.com', '010-4567-8901', '인천시 부평구 부평동 234-56', 'BRONZE', TO_DATE('2021-06-30', 'YYYY-MM-DD'), 4500, 300000, 4, '짱구')
  INTO member (mid, midx, mpwd, mfname, mlname, mbirth, memail, mtel, maddr, mgrade, mjoin_date, mpoint, mmoney, mquestion, manswer) 
  VALUES ('user005', 5, 'strongpass111', '영민', '최', TO_DATE('1993-01-25', 'YYYY-MM-DD'), 'youngmin.choi@example.com', '010-5678-9012', '대구시 중구 동성로 12-34', 'BRONZE', TO_DATE('2022-09-10', 'YYYY-MM-DD'), 2200, 80000, 5, '대전')
  INTO member (mid, midx, mpwd, mfname, mlname, mbirth, memail, mtel, maddr, mgrade, mjoin_date, mpoint, mmoney, mquestion, manswer) 
  VALUES ('user006', 6, 'mypassword222', '하늘', '홍', TO_DATE('2000-07-30', 'YYYY-MM-DD'), 'haneul.hong@example.com', '010-6789-0123', '대전시 서구 갈마동 345-67', 'BRONZE', TO_DATE('2023-02-05', 'YYYY-MM-DD'), 1200, 30000, 1, '이순신')
  INTO member (mid, midx, mpwd, mfname, mlname, mbirth, memail, mtel, maddr, mgrade, mjoin_date, mpoint, mmoney, mquestion, manswer) 
  VALUES ('user007', 7, 'password333', '태희', '김', TO_DATE('1998-04-15', 'YYYY-MM-DD'), 'taehee.kim@example.com', '010-7890-1234', '경기도 수원시 영통구 원천동 567-89', 'BRONZE', TO_DATE('2021-11-22', 'YYYY-MM-DD'), 2800, 100000, 2, '동양초등학교')
  INTO member (mid, midx, mpwd, mfname, mlname, mbirth, memail, mtel, maddr, mgrade, mjoin_date, mpoint, mmoney, mquestion, manswer) 
  VALUES ('user008', 8, 'password444', '지호', '이', TO_DATE('1997-09-05', 'YYYY-MM-DD'), 'jiho.lee@example.com', '010-8901-2345', '서울시 마포구 합정동 678-90', 'BRONZE', TO_DATE('2022-03-14', 'YYYY-MM-DD'), 1100, 25000, 3, '지민')
  INTO member (mid, midx, mpwd, mfname, mlname, mbirth, memail, mtel, maddr, mgrade, mjoin_date, mpoint, mmoney, mquestion, manswer) 
  VALUES ('user009', 9, 'password555', '소연', '박', TO_DATE('1989-06-12', 'YYYY-MM-DD'), 'soyeon.park@example.com', '010-9012-3456', '경기도 성남시 분당구 정자동 123-45', 'BRONZE', TO_DATE('2023-04-01', 'YYYY-MM-DD'), 2000, 60000, 4, '짱구')
  INTO member (mid, midx, mpwd, mfname, mlname, mbirth, memail, mtel, maddr, mgrade, mjoin_date, mpoint, mmoney, mquestion, manswer) 
  VALUES ('user010', 10, 'password666', '지민', '강', TO_DATE('1996-12-22', 'YYYY-MM-DD'), 'jimin.kang@example.com', '010-0123-4567', '서울시 동대문구 회기동 890-12', 'BRONZE', TO_DATE('2022-07-18', 'YYYY-MM-DD'), 3300, 180000, 5, '대전')
SELECT * FROM dual;

INSERT ALL
    INTO grade values('BRONZE',0,200000,0)
    INTO grade values('SILVER',200001,1000000,5)
    INTO grade values('GOLD',1000001,3000000,10)
    INTO grade values('DIAMOND',3000001,10000000,15) 
SELECT * FROM dual


INSERT ALL
    INTO question values(1,'보물 1호는?')
    INTO question values(2,'내가 다닌 초등학교 이름은?') 
    INTO question values(3,'짝사랑했던 이성친구 이름은?') 
    INTO question values(4,'어렸을 적 별명은?') 
    INTO question values(5,'내가 살던 고향은?') 
SELECT * FROM dual

INSERT ALL
    INTO room values('s_standard',1,'s_st.jpg',250000,4) 
    INTO room values('s_deluxe',2,'s_sd.jpg',400000,4)
    INTO room values('s_suite',3,'s_s.jpg',200000,2)
    INTO room values('s_grand',4,'s_g.jpg',600000,6)
    INTO room values('u_standard',5,'u_st.jpg',150000,4)
    INTO room values('u_deluxe',6,'u_d.jpg',300000,4)
    INTO room values('u_suite',7,'u_s.jpg',100000,2)
    INTO room values('u_grand',8,'u_g.jpg',500000,6)
SELECT * FROM dual


INSERT INTO hotel values('h_seoul',sq_hotel_idx.nextval,20,15,10,10)
INSERT INTO hotel values('h_ulsan',sq_hotel_idx.nextval,25,10,10,15)

INSERT ALL
  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (1, 'user001', 'h_seoul', 's_standard', TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-05-03', 'YYYY-MM-DD'), 2, 1, 0, 150000)
  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (2, 'user002', 'h_ulsan', 's_deluxe', TO_DATE('2023-06-10', 'YYYY-MM-DD'), TO_DATE('2023-06-12', 'YYYY-MM-DD'), 2, 0, 0, 250000)
  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (3, 'user003', 'h_seoul', 's_suite', TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2023-07-05', 'YYYY-MM-DD'), 2, 1, 1, 500000)
  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (4, 'user004', 'h_ulsan', 's_grand', TO_DATE('2023-08-10', 'YYYY-MM-DD'), TO_DATE('2023-08-15', 'YYYY-MM-DD'), 3, 2, 1, 700000)
  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (5, 'user005', 'h_seoul', 'u_standard', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-03', 'YYYY-MM-DD'), 2, 0, 0, 180000)
  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (6, 'user006', 'h_ulsan', 'u_deluxe', TO_DATE('2023-10-05', 'YYYY-MM-DD'), TO_DATE('2023-10-07', 'YYYY-MM-DD'), 1, 1, 1, 350000)
  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (7, 'user007', 'h_seoul', 'u_suite', TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2023-11-05', 'YYYY-MM-DD'), 2, 1, 1, 600000)
  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (8, 'user008', 'h_ulsan', 'u_grand', TO_DATE('2023-12-15', 'YYYY-MM-DD'), TO_DATE('2023-12-20', 'YYYY-MM-DD'), 3, 2, 0, 800000)
  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (9, 'user009', 'h_seoul', 's_deluxe', TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-12', 'YYYY-MM-DD'), 1, 0, 0, 220000)
  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (10, 'user010', 'h_ulsan', 's_standard', TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-03', 'YYYY-MM-DD'), 1, 1, 0, 160000)
  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (11, 'user001', 'h_seoul', 's_grand', TO_DATE('2024-03-05', 'YYYY-MM-DD'), TO_DATE('2024-03-10', 'YYYY-MM-DD'), 2, 1, 1, 750000)
  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (12, 'user002', 'h_ulsan', 's_suite', TO_DATE('2024-04-15', 'YYYY-MM-DD'), TO_DATE('2024-04-20', 'YYYY-MM-DD'), 2, 0, 0, 550000)
  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (13, 'user003', 'h_seoul', 's_standard', TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-03', 'YYYY-MM-DD'), 1, 1, 0, 170000)
  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (14, 'user004', 'h_ulsan', 's_deluxe', TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_DATE('2024-06-12', 'YYYY-MM-DD'), 3, 2, 1, 450000)

  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (15, 'user001', 'h_seoul', 's_standard', TO_DATE('2025-01-10', 'YYYY-MM-DD'), TO_DATE('2025-01-12', 'YYYY-MM-DD'), 2, 1, 0, 180000)

  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (16, 'user002', 'h_ulsan', 'u_deluxe', TO_DATE('2025-02-15', 'YYYY-MM-DD'), TO_DATE('2025-02-17', 'YYYY-MM-DD'), 2, 0, 1, 320000)

  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (17, 'user003', 'h_seoul', 's_suite', TO_DATE('2025-03-05', 'YYYY-MM-DD'), TO_DATE('2025-03-07', 'YYYY-MM-DD'), 1, 1, 0, 250000)

  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (18, 'user004', 'h_ulsan', 'u_grand', TO_DATE('2025-04-20', 'YYYY-MM-DD'), TO_DATE('2025-04-23', 'YYYY-MM-DD'), 3, 2, 1, 700000)

  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (19, 'user005', 'h_seoul', 's_grand', TO_DATE('2025-04-18', 'YYYY-MM-DD'), TO_DATE('2025-04-22', 'YYYY-MM-DD'), 2, 1, 0, 650000)

  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (20, 'user006', 'h_ulsan', 's_standard', TO_DATE('2025-05-01', 'YYYY-MM-DD'), TO_DATE('2025-05-03', 'YYYY-MM-DD'), 2, 0, 0, 160000)

  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (21, 'user007', 'h_seoul', 'u_suite', TO_DATE('2025-05-15', 'YYYY-MM-DD'), TO_DATE('2025-05-18', 'YYYY-MM-DD'), 1, 1, 1, 300000)

  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (22, 'user008', 'h_ulsan', 'u_standard', TO_DATE('2025-06-05', 'YYYY-MM-DD'), TO_DATE('2025-06-07', 'YYYY-MM-DD'), 2, 2, 0, 200000)

  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (23, 'user009', 'h_seoul', 's_deluxe', TO_DATE('2025-06-20', 'YYYY-MM-DD'), TO_DATE('2025-06-23', 'YYYY-MM-DD'), 1, 1, 0, 400000)

  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (24, 'user010', 'h_ulsan', 'u_suite', TO_DATE('2025-07-10', 'YYYY-MM-DD'), TO_DATE('2025-07-12', 'YYYY-MM-DD'), 2, 1, 1, 280000)

  INTO reser (ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney)
  VALUES (25, 'user001', 'h_seoul', 'u_deluxe', TO_DATE('2025-07-15', 'YYYY-MM-DD'), TO_DATE('2025-07-17', 'YYYY-MM-DD'), 3, 0, 0, 350000)
SELECT * FROM dual;



INSERT ALL
  INTO inquiry (iidx, iid, itype, ititle, icontent, idate)
  VALUES (1, 'user001', '예약', '예약 확인 요청', '예약 내역이 이메일로 오지 않았습니다. 확인 부탁드립니다.', TO_DATE('2025-04-15', 'YYYY-MM-DD'))
  INTO inquiry (iidx, iid, itype, ititle, icontent, idate)
  VALUES (2, 'user001', '결제/환불', '환불 요청', '결제가 중복으로 된 것 같아요. 환불 요청합니다.', TO_DATE('2025-04-02', 'YYYY-MM-DD'))
  INTO inquiry (iidx, iid, itype, ititle, icontent, idate)
  VALUES (3, 'user001', '회원 정보', '회원 정보 수정', '전화번호가 바뀌었습니다. 수정 부탁드립니다.', TO_DATE('2025-03-10', 'YYYY-MM-DD'))
  INTO inquiry (iidx, iid, itype, ititle, icontent, idate)
  VALUES (4, 'user001', '기타', '기타 문의', '사이트 이용 중 오류가 발생했습니다. 문의드립니다.', TO_DATE('2025-02-28', 'YYYY-MM-DD'))
  INTO inquiry (iidx, iid, itype, ititle, icontent, idate)
  VALUES (5, 'user001', '예약', '예약 날짜 변경', '예약한 날짜를 변경하고 싶습니다. 절차를 알려주세요.', TO_DATE('2025-01-15', 'YYYY-MM-DD'))
  INTO inquiry (iidx, iid, itype, ititle, icontent, idate)
  VALUES (6, 'user001', '결제/환불', '영수증 재발행 요청', '회사 제출용으로 영수증이 필요합니다.', TO_DATE('2025-01-30', 'YYYY-MM-DD'))
  INTO inquiry (iidx, iid, itype, ititle, icontent, idate)
  VALUES (7, 'user001', '회원 정보', '비밀번호 변경 문의', '비밀번호를 잊어버렸어요. 어떻게 바꾸나요?', TO_DATE('2024-12-05', 'YYYY-MM-DD'))
  INTO inquiry (iidx, iid, itype, ititle, icontent, idate)
  VALUES (8, 'user001', '기타', '사이트 개선 요청', '모바일 UI가 불편해요. 개선해주세요.', TO_DATE('2024-11-20', 'YYYY-MM-DD'))
  INTO inquiry (iidx, iid, itype, ititle, icontent, idate)
  VALUES (9, 'user001', '결제/환불', '결제 오류', '결제가 안됩니다. 카드 문제가 아닌 것 같아요.', TO_DATE('2024-10-28', 'YYYY-MM-DD'))
  INTO inquiry (iidx, iid, itype, ititle, icontent, idate)
  VALUES (10, 'user001', '예약', '예약 취소 요청', '사정상 예약을 취소해야 합니다. 가능할까요?', TO_DATE('2024-11-05', 'YYYY-MM-DD'))
SELECT * FROM dual;


INSERT ALL
  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (1, 'user001', '깔끔하고 조용한 숙소', '방이 조용하고 청결해서 만족스러웠습니다.', TO_DATE('2023-05-07', 'YYYY-MM-DD'), 142, 88, 0, 5, 1)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (2, 'user002', '가족 여행에 딱이었어요', '아이들과 함께 가기 좋았던 호텔이에요.', TO_DATE('2023-06-17', 'YYYY-MM-DD'), 89, 56, 0, 4, 2)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (3, 'user003', '스위트룸 강력 추천', '룸이 넓고 고급스러워서 만족도가 높았습니다.', TO_DATE('2023-07-11', 'YYYY-MM-DD'), 101, 73, 0, 5, 3)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (4, 'user004', '가격 대비 만족', '비싼 만큼 값어치 있는 숙박이었어요.', TO_DATE('2023-08-20', 'YYYY-MM-DD'), 153, 110, 0, 4, 4)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (5, 'user005', '위치도 좋고 친절해요', '직원분들 너무 친절하고 위치도 최고예요.', TO_DATE('2023-09-06', 'YYYY-MM-DD'), 72, 44, 0, 5, 5)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (6, 'user006', '아이와 함께 만족스러운 숙소', '아기 침대도 따로 준비해줘서 좋았어요.', TO_DATE('2023-10-09', 'YYYY-MM-DD'), 118, 35, 0, 4, 6)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (7, 'user007', '프라이빗한 느낌 최고', '조용하고 프라이버시가 잘 지켜졌습니다.', TO_DATE('2023-11-10', 'YYYY-MM-DD'), 61, 29, 0, 5, 7)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (8, 'user008', '럭셔리한 분위기 굿', '인테리어와 조명이 분위기를 더해줬어요.', TO_DATE('2023-12-25', 'YYYY-MM-DD'), 177, 122, 0, 5, 8)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (9, 'user009', '조식이 좀 아쉬워요', '숙소는 좋았지만 조식이 부실했습니다.', TO_DATE('2024-01-17', 'YYYY-MM-DD'), 95, 48, 0, 3, 9)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (10, 'user010', '무난한 숙소였습니다', '기대만큼 좋지도 나쁘지도 않은 숙소였어요.', TO_DATE('2024-02-07', 'YYYY-MM-DD'), 33, 11, 0, 3, 10)
    
  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (11, 'user001', '가성비 최고인 숙소', '넓고 깨끗해서 가격 대비 만족도가 높았어요.', TO_DATE('2024-03-14', 'YYYY-MM-DD'), 141, 75, 0, 5, 11)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (12, 'user002', '스위트룸 정말 편안했어요', '조용하고 침대가 아주 편했어요. 재방문 의사 있습니다.', TO_DATE('2024-04-26', 'YYYY-MM-DD'), 92, 48, 0, 5, 12)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (13, 'user003', '출장 시 추천하는 숙소', '출장 중 머물렀는데 위치와 시설 모두 좋았습니다.', TO_DATE('2024-05-08', 'YYYY-MM-DD'), 74, 39, 0, 4, 13)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (14, 'user004', '수영장이 정말 좋아요', '아이들과 함께 놀기 딱 좋은 수영장이 있었어요.', TO_DATE('2024-06-15', 'YYYY-MM-DD'), 121, 101, 0, 5, 14)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (15, 'user001', '전반적으로 만족스러움', '숙소, 조식, 청소 상태 모두 나쁘지 않았어요.', TO_DATE('2025-01-17', 'YYYY-MM-DD'), 87, 52, 0, 4, 15)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (16, 'user002', '친절한 직원이 인상적이었어요', '프론트 직원이 너무 친절해서 기분 좋았어요.', TO_DATE('2025-02-21', 'YYYY-MM-DD'), 66, 33, 0, 5, 16)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (17, 'user003', '스파가 최고였어요', '스파 시설이 아주 잘 되어 있어 피로가 풀렸습니다.', TO_DATE('2025-03-10', 'YYYY-MM-DD'), 150, 120, 0, 5, 17)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (18, 'user004', '만족스러운 가족 여행', '어린이 시설이 잘 되어 있어 가족 모두 만족했어요.', TO_DATE('2025-04-23', 'YYYY-MM-DD'), 95, 60, 0, 4, 18)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (19, 'user005', '주차 공간이 넓고 편리했어요', '차량 이용 시 위치와 주차시설이 훌륭해요.', TO_DATE('2025-04-25', 'YYYY-MM-DD'), 49, 22, 0, 4, 19)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (20, 'user006', '약간 시끄러웠지만 무난', '객실 벽이 얇은지 조금 시끄럽긴 했습니다.', TO_DATE('2025-05-06', 'YYYY-MM-DD'), 160, 71, 0, 3, 20)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (21, 'user007', '깔끔한 시설에 만족', '객실 정리 상태가 아주 좋았어요. 청결 점수 만점!', TO_DATE('2025-05-19', 'YYYY-MM-DD'), 98, 45, 0, 5, 21)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (22, 'user008', '저렴한 가격에 알찬 숙소', '가격 대비 훌륭한 숙소였고 위치도 만족스러웠습니다.', TO_DATE('2025-06-09', 'YYYY-MM-DD'), 67, 32, 0, 4, 22)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (23, 'user009', '편안한 잠자리 제공', '매트리스가 정말 편해서 숙면 취했습니다.', TO_DATE('2025-06-25', 'YYYY-MM-DD'), 88, 50, 0, 5, 23)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (24, 'user010', '아이들과 좋은 추억 만들었어요', '어린이 친화적인 시설이 많아서 편했습니다.', TO_DATE('2025-07-15', 'YYYY-MM-DD'), 102, 65, 0, 4, 24)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (25, 'user001', '깔끔하고 조용한 객실', '도심 속 조용한 공간을 찾고 있다면 추천합니다.', TO_DATE('2025-07-21', 'YYYY-MM-DD'), 79, 40, 0, 5, 25)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (26, 'user002', '친구들과 즐거운 시간', '룸 컨디션이 좋아서 친구들과 잘 쉬다 왔습니다.', TO_DATE('2025-06-10', 'YYYY-MM-DD'), 112, 48, 0, 4, 22)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (27, 'user003', '욕실이 아주 넓고 깨끗해요', '욕실이 청결하고 어메니티도 잘 갖춰져 있었습니다.', TO_DATE('2025-06-24', 'YYYY-MM-DD'), 91, 55, 0, 4, 23)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (28, 'user004', '재방문 의사 100%', '가족들과 오기 좋은 숙소였어요. 다음에도 이용할 거예요.', TO_DATE('2025-07-14', 'YYYY-MM-DD'), 135, 80, 0, 5, 24)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (29, 'user005', '가성비 좋고 위치도 좋아요', '주변 편의시설과의 접근성이 좋아 편리했어요.', TO_DATE('2025-07-22', 'YYYY-MM-DD'), 108, 67, 0, 4, 25)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (30, 'user006', '쾌적한 숙소였습니다', '공기질이 좋고, 침구류가 깔끔해서 만족했습니다.', TO_DATE('2025-07-13', 'YYYY-MM-DD'), 142, 95, 0, 5, 24)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (31, 'user007', '위치가 정말 좋아요', '지하철역과 가까워 이동이 편리했어요. 만족!', TO_DATE('2025-01-14', 'YYYY-MM-DD'), 84, 45, 0, 4, 15)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (32, 'user008', '깔끔한 내부와 친절한 서비스', '직원들이 너무 친절해서 감동받았어요.', TO_DATE('2025-02-17', 'YYYY-MM-DD'), 96, 55, 0, 5, 16)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (33, 'user009', '가족 단위 여행에 추천', '아이들과 함께 머물기 정말 좋은 공간이었어요.', TO_DATE('2025-03-09', 'YYYY-MM-DD'), 78, 40, 0, 4, 17)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (34, 'user010', '만족스러운 숙박 경험', '전체적으로 깔끔하고 조용해서 좋았습니다.', TO_DATE('2025-04-23', 'YYYY-MM-DD'), 132, 66, 0, 5, 18)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (35, 'user001', '다음에도 이용하고 싶어요', '침대가 아주 편안하고, 룸서비스도 훌륭했습니다.', TO_DATE('2025-04-23', 'YYYY-MM-DD'), 105, 59, 0, 5, 19)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (36, 'user002', '합리적인 가격에 훌륭한 숙소', '가성비 최고였어요. 추천합니다.', TO_DATE('2025-05-03', 'YYYY-MM-DD'), 65, 37, 0, 4, 20)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (37, 'user003', '아이들 있는 가족에게 딱', '놀이 공간이 잘 되어 있어 아이들도 즐거워했어요.', TO_DATE('2025-05-19', 'YYYY-MM-DD'), 89, 53, 0, 5, 21)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (38, 'user004', '깔끔한 조식과 객실', '조식이 정말 맛있고 깔끔해서 만족했습니다.', TO_DATE('2025-06-07', 'YYYY-MM-DD'), 77, 49, 0, 4, 22)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (39, 'user005', '넓은 객실에 감동', '침대도 크고, 전반적으로 넓어서 쾌적했어요.', TO_DATE('2025-06-25', 'YYYY-MM-DD'), 113, 70, 0, 5, 23)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (40, 'user006', '부모님과 좋은 시간 보냈어요', '어르신들도 좋아하신 숙소라 만족합니다.', TO_DATE('2025-07-14', 'YYYY-MM-DD'), 121, 61, 0, 5, 24)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (41, 'user007', '만족스러운 객실', '전반적으로 청결하고 쾌적했습니다.', TO_DATE('2025-07-17', 'YYYY-MM-DD'), 102, 41, 0, 4, 25)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (42, 'user008', '소음이 조금 있었어요', '방음이 살짝 아쉬웠지만 전체적으로 만족.', TO_DATE('2025-07-13', 'YYYY-MM-DD'), 88, 33, 0, 3, 24)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (43, 'user009', '침대가 정말 푹신해요', '장거리 여행 후 숙면 취하기 좋았어요.', TO_DATE('2025-06-24', 'YYYY-MM-DD'), 145, 68, 0, 5, 23)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (44, 'user010', '깨끗하고 조용한 숙소', '청결 상태가 좋고 조용해서 좋았어요.', TO_DATE('2025-06-08', 'YYYY-MM-DD'), 72, 21, 0, 4, 22)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (45, 'user001', '조식이 훌륭했어요', '종류도 다양하고 맛도 좋았습니다.', TO_DATE('2025-05-19', 'YYYY-MM-DD'), 130, 50, 0, 5, 21)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (46, 'user002', '합리적인 가격의 호텔', '가성비 숙소로 추천드립니다.', TO_DATE('2025-05-02', 'YYYY-MM-DD'), 55, 24, 0, 4, 20)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (47, 'user003', '친절한 직원들이 인상적', '서비스 응대가 정말 훌륭했어요.', TO_DATE('2025-04-24', 'YYYY-MM-DD'), 98, 39, 0, 5, 19)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (48, 'user004', '깔끔한 시설과 분위기', '모던한 인테리어가 좋았어요.', TO_DATE('2025-04-24', 'YYYY-MM-DD'), 77, 30, 0, 4, 18)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (49, 'user005', '가족 여행으로 만족', '어린이 편의시설이 잘 갖춰져 있어요.', TO_DATE('2025-03-08', 'YYYY-MM-DD'), 101, 55, 0, 5, 17)

  INTO review (vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, vridx)
  VALUES (50, 'user006', '다시 방문하고 싶은 숙소', '전반적으로 매우 만족스러웠습니다.', TO_DATE('2025-02-17', 'YYYY-MM-DD'), 84, 49, 0, 5, 16)
SELECT * FROM dual;


INSERT ALL
-- 댓글 1 (vidx=1, 원댓글)
INTO reply (cidx, vidx, cid, ccontent, cdate, crecommend, cnotrecommend, cref, clev, csunbun)
VALUES (1, 1, 'user003', '정말 공감합니다. 저도 청결이 좋았어요.', TO_DATE('2023-05-07', 'YYYY-MM-DD'), 45, 5, 1, 0, 0)

-- 댓글 2 (vidx=1, 원댓글)
INTO reply (cidx, vidx, cid, ccontent, cdate, crecommend, cnotrecommend, cref, clev, csunbun)
VALUES (2, 1, 'user004', '방음도 괜찮았나요?', TO_DATE('2023-05-08', 'YYYY-MM-DD'), 38, 3, 2, 0, 1)

-- 댓글 3 (vidx=1, 대댓글 to 2)
INTO reply (cidx, vidx, cid, ccontent, cdate, crecommend, cnotrecommend, cref, clev, csunbun)
VALUES (3, 1, 'user001', '네 방음도 좋았어요!', TO_DATE('2023-05-08', 'YYYY-MM-DD'), 60, 2, 2, 1, 2)

-- 댓글 4 (vidx=1, 대댓글 to 1)
INTO reply (cidx, vidx, cid, ccontent, cdate, crecommend, cnotrecommend, cref, clev, csunbun)
VALUES (4, 1, 'user005', '정말 청결 중요하죠!', TO_DATE('2023-05-09', 'YYYY-MM-DD'), 28, 1, 1, 1, 3)

-- 댓글 5 (vidx=1, 원댓글)
INTO reply (cidx, vidx, cid, ccontent, cdate, crecommend, cnotrecommend, cref, clev, csunbun)
VALUES (5, 1, 'user006', '근처에 맛집도 많았나요?', TO_DATE('2023-05-09', 'YYYY-MM-DD'), 70, 4, 5, 0, 4)

-- 댓글 6 (vidx=2, 원댓글)
INTO reply (cidx, vidx, cid, ccontent, cdate, crecommend, cnotrecommend, cref, clev, csunbun)
VALUES (6, 2, 'user007', '아이들도 좋아했나요?', TO_DATE('2023-06-17', 'YYYY-MM-DD'), 42, 3, 6, 0, 0)

-- 댓글 7 (vidx=2, 대댓글 to 6)
INTO reply (cidx, vidx, cid, ccontent, cdate, crecommend, cnotrecommend, cref, clev, csunbun)
VALUES (7, 2, 'user002', '네, 수영장이 특히 인기였어요.', TO_DATE('2023-06-18', 'YYYY-MM-DD'), 51, 2, 6, 1, 1)

-- 댓글 8 (vidx=2, 원댓글)
INTO reply (cidx, vidx, cid, ccontent, cdate, crecommend, cnotrecommend, cref, clev, csunbun)
VALUES (8, 2, 'user008', '조식은 어떤가요?', TO_DATE('2023-06-17', 'YYYY-MM-DD'), 60, 6, 8, 0, 2)

-- 댓글 9 (vidx=2, 대댓글 to 8)
INTO reply (cidx, vidx, cid, ccontent, cdate, crecommend, cnotrecommend, cref, clev, csunbun)
VALUES (9, 2, 'user002', '조식은 다양하고 맛있었어요!', TO_DATE('2023-06-18', 'YYYY-MM-DD'), 73, 1, 8, 1, 3)

-- 댓글 10 (vidx=2, 원댓글)
INTO reply (cidx, vidx, cid, ccontent, cdate, crecommend, cnotrecommend, cref, clev, csunbun)
VALUES (10, 2, 'user009', '주차는 괜찮았나요?', TO_DATE('2023-06-19', 'YYYY-MM-DD'), 35, 5, 10, 0, 4)

-- 댓글 11 (vidx=2, 대댓글 to 10)
INTO reply (cidx, vidx, cid, ccontent, cdate, crecommend, cnotrecommend, cref, clev, csunbun)
VALUES (11, 2, 'user004', '넉넉했어요. 지하주차장 있음!', TO_DATE('2023-06-19', 'YYYY-MM-DD'), 49, 2, 10, 1, 5)

SELECT * FROM dual;