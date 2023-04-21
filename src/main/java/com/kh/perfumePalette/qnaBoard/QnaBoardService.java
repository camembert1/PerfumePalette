package com.kh.perfumePalette.qnaBoard;

import java.util.List;

import com.kh.perfumePalette.PageInfo;

public interface QnaBoardService {
	
	/**
	 * 문의 게시판 list
	 * @param pi 
	 * @return List<QnaBoard>
	 */
	List<QnaBoard> selectAllQnaBoard(PageInfo pi);
	
	/**
	 * 문의 게시판 페이징
	 * @return
	 */
	int getqnaBoardCount();
	/**
	 * 문의 게시판 글쓰기
	 * @param qnaboard
	 * @return int
	 */
	int writeQnaBoard(QnaBoard qnaboard);

	/**
	 * 문의 게시판 상세 정보
	 * @param qnaNo
	 * @return QnaBoard
	 */
	QnaBoard QnaBoardDetail(Integer qnaNo);
	
	/**
	 * 
	 * @param qnaNo
	 * @return
	 */
	QnaBoard selectOneByNo(Integer qnaNo);

	/**
	 * 문의 게시판 수정
	 * @param qnaNo
	 * @return
	 */
	int updateqnaBoard(QnaBoard qnaNo);
	
	/**
	 * 문의 게시판 삭제
	 * @param qnaNo
	 * @return
	 */
	int deleteQnaBoard(int qnaNo);

	


}
