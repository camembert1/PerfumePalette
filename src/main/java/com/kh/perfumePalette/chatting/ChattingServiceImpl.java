package com.kh.perfumePalette.chatting;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.member.Member;

@Service
public class ChattingServiceImpl implements ChattingService{
	
	@Autowired
	private ChattingStore cStore;
	
	@Override
	public List<Chatting> selectChattingById(String loginId) {
		return cStore.selectChattingById(loginId);
	}
	
	@Override
	public List<Member> selectMemberByNick(String memberNickname) {
		return cStore.selectMemberByNick(memberNickname);
	}

	@Override
	public String getNicknameById(String receiverId) {
		return cStore.getNicknameById(receiverId);
	}

	@Override
	public List<Chatting> selectAllChatting(Map<String, String> map) {
		return cStore.selectAllChatting(map);
	}

	@Override
	public int insertChatting(Map<String, String> sendInfo) {
		return cStore.insertChatting(sendInfo);
	}

	@Override
	public String getIdByNickname(String opponentNickname) {
		return cStore.getIdByNickname(opponentNickname);
	}

}
