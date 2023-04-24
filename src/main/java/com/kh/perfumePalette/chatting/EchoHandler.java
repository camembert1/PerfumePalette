package com.kh.perfumePalette.chatting;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.perfumePalette.member.Member;

@Component
public class EchoHandler extends TextWebSocketHandler {

	private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String memberNickname = getMemberNickname(session);
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(memberNickname + "님이 접속했습니다."));
		}
		sessionList.add(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String memberNickname = getMemberNickname(session);

		// 사용자가 접속중인지 아닌지
		WebSocketSession chatwritingSession = users.get(getMemberNickname(session));
		if (chatwritingSession != null) {
			TextMessage textMessage = new TextMessage(memberNickname + " 님이 메세지를 보냈습니다.");
			chatwritingSession.sendMessage(textMessage);
		}
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(memberNickname + ": " + message.getPayload()));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	    String memberNickname = getMemberNickname(session);
//	    System.out.println("연결 끊어짐");
	    for (WebSocketSession sess : sessionList) {
	        if (sess.isOpen()) { // 세션이 열려있는 경우에만 메시지를 보냅니다.
	            sess.sendMessage(new TextMessage(memberNickname + "님의 연결이 끊어졌습니다."));
	        }
	    }
	    sessionList.remove(session);
	    if (session.isOpen()) { // 세션이 열려있는 경우에만 소켓을 닫습니다.
	        session.close();
	    }
	}


	public String getMemberNickname(WebSocketSession session) throws Exception {
		Map<String, Object> map;
		map = session.getAttributes();
		String memberNickname = (String) ((Member) map.get("member")).getMemberNickname();
		return memberNickname;
	}
}