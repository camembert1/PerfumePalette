package com.kh.perfumePalette.chatting;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.perfumePalette.member.Member;

@Repository
public class ChattingStoreImpl implements ChattingStore{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Chatting> selectChattingById(String loginId) {
		List<Chatting> chattingList = session.selectList("ChattingMapper.selectChattingById", loginId);
		return chattingList;
	}

	@Override
	public List<Member> selectMemberByNick(String memberNickname) {
		List<Member> memList = session.selectList("ChattingMapper.selectMemberByNick", memberNickname);
		return memList;
	}

	@Override
	public String getNicknameById(String receiverId) {
		String receiverNickname = session.selectOne("ChattingMapper.getNicknameById", receiverId);
		return receiverNickname;
	}

	@Override
	public List<Chatting> selectAllChatting(Map<String, String> map) {
		List<Chatting> msgList = session.selectList("ChattingMapper.selectAllChatting", map);
		return msgList;
	}

	@Override
	public int insertChatting(Map<String, String> sendInfo) {
		int result = session.insert("ChattingMapper.insertChatting", sendInfo);
		return result;
	}

	@Override
	public String getIdByNickname(String opponentNickname) {
		String result = session.selectOne("ChattingMapper.getIdByNickname", opponentNickname);
		return result;
	}

}
