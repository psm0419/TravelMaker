create Table users (
  user_id varchar2(32) primary key,
  username varchar2(32) not null,
  nickname varchar2(36) not null UNIQUE,
  pw varchar2(32) not null,
  email varchar2(64) not null UNIQUE,
  tel varchar2(16) not null UNIQUE,
  jumin varchar2(16) not null UNIQUE,
  user_type varchar2(16) not null
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
  festival_host varchar2(128)
);

CREATE SEQUENCE festival_id_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

create Table posts (
  post_id number primary key,
  title varchar2(64),
  content varchar2(3000),
  user_id varchar2(32),
  nickname varchar2(36),
  board_id number,
  created_at timestamp,
  post_like number,
  post_views number,
  status number,
  authentication_status number,
  authentication_admin varchar2(16),
  authentication_time timestamp
);
CREATE SEQUENCE post_id_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

create Table comments (
  comments_id number primary key,
  content varchar2(3000),
  post_id number,
  user_id number,
  created_at timestamp
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

create Table user_festival_like(
  user_id number,
  festival_id number
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
