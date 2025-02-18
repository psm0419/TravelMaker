create Table users (
  user_id varchar2(32) primary key,
  username varchar2(32) not null,
  nickname varchar2(36) not null UNIQUE,
  pw varchar2(32) not null,
  email varchar2(64) not null UNIQUE,
  tel varchar2(16) not null UNIQUE,
  jumin varchar2(16) not null UNIQUE,
  user_type varchar2(16) not null,
  report varchar2(64)
);

create Table attraction_info (
  attraction_id number primary key,  
  baseYm varchar2(16),
  mapX varchar2(128),
  mapY varchar2(128),
  areaCd varchar2(8),
  areaNm varchar2(32),
  signguCd varchar2(12),
  signguNm varchar2(32),
  hubTatsNm varchar2(64),
  hubBsicAdres varchar2(128),
  hubCtgryLclsNm varchar2(16),
  hubCtgryMclsNm varchar2(32),
  hubRank varchar2(12)
);

CREATE SEQUENCE attraction_id_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

create Table festival (
  festival_id number primary key,
  festival_name varchar2(128),
  location varchar2(128),
  start_date varchar2(16),
  end_date varchar2(16),
  entrance_fee varchar2(64),
  tel varchar2(32),
  festival_host varchar2(128),
  homepage_url varchar2(512),
  content varchar2(4000),
  like_count NUMBER
);

CREATE SEQUENCE festival_id_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

create Table posts (
  post_id number primary key,
  title varchar2(64) not null,
  content varchar2(3000),
  user_id varchar2(32) not null,
  created_at timestamp DEFAULT systimestamp,
  post_like number default 0,
  post_views number default 0,
  status number default 0 check (status in (0,1)),  
  nick_name varchar2(36) not null,
  report varchar2(12) default 'N' not null,
  board_id number(3)
);

create Table board(
  board_id number primary key
);

CREATE SEQUENCE post_id_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

create table posts_images(
    image_id number primary key,
    post_id number not null,
    file_name VARCHAR2(255) NOT NULL,  -- 저장된 파일명
    original_file_name VARCHAR2(255) NOT NULL,  -- 원본 파일명
    file_path VARCHAR2(500) NOT NULL,  -- 파일 경로
    url_file_path VARCHAR2(500) NOT NULL,       -- URL 경로 (웹에서 접근할 경우)
    file_extension VARCHAR2(10), -- 확장자
    uploaded_at TIMESTAMP DEFAULT SYSTIMESTAMP -- 업로드 시간
);
create sequence posts_images_id_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

create Table comments (
  comment_id number primary key,
  content varchar2(3000),
  post_id number,
  user_id varchar2(32),
  created_at timestamp,
  nick_name varchar2(36)
);
CREATE SEQUENCE comment_id_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


CREATE TABLE festival_likes (
  like_id NUMBER PRIMARY KEY,
  user_id varchar2(32) NOT NULL,
  festival_id NUMBER NOT NULL,
  liked_at DATE DEFAULT SYSDATE,
  CONSTRAINT fk_festival2 FOREIGN KEY (festival_id) REFERENCES festival(festival_id),
  CONSTRAINT fk_user2 FOREIGN KEY (user_id) REFERENCES users(user_id),
  CONSTRAINT uk_festival_likes UNIQUE (user_id, festival_id) -- 기존 제약 조건 이름 변경
);

UPDATE festival f
SET f.like_count = (
    SELECT COUNT(*) 
    FROM festival_likes fl 
    WHERE fl.festival_id = f.festival_id
);

CREATE SEQUENCE festival_likes_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE TABLE festival_images (
    image_id NUMBER PRIMARY KEY,
    festival_id NUMBER,
    file_path VARCHAR2(500),
    file_name VARCHAR2(255),
    mime_type VARCHAR2(100),
    uploaded_at DATE DEFAULT SYSDATE,
    CONSTRAINT fk_festival FOREIGN KEY (festival_id) REFERENCES festival(festival_id)
);

CREATE SEQUENCE image_id_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

create table file_info(
    file_name varchar2(256),
    original_file_name varchar2(256),
    file_path varchar2(256),
    url_file_path varchar2(256)
);

create table user_profile_image(
    id varchar2(32),
    file_name varchar2(256)
);

CREATE TABLE user_reports (
    report_id NUMBER PRIMARY KEY,
    user_id VARCHAR2(32) NOT NULL,
    report_reason VARCHAR2(255) NOT NULL,
    report_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    --FOREIGN KEY (user_id) REFERENCES users(user_id)
);
