-- 사용자(회원) 정보를 저장할 테이블
CREATE TABLE users(
	id VARCHAR2(100) PRIMARY KEY,
	pwd VARCHAR2(100) NOT NULL,
	email VARCHAR2(100),
	profile VARCHAR2(100),
	regdate DATE
);

-- 업로드된 파일의 정보를 저장할 테이블
CREATE TABLE board_file(
   num NUMBER PRIMARY KEY,
   writer VARCHAR2(100) NOT NULL,
   title VARCHAR2(100) NOT NULL,
   orgFileName VARCHAR2(100) NOT NULL, -- 원본 파일명
   saveFileName VARCHAR2(100) NOT NULL, -- 서버에 실제로 저장된 파일명
   fileSize NUMBER NOT NULL, -- 파일의 크기 
   regdate DATE
);

CREATE SEQUENCE board_file_seq; 

-- 게시글을 저장 할 테이블
CREATE TABLE board_daily(
	num NUMBER PRIMARY KEY, --글 번호
	writer VARCHAR2(100) NOT NULL, --작성자 (로그인 된 아이디)
	title VARCHAR2(100) NOT NULL, --제목
	content CLOB, --글 내용
	viewCount NUMBER, --조회수
	likeCount NUMBER, --좋아요 수
	regdate DATE --글 작성일
);
--게시글의 번호를 얻어 낼 시퀀스
CREATE SEQUENCE board_daily_seq;