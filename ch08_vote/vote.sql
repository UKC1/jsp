CREATE TABLE votelist (
  num number PRIMARY KEY,
  question varchar2(200) NOT NULL,
  sdate date,
  edate date,
  wdate date,
  type number DEFAULT 1 NOT NULL,
  active number DEFAULT 1
);

CREATE TABLE voteitem (
  listnum NUMBER,
  itemnum NUMBER DEFAULT 0,
  item varchar2(50),
  count NUMBER DEFAULT 0,
  PRIMARY KEY (listnum, itemnum)
); 

CREATE SEQUENCE SEQ_VOTE;