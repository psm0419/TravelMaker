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
  report varchar2(12) default 'N' not null,
  nick_name varchar2(36) not null,
  report varchar2(12) not null
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
  comments_id number primary key,
  content varchar2(3000),
  post_id number,
  user_id varchar2(32),
  created_at timestamp,
  nick_name varchar2(36)
);
CREATE SEQUENCE comments_id_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

create Table authentication_page(
  authentication_id varchar2(16),
  festival_id number,
  user_id number,
  authentication_image BLOB,
  authentication_status varchar2(32)
);
CREATE SEQUENCE authentication_id_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

create Table search_record(
  search_id number primary key,
  user_id number,
  search_word varchar2(32),
  created_at timestamp
);
CREATE SEQUENCE search_id_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

create Table badge(
  badge_id number primary key,
  badge_title varchar2(32) unique,
  count number
);
CREATE SEQUENCE badge_id_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

create Table festival_rating( 
  authentication_id varchar2(32),
  user_rating number
);

CREATE TABLE festival_likes (
    like_id NUMBER PRIMARY KEY,             
    user_id varchar2(32),                    
    festival_id NUMBER,                      
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    FOREIGN KEY (user_id) REFERENCES users(user_id),  
    FOREIGN KEY (festival_id) REFERENCES festival(festival_id)
);

create Table postlike (
  post_id number,
  user_id number  
);

create Table commentlike (
  post_id number,
  user_id number  
);

create Table user_festival_badge(
  festival_id number,
  user_id number
);

create Table board(
  board_id number primary key
);

CREATE SEQUENCE comments_id_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE TABLE festival_images (
    image_id NUMBER PRIMARY KEY,
    festival_id NUMBER,
    file_path VARCHAR2(500),
    file_name VARCHAR2(255),
    mime_type VARCHAR2(100),
    uploaded_at DATE DEFAULT SYSDATE,
    CONSTRAINT fk_festival FOREIGN KEY (festival_id) REFERENCES festival(festival_id)
);

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
