package com.kh.perfumePalette.chatting;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatStore cStore;
	@Autowired
	private SqlSession sqlSession;

	@Override
	// 채팅 목록 조회
	public List<ChatRoom> selectChatRoomList() {

		return cStore.selectChatRoomList(sqlSession);
	}

	@Override
	public int openChatRoom(ChatRoom room) {

		return cStore.openChatRoom(sqlSession, room);
	}

	@Override
	public int insertMessage(Chat cm) {

		return cStore.insertMessage(sqlSession, cm);
	}

	@Override
	public List<Chat> joinChatRoom(ChatRoom join) {

		// 현재 회원이 해당 채팅방에 참여중인지 아닌지 확인.
		int result = cStore.joinCheck(sqlSession, join);

		if (result == 0) { // 아직 채팅방에 참여하지 않았으면 참여하기가 되게 설정
			cStore.joinChatRoom(sqlSession, join);
		}

		// 채팅 메세지 목록 조회.
		return cStore.selectChatMessage(sqlSession, join.getRoomNo());
	}

	@Override
	public int exitChatRoom(Chat join) {

		// 채팅방 나가기
		int result = cStore.exitChatRoom(sqlSession, join);

		if (result > 0) { // 채팅방 나가기 성공시

			// 현재방에 몇명이 남아있는지 확인, 내가 마지막 인원인경우 채팅방을 닫기.
			int cnt = cStore.countChatRoomMember(sqlSession, join.getRoomNo());

			// 0명일 경우 방닫기
			if (cnt == 0) {
				result = cStore.closeChatRoom(sqlSession, join.getRoomNo());
			}

		}
		return result;
	}

}