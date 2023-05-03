package com.kh.perfumePalette.chatting;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ChatStoreImpl implements ChatStore {

	public List<ChatRoom> selectChatRoomList(SqlSession sqlSession) {

		return sqlSession.selectList("roomMapper.selectChatRoomList");
	}

	public int openChatRoom(SqlSession sqlSession, ChatRoom room) {

		int result = sqlSession.insert("roomMapper.openChatRoom", room);

		if (result > 0) {
			return room.getRoomNo();
		} else {
			return 0;
		}
	}

	public int insertMessage(SqlSession sqlSession, Chat cm) {
		return sqlSession.insert("chatMapper.insertMessage", cm);
	}

	// 채팅방 참여 여부 확인 / 참여 : 1, 미참여 : 0
	public int joinCheck(SqlSession sqlSession, ChatRoom join) {
		return sqlSession.selectOne("chatMapper.joinCheck", join);
	}

	// 채팅방 참여하는 메서드
	public void joinChatRoom(SqlSession sqlSession, ChatRoom join) {
		sqlSession.insert("chatMapper.joinChatRoom", join);
	}

	// 채팅메세지 목록 조회
	public List<Chat> selectChatMessage(SqlSession sqlSession, int roomNo) {
		return sqlSession.selectList("chatMapper.selectChatList", roomNo);
	}

	// 채팅방 나가기
	public int exitChatRoom(SqlSession sqlSession, Chat join) {
		return sqlSession.delete("roomMapper.exitChatRoom", join);
	}

	// 채팅방에 남아 있는 인원 찾기는 메소드
	public int countChatRoomMember(SqlSession sqlSession, int roomNo) {
		return sqlSession.selectOne("roomMapper.countChatRoomMember", roomNo);
	}

	// 채팅방에 0명 존재하면 채팅방을 없애준다.
	public int closeChatRoom(SqlSession sqlSession, int roomNo) {
		return sqlSession.update("roomMapper.closeChatRoom", roomNo);
	}

//	@Override
//	public Chat selectFirstMessage(SqlSession sqlSession, int roomNo) {
//		return sqlSession.selectOne("chatMapper.selectFirstMessage", roomNo);
//	}
}
