package com.kh.perfumePalette.chatting;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public interface ChatStore {
	
	public List<ChatRoom> selectChatRoomList(SqlSession sqlSession);
	
	public int openChatRoom(SqlSession sqlSession, ChatRoom room);
	
	public int insertMessage(SqlSession sqlSession , Chat cm);
	
	public int joinCheck(SqlSession sqlSession, ChatRoom join);
	
	public void joinChatRoom(SqlSession sqlSession, ChatRoom join);
	
	public List<Chat> selectChatMessage(SqlSession sqlSession, int chatRoomNo);
	
	public int exitChatRoom(SqlSession sqlSession, Chat join);
	
	public int countChatRoomMember(SqlSession sqlSession, int chatRoomNo);
	
	public int closeChatRoom(SqlSession sqlSession, int chatRoomNo);

}
