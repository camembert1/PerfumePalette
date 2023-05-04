package com.kh.perfumePalette.chatting;

import java.util.List;

public interface ChatService {
	
	public List<ChatRoom> selectChatRoomList();
	
	public int openChatRoom(ChatRoom room);
	
	public int insertMessage(Chat cm);
	
	public List<Chat> joinChatRoom(ChatRoom join);

	public int exitChatRoom(Chat join);

//	public Chat getFirstMessage(int roomNo);
}
