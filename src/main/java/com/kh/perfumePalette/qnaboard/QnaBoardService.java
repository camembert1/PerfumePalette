package com.kh.perfumePalette.qnaboard;

import java.util.List;

public interface QnaBoardService {

	List<QnaBoard> selectAllQnaBoard();

	int writeQnaBoard(QnaBoard qnaboard);

}
