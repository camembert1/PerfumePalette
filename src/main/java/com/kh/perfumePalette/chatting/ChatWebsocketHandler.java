package com.kh.perfumePalette.chatting;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.perfumePalette.member.Member;

public class ChatWebsocketHandler extends TextWebSocketHandler {

	@Autowired
	private ChatService cService;

	private static final Logger logger = LoggerFactory.getLogger(ChatWebsocketHandler.class);
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	// synchronizedSet : 동기화된 set은 반환해주는 메소드
	// 멀티스레드 환경에서 하나의 컬렉션요소에 여러 스레드가 동시에 접근하면 충돌이 발생할 수 있으므로 동기화를 충돌이 안나도록 진행

	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		Map map = (Map) session.getAttributes();
		Member member = (Member) map.get("member");

		if (member != null) {
			String id = member.getMemberId();
			// WebSocketSession : 웹소켓에 접속/요청한 클라이언트의 세션
			logger.info(session.getId() + "연결됨" + "(" + id + ")"); // 세션아이디 확인
			sessions.add(session); // 전달받은 webSocketSession을 set에 추가
		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		Map map = (Map) session.getAttributes();
		Member member = (Member) map.get("member");

		if (member != null) {
			sessions.remove(session);
		}
		// 웹소켓 연결이 종료되는 경우, sessions안에 저장되어있던 클라이언트의 session정보를 삭제
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TextMessage : 웹소켓을 이용해 전달된 텍스트가 담겨있는 객체
		// payload : 전송되는 데이터 (Json객체)
		// logger.info("전달된 메세지 : " + message.getPayload());

		// Jackson-databind : ObjectMapper 를 이용해서 JSON형태로 넘어온 데이터를 특정VO필드에 맞게 자동매핑
		ObjectMapper objectMapper = new ObjectMapper();

		Chat chatMessage = objectMapper.readValue(message.getPayload(), Chat.class);
		chatMessage.setChatDate(new Timestamp(System.currentTimeMillis()));
		logger.info("전달후 변환된 메세지 : " + chatMessage);

		// 전달 받은 채팅메세지를 db에 삽입
		int result = cService.insertMessage(chatMessage);
		if (result > 0) {
			// 같은방에 접속중인 클라이언트에게 전달받은 메세지를 보내기
			for (WebSocketSession s : sessions) {
				// 반복을 진행중인 websocketSession안에 담겨있는 방번호
				int roomNo = (Integer) s.getAttributes().get("roomNo");

				// 메세지에 담겨있는 채팅방 번호와 chatRoomNo가 같은지 비교
				if (chatMessage.getRoomNo() == roomNo) {
					// 같은 방 클라이언트에게 JSON형식으로 메세지를 보냄

					// s.sendMessage(new TextMessage( message.getPayload()));
					s.sendMessage(new TextMessage(new Gson().toJson(chatMessage)));
				}
			}

		}
	}
}