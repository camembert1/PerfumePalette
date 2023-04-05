package com.kh.perfumePalette.member;

public interface MemberStore {

	int insertMember(Member member);

	int login(Member member);

	Member selectMemberById(String memberId);

	int checkId(String memberId);
	
	int checkNickname(String memberNickname);
	
	int checkEmail(String memberEmail);

	

}
