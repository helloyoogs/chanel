CALL create_sequence('create_sequence');

INSERT INTO TBL_BOARD
(boardNum, boardTitle, boardContent, boardId)
VALUES(chanel_nextval('TBL_BOARD'), '테스트1', '테스트내용1', 'hds1234');

INSERT INTO TBL_REPLY
(replyNum, boardNum, memberId, replyContent)
VALUES(chanel_nextval('TBL_REPLY'), 1, 'hds1234', '테스트 댓글');

INSERT INTO TBL_BOARD
SELECT chanel_nextval('TBL_BOARD'), BOARDTITLE, BOARDCONTENT, BOARDID, NOW(),0 FROM TBL_BOARD;














		
