create table reply(
	no number primary key,
	content varchar2(400),
	ref number,
	name varchar2(20),
	redate date
)

create sequence SEQ_REPLY;

insert into reply values(SEQ_REPLY.NEXTVAL,'와우! 첫 댓글', 1, '김처음','2023/12/02');
insert into reply values(SEQ_REPLY.NEXTVAL,'멋지군요', 1, '박멋짐','2023/12/12');
insert into reply values(SEQ_REPLY.NEXTVAL,'굉장하군요', 1, '이굉장','2023/12/15');
insert into reply values(SEQ_REPLY.NEXTVAL,'아름다워요', 1, '황아름','2024/01/03');

commit;