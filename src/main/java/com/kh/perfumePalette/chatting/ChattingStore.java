package com.kh.perfumePalette.chatting;

import java.util.List;
import java.util.Map;

import com.kh.perfumePalette.member.Member;

public interface ChattingStore {

	/**
	 * 채팅 목록 출력 Store
	 * 
	 * @param session
	 * @param receiverId
	 * @return List<Chatting>
	 */
	public List<Chatting> selectChattingById(String loginId);

	/**
	 * 닉네임 검색 Store
	 * 
	 * @param session
	 * @param memberNickname
	 * @return Member
	 */
	public List<Member> selectMemberByNick(String memberNickname);

	/**
	 * 아이디로 닉네임 검색 Store
	 * 
	 * @param session
	 * @param receiverId
	 * @return String
	 */
	public String getNicknameById(String receiverId);

	/**
	 * 메시지 목록 출력 Store
	 * 
	 * @param session
	 * @param map
	 * @return List<Chatting>
	 */
	public List<Chatting> selectAllChatting(Map<String, String> map);

	/**
	 * 메시지 전송 Store
	 * 
	 * @param session
	 * @param sendInfo
	 * @return int
	 */
	public int insertChatting(Map<String, String> sendInfo);

	/**
	 * 닉네임으로 아이디 검색 Store
	 * 
	 * @param session
	 * @param opponentNickname
	 * @return String
	 */
	public String getIdByNickname(String opponentNickname);

}
