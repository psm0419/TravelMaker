create Table users (
  user_id number primary key,
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
  festival_id number,
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

create Table festival (
  festival_id number primary key,
  festival_name varchar2(64),
  location varchar2(128),
  post_number varchar2(16),
  status varchar2(18),
  start_date varchar2(16),
  end_date varchar2(16),
  entrance_fee varchar2(16),
  tel varchar2(16),
  festival_host varchar2(64)
);

create Table posts (
  post_id number primary key,
  title varchar2(64),
  content varchar2(64),
  user_id number,
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

create Table comments (
  comments_id number primary key,
  content varchar2(3000),
  post_id number,
  user_id number,
  created_at timestamp
);

create Table authentication_page(
  authentication_id varchar2(16),
  festival_id number,
  user_id number,
  authentication_image BLOB,
  authentication_status varchar2(32)
);

create Table search_record(
  search_id number primary key,
  user_id number,
  search_word varchar2(32),
  created_at timestamp
);

create Table badge(
  badge_id number primary key,
  badge_title varchar2(32) unique,
  count number
);

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