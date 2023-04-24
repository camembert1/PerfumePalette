package com.kh.perfumePalette.chatting;

import java.util.List;
import java.util.Map;

import com.kh.perfumePalette.member.Member;

public interface ChattingService {
	
	/**
	 * 채팅 목록 출력 Service
	 * @param receiverId
	 * @return List<Chatting>
	 */
	public List<Chatting> selectChattingById(String receiverId);

	/**
	 * 닉네임 검색 Service
	 * @return Member
	 */
	public List<Member> selectMemberByNick(String memberNickname);

	/**
	 * 아이디로 닉네임 출력 Service
	 * @param receiverId
	 * @return String
	 */
	public String getNicknameById(String receiverId);

	/**
	 * 메시지 목록 출력 Service
	 * @param map
	 * @return List<Chatting>
	 */
	public List<Chatting> selectAllChatting(Map<String, String> map);

	/**
	 * 메시지 전송 Service
	 * @param sendInfo
	 * @return int
	 */
	public int insertChatting(Map<String, String> sendInfo);

	/**
	 * 닉네임으로 아이디 출력 Service
	 * @param opponentNickname
	 * @return String
	 */
	public String getIdByNickname(String opponentNickname);

}
