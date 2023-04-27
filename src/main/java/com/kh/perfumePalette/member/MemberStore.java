package com.kh.perfumePalette.member;

public interface MemberStore {

	int insertMember(Member member);

//	int login(Member member);
	Member login(Member member);

	Member selectMemberById(String memberId);

	int checkId(String memberId);
	
	int checkNickname(String memberNickname);
	
	int checkEmail(String memberEmail);

	int modifyMember(Member member);

	Member findId(Member member);

	Member findPw(Member member);

	int updatePw(Member member);

	Member checkPw(Member member);
	
	int bye(Member member);


	

}
