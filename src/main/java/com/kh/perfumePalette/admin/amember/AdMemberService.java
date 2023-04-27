package com.kh.perfumePalette.admin.amember;

import java.util.List;

import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.Search;
import com.kh.perfumePalette.member.Member;

public interface AdMemberService {

	/**
	 * 회원 수정
	 * @param member
	 * @return int
	 */
	int updateAmModify(Member member);
	
	/**
	 * 회원 리스트
	 * @return List<Member> 
	 */
	List<Member> selectAdMemberList(PageInfo pi);

	/**
	 * 회원 상세 정보
	 * @param memberNo
	 * @return Member
	 */
	Member selectOneByNo(int memberNo);

	/**
	 * 회원 다중 삭제
	 * @param memberNo
	 * @return int
	 */
	int deleteAdMember(int memberNo);

	/**
	 * 회원 검색 갯수 Service
	 * @param search
	 * @return int
	 */
	int getListCount(Search search);

	/**
	 * 회원 검색 Service
	 * @param search
	 * @return List<Member>
	 */
	List<Member> selectListByKeyword(PageInfo pi, Search search);

	/**
	 * 회원 페이징 Service
	 * @return
	 */
	int getListCount();

	/**
	 * 회원 일시 정지 Service
	 * @param i
	 * @return int
	 */
	int updateStopMember(int i);

	/**
	 * 회원 정지 풀림 Service
	 * @param i
	 * @return int
	 */
	int updateStartMember(int i);


}
