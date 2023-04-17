package com.kh.perfumePalette.qnaBoard;

import java.util.List;

public interface QnaBoardService {

	List<QnaBoard> selectAllQnaBoard();

	int writeQnaBoard(QnaBoard qnaboard);

}
