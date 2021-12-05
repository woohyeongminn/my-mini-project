-- 유저
DROP TABLE IF EXISTS user RESTRICT;

-- 게시판
DROP TABLE IF EXISTS board RESTRICT;

-- 첨부파일
DROP TABLE IF EXISTS file RESTRICT;

-- 게시판좋아요
DROP TABLE IF EXISTS board_like RESTRICT;

-- 게시판싫어요
DROP TABLE IF EXISTS board_hate RESTRICT;

-- 댓글
DROP TABLE IF EXISTS comment RESTRICT;

-- 댓글싫어요
DROP TABLE IF EXISTS comment_hate RESTRICT;

-- 댓글좋아요
DROP TABLE IF EXISTS comment_like RESTRICT;

-- 유저
CREATE TABLE user (
  user_no  INTEGER      NOT NULL COMMENT '유저번호', -- 유저번호
  name     VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
  nickname VARCHAR(50)  NOT NULL COMMENT '닉네임', -- 닉네임
  email    VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
  password VARCHAR(255) NOT NULL COMMENT '암호', -- 암호
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
  name     VARCHAR(50)  NOT NULL COMMENT '파일이름', -- 파일이름
  path     VARCHAR(255) NOT NULL COMMENT '파일경로', -- 파일경로
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
CREATE TABLE board_like (
  user_no  INTEGER NOT NULL COMMENT '유저번호', -- 유저번호
  board_no INTEGER NOT NULL COMMENT '게시판번호' -- 게시판번호
)
COMMENT '게시판좋아요';

-- 게시판좋아요
ALTER TABLE board_like
  ADD CONSTRAINT PK_board_like -- 게시판좋아요 기본키
    PRIMARY KEY (
      user_no -- 유저번호
    );

-- 게시판싫어요
CREATE TABLE board_hate (
  user_no  INTEGER NOT NULL COMMENT '유저번호', -- 유저번호
  board_no INTEGER NOT NULL COMMENT '게시판번호' -- 게시판번호
)
COMMENT '게시판싫어요';

-- 게시판싫어요
ALTER TABLE board_hate
  ADD CONSTRAINT PK_board_hate -- 게시판싫어요 기본키
    PRIMARY KEY (
      user_no -- 유저번호
    );

-- 댓글
CREATE TABLE comment (
  comment_no INTEGER NOT NULL COMMENT '댓글번호', -- 댓글번호
  comment    TEXT    NOT NULL COMMENT '댓글', -- 댓글
  board_no   INTEGER NOT NULL COMMENT '게시판번호', -- 게시판번호
  user_no    INTEGER NOT NULL COMMENT '유저번호' -- 유저번호
)
COMMENT '댓글';

-- 댓글
ALTER TABLE comment
  ADD CONSTRAINT PK_comment -- 댓글 기본키
    PRIMARY KEY (
      comment_no -- 댓글번호
    );

-- 댓글싫어요
CREATE TABLE comment_hate (
  user_no    INTEGER NOT NULL COMMENT '유저번호', -- 유저번호
  comment_no INTEGER NOT NULL COMMENT '댓글번호' -- 댓글번호
)
COMMENT '댓글싫어요';

-- 댓글좋아요
CREATE TABLE comment_like (
  user_no    INTEGER NOT NULL COMMENT '유저번호', -- 유저번호
  comment_no INTEGER NOT NULL COMMENT '댓글번호' -- 댓글번호
)
COMMENT '댓글좋아요';

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
ALTER TABLE board_like
  ADD CONSTRAINT FK_user_TO_board_like -- 유저 -> 게시판좋아요
    FOREIGN KEY (
      user_no -- 유저번호
    )
    REFERENCES user ( -- 유저
      user_no -- 유저번호
    );

-- 게시판좋아요
ALTER TABLE board_like
  ADD CONSTRAINT FK_board_TO_board_like -- 게시판 -> 게시판좋아요
    FOREIGN KEY (
      board_no -- 게시판번호
    )
    REFERENCES board ( -- 게시판
      board_no -- 게시판번호
    );

-- 게시판싫어요
ALTER TABLE board_hate
  ADD CONSTRAINT FK_user_TO_board_hate -- 유저 -> 게시판싫어요
    FOREIGN KEY (
      user_no -- 유저번호
    )
    REFERENCES user ( -- 유저
      user_no -- 유저번호
    );

-- 게시판싫어요
ALTER TABLE board_hate
  ADD CONSTRAINT FK_board_TO_board_hate -- 게시판 -> 게시판싫어요
    FOREIGN KEY (
      board_no -- 게시판번호
    )
    REFERENCES board ( -- 게시판
      board_no -- 게시판번호
    );

-- 댓글
ALTER TABLE comment
  ADD CONSTRAINT FK_board_TO_comment -- 게시판 -> 댓글
    FOREIGN KEY (
      board_no -- 게시판번호
    )
    REFERENCES board ( -- 게시판
      board_no -- 게시판번호
    );

-- 댓글
ALTER TABLE comment
  ADD CONSTRAINT FK_user_TO_comment -- 유저 -> 댓글
    FOREIGN KEY (
      user_no -- 유저번호
    )
    REFERENCES user ( -- 유저
      user_no -- 유저번호
    );

-- 댓글싫어요
ALTER TABLE comment_hate
  ADD CONSTRAINT FK_user_TO_comment_hate -- 유저 -> 댓글싫어요
    FOREIGN KEY (
      user_no -- 유저번호
    )
    REFERENCES user ( -- 유저
      user_no -- 유저번호
    );

-- 댓글싫어요
ALTER TABLE comment_hate
  ADD CONSTRAINT FK_comment_TO_comment_hate -- 댓글 -> 댓글싫어요
    FOREIGN KEY (
      comment_no -- 댓글번호
    )
    REFERENCES comment ( -- 댓글
      comment_no -- 댓글번호
    );

-- 댓글좋아요
ALTER TABLE comment_like
  ADD CONSTRAINT FK_user_TO_comment_like -- 유저 -> 댓글좋아요
    FOREIGN KEY (
      user_no -- 유저번호
    )
    REFERENCES user ( -- 유저
      user_no -- 유저번호
    );

-- 댓글좋아요
ALTER TABLE comment_like
  ADD CONSTRAINT FK_comment_TO_comment_like -- 댓글 -> 댓글좋아요
    FOREIGN KEY (
      comment_no -- 댓글번호
    )
    REFERENCES comment ( -- 댓글
      comment_no -- 댓글번호
    );