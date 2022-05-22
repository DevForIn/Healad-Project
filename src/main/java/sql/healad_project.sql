

update USER_ACCOUNT 
set userName='테스터1임', phoneNo='010-1234-1234', postCode='123-123'
,addr='서울시', addrDetail='펜트하우스', email='t@t.t', birthDate='1992-06-01'
where userId = tester1



/* Drop Tables */

DROP TABLE CART CASCADE CONSTRAINTS;
DROP TABLE FAQ CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE SALE_ITEM CASCADE CONSTRAINTS;
DROP TABLE ITEM CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE SALE CASCADE CONSTRAINTS;
DROP TABLE USER_ACCOUNT CASCADE CONSTRAINTS;

select * from USER_ACCOUNT
select * from item
select item_id , item_name, price, description, picture_url, use_yn, item_cat_id from item where item_id = 1

/* Create Tables */

CREATE TABLE CART
(
	CART_ID number NOT NULL,
	USER_ID varchar2(20) NOT NULL,
	ITEM_ID number(10,0) NOT NULL,
	QUANTITY number,
	REG_DATE varchar2(10),
	PRIMARY KEY (CART_ID)
);


CREATE TABLE FAQ
(
	FAQ_ID number NOT NULL,
	QUESTION varchar2(50),
	ANSWER varchar2(1000),
	PRIMARY KEY (FAQ_ID)
);


CREATE TABLE ITEM
(
	ITEM_ID number(10,0) NOT NULL,
	ITEM_NAME varchar2(100),
	PRICE number(10,0) NOT NULL,
	DESCRIPTION varchar2(2000),
	PICTURE_URL varchar2(500),
	USE_YN char(1),
	ITEM_CAT_ID number(2,0),
	PRIMARY KEY (ITEM_ID)
);


CREATE TABLE NOTICE
(
	NOTICE_ID number NOT NULL,
	NO_SUBJECT varchar2(100),
	NO_CONTENT nvarchar2(2000),
	NO_READ_CNT number NOT NULL,
	NO_FILE_URL varchar2(500),
	NO_REG_DATE date NOT NULL,
	PRIMARY KEY (NOTICE_ID)
);


CREATE TABLE REVIEW
(
	REVIEW_SEQ number NOT NULL,
	USER_ID varchar2(20) NOT NULL,
	SALE_ITEM_ID number NOT NULL,
	RV_SUBJECT varchar2(100),
	RV_CONTENT nvarchar2(2000),
	RV_FILE_URL varchar2(500),
	RV_IP varchar2(20),
	SCORE number(1),
	RV_REG_DATE date,
	RV_UPDT_DATE date,
	RV_check number(2,0),
	PRIMARY KEY (REVIEW_SEQ)
);


CREATE TABLE SALE
(
	SALE_ID number NOT NULL,
	USER_ID varchar2(20) NOT NULL,
	SALE_DATE date NOT NULL,
	SALE_USER_NAME nvarchar2(10),
	SALE_POST_CODE varchar2(6),
	SALE_ADDR varchar2(200),
	SALE_ADDR_DETAIL varchar2(200),
	REMARK varchar2(1000),
	PRIMARY KEY (SALE_ID)
);


CREATE TABLE SALE_ITEM
(
	SALE_ITEM_ID number NOT NULL,
	SALE_ID number NOT NULL,
	ITEM_ID number(10,0) NOT NULL,
	QUANTITY number NOT NULL,
	PRICE number NOT NULL,
	PRIMARY KEY (SALE_ITEM_ID)
);


CREATE TABLE USER_ACCOUNT
(
	USER_ID varchar2(20) NOT NULL,
	PWD varchar2(30),
	USER_NAME varchar2(30),
	PHONE_NO varchar2(13),
	POST_CODE varchar2(7),
	ADDR varchar2(200),
	ADDR_DETAIL varchar2(200),
	EMAIL varchar2(100),
	BIRTH_DATE date,
	JOIN_DATE date,
	WITHDRAW_YN varchar2(2),
	WITHDRAW_DATE date,
	Mileage number,
	PRIMARY KEY (USER_ID)
);

CREATE SEQUENCE SEQ_CART_ID INCREMENT BY 1 MINVALUE 0 NOCYCLE NOCACHE NOORDER ;
CREATE SEQUENCE SEQ_ITEM_ID INCREMENT BY 1 MINVALUE 0 NOCYCLE NOCACHE NOORDER ;
select * from SALE_ITEM 
/* Create Foreign Keys */

ALTER TABLE CART
	ADD FOREIGN KEY (ITEM_ID)
	REFERENCES ITEM (ITEM_ID)
;


ALTER TABLE SALE_ITEM
	ADD FOREIGN KEY (ITEM_ID)
	REFERENCES ITEM (ITEM_ID)
;


ALTER TABLE SALE_ITEM
	ADD FOREIGN KEY (SALE_ID)
	REFERENCES SALE (SALE_ID)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (SALE_ITEM_ID)
	REFERENCES SALE_ITEM (SALE_ITEM_ID)
;


ALTER TABLE CART
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USER_ACCOUNT (USER_ID)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USER_ACCOUNT (USER_ID)
;


ALTER TABLE SALE
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USER_ACCOUNT (USER_ID)
;

-- 시퀀스 추가
CREATE SEQUENCE SEQ_SALE_ID INCREMENT BY 1 MINVALUE 0 NOCYCLE NOCACHE NOORDER ;
CREATE SEQUENCE SEQ_SALE_ITEM_ID INCREMENT BY 1 MINVALUE 0 NOCYCLE NOCACHE NOORDER ;




