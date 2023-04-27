package com.kh.perfumePalette.chatting;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.perfumePalette.member.Member;

@Controller
@RequestMapping("/chat")
public class ChattingController {

	@Autowired
	private ChattingService cService;

	static final String adminId = "admin";

	// 관리자와 이용자의 실시간 채팅 기능

//	// 채팅방 목록
//	@GetMapping("/list")
//	@ResponseBody
//	public List<Chatting> chattingList(HttpSession session) {
//		String memberId = (((Member) session.getAttribute("member")).getMemberId());
//		List<Chatting> chatList = chatService.selectChattingById(memberId);
//		for (Chatting chatting : chatList) {
//			if (chatting.getMemberNickname() == null) {
//				chatting.setMemberNickname(adminId);
//			}
//		}
//		Set<String> senderNicknameSet = new HashSet<>(); // senderNickname 값을 저장할 HashSet
//		List<Chatting> distinctChatList = new ArrayList<>(); // 중복된 Chatting 객체를 제거한 리스트
//
//		for (Chatting chatting : chatList) {
//			if (senderNicknameSet.add(chatting.getMemberNickname())) {
//				distinctChatList.add(chatting);
//			}
//		}
//
//		return distinctChatList;
//	}
//
//	// [채팅] 채팅방 입장
//	@GetMapping("/start")
//	@ResponseBody
//	public List<Chatting> messageList(HttpSession session) {
//		if (session.getAttribute("member") != null) {
//			String memberId = (((Member) session.getAttribute("member")).getMemberId());
//			List<Chatting> msgList = chatService.selectAllChatting(map);
//			return msgList;
//		} else {
//			return null;
//		}
//	}
//
//	// [채팅] 닉네임 검색
//	@GetMapping("/select")
//	@ResponseBody
//	public List<Member> searchNickname(String memberNickname) {
//		if (memberNickname == "") {
//			List<Member> memList = null;
//			return memList;
//		}
//		List<Member> memList = chatService.selectMemberByNick(memberNickname);
//		return memList;
//	}

	// [채팅] 메시지 전송
	@PostMapping("/insert")
	@ResponseBody
	public List<Chatting> insert(@RequestBody Map<String, String> map, HttpSession session) {

		try {
			// 전송자
			Member member = ((Member) session.getAttribute("member"));
			String memberId = member.getMemberId();
			String memberNickname = member.getMemberNickname();
			
			// 수신자(관리자)
			String chatContent = map.get("chatContent");
			System.out.println("이용자 ID: " + memberId);
			System.out.println("이용자 닉네임: " + memberNickname);
			System.out.println("수신 내용: " + chatContent);

			Map<String, String> sendInfo = new HashMap<String, String>();
			sendInfo.put("memberId", memberId);
			sendInfo.put("memberNickname", memberNickname);
			sendInfo.put("chatContent", chatContent);

			int result = cService.insertChatting(sendInfo);
			if (result > 0) {
				List<Chatting> msgList = cService.selectAllChatting(sendInfo);
				for (Chatting chatting : msgList) {
					System.out.println(chatting);
				}
				return msgList;
			} else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

}