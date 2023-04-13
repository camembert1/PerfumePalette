package com.kh.perfumePalette.member;

public interface MemberService {

	int insertMember(Member member);

	int login(Member member);

	Member selectMemberById(String memberId);

	int checkId(String memberId);

	int checkEmail(String memberEmail);

	int checkNickname(String memberNickname);

	int modifyMember(Member member);

	Member findId(Member member);

	Member findPw(Member member);

	int updatePw(Member member);


}
