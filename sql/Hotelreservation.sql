--µî±Ş Å×ÀÌºí »ı¼º  
CREATE TABLE grade (
    grade varchar2(50) primary key, --µî±Ş 
    min_point number(10) not null, --ÃÖ¼Ò Æ÷ÀÎÆ®  
    max_point number(10) not null, -- ÃÖ´ë Æ÷ÀÌÆ®  
    discount number(10) not null --ÇÒÀÎÀ²
)

--Áú¹® Å×ÀÌºí »ı¼º
CREATE TABLE question (
    question number(2) primary key, -- Áú¹®¹øÈ£
    content varchar(50) not null -- Áú¹®³»¿ë 
) 

--·Î±×ÀÎ / È¸¿ø °¡ÀÔ Å×ÀÌºí »ı¼º 
CREATE TABLE member( 
    id varchar2(30) primary key, --¾ÆÀÌµğ
    idx number(5) unique not null, --È¸¿ø¹øÈ£
    pwd varchar2(50) not null, --ºñ¹Ğ¹øÈ£
    fname varchar2(50) not null, --ÀÌ¸§
    lname varchar2(50) not null, --¼º
    birth date not null, --»ı³â¿ùÀÏ
    email varchar2(100) not null, --ÀÌ¸ŞÀÏ
    tel varchar2(50) not null, --ÀüÈ­¹øÈ£
    addr varchar2(150) not null, -- ÁÖ¼Ò
    grade varchar2(50) default 'BRONZE', --µî±Ş (¿Ü·¡Å°) 
    join_date date not null, -- °¡ÀÔ³¯Â¥
    point number(10) default 0, --´©ÀûÆ÷ÀÎÆ® 
    money number(10) default 0, --»ç¿ë°¡´É±İ¾×  
    question number(2) not null, --Áú¹®¹øÈ£ (¿Ü·¡Å°) 
    answer varchar2(50) not null, --´äº¯ 
    
    constraint fk_grade foreign key(grade) references grade(grade),
    constraint fk_question foreign key(question) references question(question)
)

--°´½Ç Å×ÀÌºí »ı¼º  
CREATE TABLE room (
    type varchar2(50) primary key, --°´½ÇÅ¸ÀÔ (¿Ü·¡Å°) 
    idx number(5) not null, --°íÀ¯ °´½Ç¹øÈ£
    img_name varchar2(50) not null, --°´½ÇÀÌ¹ÌÁöÆÄÀÏÀÌ¸§ 
    price number(10) not null, --°´½Ç °¡°İ
    capacity number(5) not null --ÃÖ´ë¼ö¿ëÀÎ¿ø    
)

--È£ÅÚ Å×ÀÌºí »ı¼º 
CREATE TABLE hotel ( 
    name varchar2(30) primary key, --È£ÅÚ ÀÌ¸§ (¿Ü·¡Å°) 
    idx number(5) not null, --È£ÅÚ °íÀ¯¹øÈ£
    standard number(10) not null, --½ºÅÄ´Ùµå
    deluxe number(10) not null, --µğ·°½º 
    suite number(10) not null, --½ºÀ§Æ® 
    grand number(10) not null -- ±×·£µå  
) 

--¿¹¾à Å×ÀÌºí »ı¼º 
CREATE TABLE reser (
    idx number(5) primary key, --¿¹¾à¹øÈ£  
    id varchar2(30) unique not null, --¾ÆÀÌµğ (¿Ü·¡Å°) 
    name varchar2(5) not null, -- È£ÅÚ ÀÌ¸§ (¿Ü·¡Å°) 
    type varchar2(50) not null, -- °´½ÇÅ¸ÀÔ (¿Ü·¡Å°) 
    checkin date not null, --Ã¼Å©ÀÎ ½Ã°£
    checkout date not null, --Ã¼Å©¾Æ¿ô ½Ã°£
    adult number(2) default 0, --¼ºÀÎ
    kid number(2) default 0, --¾î¸°ÀÌ 
    baby number(2) default 0, --À¯¾Æ
    money number(10) not null, -- °áÁ¦±İ¾×  
    
    constraint fk_member_id foreign key(id) references member(id),
    constraint fk_room_type foreign key(type) references room(type),
    constraint fk_hotel_name foreign key(name) references hotel(name)
)
--È¯ºÒ Å×ÀÌºí »ı¼º
CREATE TABLE refund (
    bidx number (5) primary key, --È¯ºÒ ¹øÈ£ 
    bid varchar2 (30) not null, -- È¸¿ø ¾ÆÀÌµğ (¿Ü·¡Å°) 
    bbank varchar2 (20) not null, -- ÀºÇà 
    bacount varchar2 (30) not null, -- °èÁÂ¹øÈ£ 
    brefund number (10) not null, -- È¯ºÒ±İ¾× 
    bdate DATE not null, --È¯ºÒ ³¯Â¥ 
    
    constraint fk_member_mid foreign key(bid) references member(mid)
)
--¹®ÀÇ Å×ÀÌºí »ı¼º 
CREATE TABLE inquiry (
    iidx number(5) primary key, --¹®ÀÇ È¸¿ø¹øÈ£ (±âº»Å°)  
    iid varchar2(50) not null, --¹®ÀÇ ¾ÆÀÌµğ (¿Ü·¡Å°)
    itype varchar2(30) not null, --¹®ÀÇ À¯Çü 
    ititle varchar2(100) not null, --¹®ÀÇ Á¦¸ñ 
    icontent varchar2(3000) not null, -- ¹®ÀÇ ³»¿ë 
    idate date not null, --¹®ÀÇ ³¯Â¥ 

constraint fk_member_id2 foreign key(iid) references member(mid)
) 
--ÈÄ±â Å×ÀÌºí »ı¼º 9¹ø  
CREATE TABLE review (
    vidx number(5) primary key, --ÈÄ±â ¹øÈ£ 
    vid varchar2(50) NOT NULL, -- ÈÄ±â ¾ÆÀÌµğ 
    vtitle varchar2(100) NOT NULL, -- ÈÄ±â Á¦¸ñ 
    vcontent varchar2(3000) NOT NULL, -- ÈÄ±â ³»¿ë 
    vdate DATE NOT NULL, --ÀÛ¼º³¯Â¥ 
    vreadnum number(5) default 0, --Á¶È¸¼ö 
    vrecommend number(5) default 0, --ÃßÃµ¼ö 
    vcomment number(5) default 0, --´ñ±Û ´Ş¸° ¼ö
    vtotal number(1) default 0, -- ÆòÁ¡
    vridx number(5) not null,
    
    constraint fk_member_id3 foreign key(vid) references member(mid),
    constraint fk_reser_idx foreign key(vridx) references reser(ridx)
)


-- ´ñ±Û Å×ÀÌºí »ı¼º 10¹ø  
CREATE TABLE reply (
    cidx number(5) primary key, --´ñ±Û ¹øÈ£
    vidx NUMBER(5) NOT NULL, -- ¾î¶² ¸®ºä ±Û¿¡ ´Ş¸° ´ñ±ÛÀÎÁö ¾Ë±âÀ§ÇÑ ¿Ü·¡Å°
    cid  varchar2(50) NOT NULL, --´ñ±Û ¾ÆÀÌµğ
    ccontent varchar2(1000) NOT NULL, --´ñ±Û ³»¿ë
    cdate DATE NOT NULL, -- ´ñ±Û ³¯Â¥
    crecommend number(5) default 0, --ÃßÃµ¼ö
    cnotrecommend number(5) default 0, --ºñ ÃßÃµ¼ö
    cref number(5) default 0,
    clev number(5) default 0,
    csunbun number(5) default 0,
    constraint fk_member_id4 foreign key(cid) references member(mid),
    constraint fk_review_vidx foreign key(vidx) references review(vidx)
) 


--»çÁø Å×ÀÌºí »ı¼º 11¹ø  
CREATE TABLE photo (
    pidx number(5) default 0, --ÈÄ±â ¹øÈ£ 
    pnum number(5) primary key, --»çÁø ¹øÈ£
    pname1 varchar2(100) NOT NULL, --»çÁø 1  
    pname2 varchar2(100) NOT NULL,-- »çÁø 2
    pname3 varchar2(100) NOT NULL, --»çÁø 3 
    constraint fk_review_vidx2 foreign key(pidx) references review(vidx) 
)
commit


--½ÃÄö½º »ı¼º  
CREATE SEQUENCE sq_member_idx --·Î±×ÀÎ/È¸¿ø°¡ÀÔ Å×ÀÌºí  È¸¿ø¹øÈ£ ½ÃÄö½º  
CREATE SEQUENCE sq_reser_idx -- ¿¹¾à Å×ÀÌºí ¿¹¾à¹øÈ£ ½ÃÄö½º 
CREATE SEQUENCE sq_room_idx -- °´½Ç Å×ÀÌºí °´½Ç¹øÈ£ ½ÃÄö½º 
CREATE SEQUENCE sq_hotel_idx -- È£ÅÚ Å×ÀÌºí È£ÅÚ¹øÈ£ ½ÃÄö½º 
CREATE SEQUENCE sq_refund_idx -- È¯ºÒ Å×ÀÌºí È¯ºÒ ¹øÈ£ ½ÃÄö½º
CREATE SEQUENCE sq_inquiry_idx --¹®ÀÇ Å×ÀÌºí ¹®ÀÇ ¹øÈ£ ½ÃÄö½º 
CREATE SEQUENCE sq_review_idx --ÈÄ±â Å×ÀÌºí ÈÄ±â ¹øÈ£ ½ÃÄö½º
CREATE SEQUENCE sq_reply_idx -- ´ñ±Û Å×ÀÌºí ´ñ±Û ¹øÈ£ ½ÃÄö½º
CREATE SEQUENCE sq_photo_idx -- »çÁø Å×ÀÌºí »çÁø ¹øÈ£ ½ÃÄö½º 

--grade ±âº»µ¥ÀÌÅÍ ÀÔ·Â  
INSERT INTO grade values('BRONZE',0,200000,0)
INSERT INTO grade values('SILVER',200001,1000000,5)
INSERT INTO grade values('GOLD',1000001,3000000,10)
INSERT INTO grade values('DIAMOND',3000001,10000000,15) 

--question ±âº»µ¥ÀÌÅÍ ÀÔ·Â 
INSERT INTO question values(1,'º¸¹° 1È£´Â?')
INSERT INTO question values(2,'³»°¡ ´Ù´Ñ ÃÊµîÇĞ±³ ÀÌ¸§Àº?') 
INSERT INTO question values(3,'Â¦»ç¶ûÇß´ø ÀÌ¼ºÄ£±¸ ÀÌ¸§Àº?') 
INSERT INTO question values(4,'¾î·ÈÀ» Àû º°¸íÀº?') 
INSERT INTO question values(5,'³»°¡ »ì´ø °íÇâÀº?') 

--room ±âº» µ¥ÀÌÅÍ ÀÔ·Â 
INSERT INTO room values('s_standard',sq_room_idx.nextval,'s_st.jpg',250000,4) 
INSERT INTO room values('s_deluxe',sq_room_idx.nextval,'s_sd.jpg',400000,4)
INSERT INTO room values('s_suite',sq_room_idx.nextval,'s_s.jpg',200000,2)
INSERT INTO room values('s_grand',sq_room_idx.nextval,'s_g.jpg',600000,6)
INSERT INTO room values('u_standard',sq_room_idx.nextval,'u_st.jpg',150000,4)
INSERT INTO room values('u_deluxe',sq_room_idx.nextval,'u_d.jpg',300000,4)
INSERT INTO room values('u_suite',sq_room_idx.nextval,'u_s.jpg',100000,2)
INSERT INTO room values('u_grand',sq_room_idx.nextval,'u_g.jpg',500000,6)

--hotel ±âº» µ¥ÀÌÅÍ ÀÔ·Â  
INSERT INTO hotel values('h_seoul',sq_hotel_idx.nextval,20,15,10,10)
INSERT INTO hotel values('h_ulsan',sq_hotel_idx.nextval,25,10,10,15)

-- ÀüÃ¼ Å×ÀÌºí Á¶È¸ 
SELECT * FROM TAB 

-- Å×ÀÌºí Á¶È¸
SELECT * FROM member
SELECT * FROM grade
SELECT * FROM reser
SELECT * FROM room
SELECT * FROM hotel
SELECT * FROM refund
SELECT * FROM inquiry
SELECT * FROM reviw
SELECT * FROM reply
SELECT * FROM photo
--µ¥ÀÌÅÍ »èÁ¦ 
DELETE reser
DELETE member
DELETE hotel
DELETE room
DELETE question
DELETE grade
DELETE refund
DELETE inquiry
DELETE reviw
DELETE reply
DELETE photo
--Å×ÀÌºí »èÁ¦ 
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
--½ÃÄö½º »èÁ¦ 
DROP SEQUENCE sq_member_idx
DROP SEQUENCE sq_reser_idx
DROP SEQUENCE sq_room_idx
DROP SEQUENCE sq_hotel_idx
DROP SEQUENCE sq_refund_idx
DROP SEQUENCE sq_inquiry_idx
DROP SEQUENCE sq_review_idx
DROP SEQUENCE sq_reply_idx
DROP SEQUENCE sq_photo_idx 
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
desc review
desc reply
desc photo

?˜ë¶ˆ ?´ì—­ - ?˜ë¶ˆ ë²ˆí˜¸, ?„ì´?? ?€?? ê³„ì¢Œë²ˆí˜¸, ?˜ë¶ˆ ê¸ˆì•¡, ?˜ë¶ˆ ? ì§œ
idx, id ,bank, account,refund , date
?˜ë¶ˆ ?´ì—­ b ë¡??±ã„±
n


