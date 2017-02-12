DROP TABLE members IF EXISTS;

CREATE TABLE members (
  id    INTEGER PRIMARY KEY,
  name  VARCHAR(255),
  phone VARCHAR(15),
  email	VARCHAR(50),
);

DROP TABLE books IF EXISTS;

CREATE TABLE books (
  id     INTEGER PRIMARY KEY,
  title  VARCHAR(255),
  author VARCHAR(50),
  ISBN	 VARCHAR(15),
);


DROP TABLE member_book_rel IF EXISTS;

CREATE TABLE member_book_rel (
  memberId  INTEGER,
  bookId	INTEGER,
  CONSTRAINT member_book_rel_PK PRIMARY KEY (memberId,bookId)
);

