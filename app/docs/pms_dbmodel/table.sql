-- 유저
DROP TABLE IF EXISTS user RESTRICT;

-- 게시판
DROP TABLE IF EXISTS board RESTRICT;

-- 첨부파일
DROP TABLE IF EXISTS file RESTRICT;

-- 게시판좋아요
DROP TABLE IF EXISTS like_cnt RESTRICT;

-- 게시판싫어요
DROP TABLE IF EXISTS hate_cnt RESTRICT;

-- 유저
CREATE TABLE user (
  user_no  INTEGER      NOT NULL COMMENT '유저번호', -- 유저번호
  name     VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
  nickname VARCHAR(50)  NOT NULL COMMENT '닉네임', -- 닉네임
  email    VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
  password VARCHAR(255) NOT NULL COMMENT '암호', -- 암호
  photo    VARCHAR(255) NULL     COMMENT '사진', -- 사진
  tel      VARCHAR(30)  NOT NULL COMMENT '전화번호', -- 전화번호
  join_dt  DATE         NOT NULL DEFAULT curdate() COMMENT 'join_dt', -- join_dt
  active   INTEGER      NOT NULL DEFAULT 1 COMMENT '활동상태' -- 활동상태
)
COMMENT '유저';

-- 유저
ALTER TABLE user
  ADD CONSTRAINT PK_user -- 유저 기본키
    PRIMARY KEY (
      user_no -- 유저번호
    );

ALTER TABLE user
  MODIFY COLUMN user_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '유저번호';

-- 게시판
CREATE TABLE board (
  board_no      INTEGER      NOT NULL COMMENT '게시판번호', -- 게시판번호
  title         VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
  content       TEXT         NOT NULL COMMENT '내용', -- 내용
  registered_dt DATE         NOT NULL DEFAULT 0 COMMENT '등록일', -- 등록일
  like_count    INTEGER      NOT NULL DEFAULT 0 COMMENT '좋아요수', -- 좋아요수
  hate_count    INTEGER      NOT NULL DEFAULT 0 COMMENT '싫어요수', -- 싫어요수
  view_count    INTEGER      NOT NULL DEFAULT 0
   COMMENT '조회수', -- 조회수
  user_no       INTEGER      NOT NULL COMMENT '유저번호' -- 유저번호
)
COMMENT '게시판';

-- 게시판
ALTER TABLE board
  ADD CONSTRAINT PK_board -- 게시판 기본키
    PRIMARY KEY (
      board_no -- 게시판번호
    );

ALTER TABLE board
  MODIFY COLUMN board_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '게시판번호';

-- 첨부파일
CREATE TABLE file (
  file_no  INTEGER      NOT NULL COMMENT '파일번호', -- 파일번호
  name     VARCHAR(50)  NULL     COMMENT '파일이름', -- 파일이름
  path     VARCHAR(255) NULL     COMMENT '파일경로', -- 파일경로
  board_no INTEGER      NOT NULL COMMENT '게시판번호' -- 게시판번호
)
COMMENT '첨부파일';

-- 첨부파일
ALTER TABLE file
  ADD CONSTRAINT PK_file -- 첨부파일 기본키
    PRIMARY KEY (
      file_no -- 파일번호
    );

ALTER TABLE file
  MODIFY COLUMN file_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '파일번호';

-- 게시판좋아요
CREATE TABLE like_cnt (
  user_no  INTEGER NOT NULL COMMENT '유저번호', -- 유저번호
  board_no INTEGER NOT NULL COMMENT '게시판번호' -- 게시판번호
)
COMMENT '게시판좋아요';

-- 게시판좋아요
ALTER TABLE like_cnt
  ADD CONSTRAINT PK_like_cnt -- 게시판좋아요 기본키
    PRIMARY KEY (
      user_no,  -- 유저번호
      board_no  -- 게시판번호
    );

-- 게시판싫어요
CREATE TABLE hate_cnt (
  user_no  INTEGER NOT NULL COMMENT '유저번호', -- 유저번호
  board_no INTEGER NOT NULL COMMENT '게시판번호' -- 게시판번호
)
COMMENT '게시판싫어요';

-- 게시판싫어요
ALTER TABLE hate_cnt
  ADD CONSTRAINT PK_hate_cnt -- 게시판싫어요 기본키
    PRIMARY KEY (
      user_no,  -- 유저번호
      board_no  -- 게시판번호
    );

-- 게시판
ALTER TABLE board
  ADD CONSTRAINT FK_user_TO_board -- 유저 -> 게시판
    FOREIGN KEY (
      user_no -- 유저번호
    )
    REFERENCES user ( -- 유저
      user_no -- 유저번호
    );

-- 첨부파일
ALTER TABLE file
  ADD CONSTRAINT FK_board_TO_file -- 게시판 -> 첨부파일
    FOREIGN KEY (
      board_no -- 게시판번호
    )
    REFERENCES board ( -- 게시판
      board_no -- 게시판번호
    );

-- 게시판좋아요
ALTER TABLE like_cnt
  ADD CONSTRAINT FK_user_TO_like_cnt -- 유저 -> 게시판좋아요
    FOREIGN KEY (
      user_no -- 유저번호
    )
    REFERENCES user ( -- 유저
      user_no -- 유저번호
    );

-- 게시판좋아요
ALTER TABLE like_cnt
  ADD CONSTRAINT FK_board_TO_like_cnt -- 게시판 -> 게시판좋아요
    FOREIGN KEY (
      board_no -- 게시판번호
    )
    REFERENCES board ( -- 게시판
      board_no -- 게시판번호
    );

-- 게시판싫어요
ALTER TABLE hate_cnt
  ADD CONSTRAINT FK_user_TO_hate_cnt -- 유저 -> 게시판싫어요
    FOREIGN KEY (
      user_no -- 유저번호
    )
    REFERENCES user ( -- 유저
      user_no -- 유저번호
    );

-- 게시판싫어요
ALTER TABLE hate_cnt
  ADD CONSTRAINT FK_board_TO_hate_cnt -- 게시판 -> 게시판싫어요
    FOREIGN KEY (
      board_no -- 게시판번호
    )
    REFERENCES board ( -- 게시판
      board_no -- 게시판번호
    );