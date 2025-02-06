create Table users (
  user_id number primary key,
  username varchar2(32) not null,
  nickname varchar2(36) not null UNIQUE,
  pw varchar2(32) not null,
  email varchar2(64) not null UNIQUE,
  tel varchar2(16) not null UNIQUE,
  jumin varchar2(16) not null UNIQUE, // -없이 입력받음
  user_type varchar2(16) not null
);

create Table attraction_info ( //중심 관광지
  attraction_id number primary key,
  festival_id number,
  baseYm varchar2(16), //[note: '검색 날짜']
  mapX varchar2(128),
  mapY varchar2(128),
  areaCd varchar2(8), //[note: '지역 코드']
  areaNm varchar2(32), //[note: '지역명']
  signguCd varchar2(12), //[note: '시군구 코드']
  signguNm varchar2(32), //[note: '시군구명']
  hubTatsNm varchar2(64), //[note: '중심지 관광지명']
  hubBsicAdres varchar2(128), //[note: '중심 기본 주소']
  hubCtgryLclsNm varchar2(16), //[note: '중심지 카테고리 대분류명']
  hubCtgryMclsNm varchar2(32), //[note: '중심지 카테고리 중분류명']
  hubRank varchar2(12) //[note: '중심지 순위']
);

create Table festival (
  festival_id number primary key,
  festival_name varchar2(64),
  location varchar2(128),
  post_number varchar2(16),
  status varchar2(18), //[note: '개최중, 종료, 예정, 취소']
  start_date varchar2(16),
  end_date varchar2(16),
  entrance_fee varchar2(16), //[note: '입장료(유료, 무료)']
  tel varchar2(16),
  festival_host varchar2(64) //[note: '주최 단체']
);

create Table posts (
  post_id number primary key,
  title varchar2(64), //[note: '글 제목']
  content varchar2(64), //[note: '글 내용']
  user_id number,  //[note: '글 작성자']
  nickname varchar2(36),
  board_id number, //[note: '1: 공지 2: 자유 3: 질문 4: 후기']
  created_at timestamp, //[note: '작성 시간']
  post_like number, //글 좋아요 수
  post_views number, //글 조회수
  status number, //[note: 디폴트 공개, 1:공개 2:비공개]
  authentication_status number, //[note: '디폴트 미인증 1: 미인증 2: 인증']
  authentication_admin varchar2(16), //[note: '인증한 사람']
  authentication_time timestamp //[note: '인증 시간']
);

create Table comments (
  comments_id number primary key,
  content varchar2(3000), //[note: '글 내용']
  post_id number,
  user_id number, //[note: '댓글 작성자']
  created_at timestamp //[note: '작성 시간']
);

create Table authentication_page(
  authentication_id varchar2(16),
  festival_id number,
  user_id number,
  authentication_image BLOB, // 이미지 데이터 (BLOB 타입)
  authentication_status varchar2(32) //[note: '인증 여부']
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

create Table image (
  post_id number,
  image varchar2(32)
);

create Table user_festival_badge(
  festival_id number,
  user_id number
);

create Table board(
  board_id number primary key
);