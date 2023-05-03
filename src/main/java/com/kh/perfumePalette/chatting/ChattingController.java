package com.kh.perfumePalette.chatting;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.perfumePalette.Alert;
import com.kh.perfumePalette.member.Member;

@Controller
//@SessionAttributes({ "member", "roomNo" })
//model에 추가된 값의 key와 SessionAttribute 어노테이션에 작성된 키값이 같으면 해당 값을 session Scope에 자동으로 이동시켜줌
public class ChattingController {

	@Autowired
	private ChatService cService;

	// 채팅방 목록 조회
	@GetMapping("/chat/chatRoomList")
	public String selectChatRoomList(Model model, HttpSession session) {

		try {
			List<ChatRoom> crList = cService.selectChatRoomList();
			Member member = (Member) session.getAttribute("member");
			if (member == null || !member.getMemberId().equals("admin")) {
				Alert alert = new Alert("/", "접근권한이 없습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			} else {
				if (crList.size() == 0) {
					Alert alert = new Alert("/", "개설된 채팅방이 존재하지 않습니다.");
					model.addAttribute("alert", alert);
					return "common/alert";
				} else {
					model.addAttribute("chatRoomList", crList);
					return "chat/chatRoomList";
				}
			}
		} catch (Exception e) {
			e.printStackTrace(); // 콘솔창에 에러 출력
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}

	}

	// 채팅방 만들기
	@PostMapping("/chat/openChatRoom")
	public String openChatRoom(Model model, ChatRoom room, RedirectAttributes ra, HttpSession session) {
		Member member = (Member) session.getAttribute("member");

		room.setMemberId(member.getMemberId());

		int chatRoomNo = cService.openChatRoom(room);
		// pk값을 반환 받기 위해 객체이름을 chatRoomNo으로 작성

		String path = "redirect:/chat/";

		if (chatRoomNo > 0) {
			ra.addFlashAttribute("alertMsg", "채팅방 만들기 성공");
			path += "chatRoomList";

		} else {
			path += "chatRoomList";
			ra.addFlashAttribute("alertMsg", "채팅방 만들기 실패");

		}

		return path;
	}

	// 채팅방 만들기
	@PostMapping("/chat/openChatRoom2")
	@ResponseBody
	public int openChatRoomAjax(Model model, ChatRoom room, RedirectAttributes ra, HttpSession session) {
		Member member = (Member) session.getAttribute("member");

		room.setMemberId(member.getMemberId());

		int chatRoomNo = cService.openChatRoom(room);
		// pk값을 반환 받기 위해 객체이름을 chatRoomNo으로 작성

		// 채팅방 개설 첫 메세지 설정
		Chat chat = new Chat();
		chat.setChatContent("안녕하세요. 𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆입니다.");
		chat.setRoomNo(chatRoomNo);
		chat.setMemberId("admin");
		cService.insertMessage(chat);

		session.setAttribute("roomNo", chatRoomNo);

		return chatRoomNo;
	}

	// 관리자가 입장할때
	// 채팅방 입장
	@GetMapping("/chat/room/{roomNo}")
	public String joinChatRoom(Model model, @PathVariable("roomNo") int roomNo, ChatRoom join, RedirectAttributes ra,
			HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		join.setMemberId(member.getMemberId());
		List<Chat> list = cService.joinChatRoom(join);

		session.setAttribute("list", list);
		session.setAttribute("roomNo", roomNo);
//		model.addAttribute("list", list);
//		model.addAttribute("roomNo", roomNo); // session스코프에 roomNo저장됨.

		return "chat/chatRoom";

	}

	// 이용자가 입장할때
	// 채팅방 입장
	@GetMapping("/chat/room2/{roomNo}")
	@ResponseBody
	public void joinChatRoomAjax(Model model, @PathVariable("roomNo") int roomNo, ChatRoom join, RedirectAttributes ra,
			HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		join.setMemberId(member.getMemberId());
		List<Chat> list = cService.joinChatRoom(join);

		session.setAttribute("list", list);
//		model.addAttribute("list", list);
//		model.addAttribute("roomNo", roomNo); // session스코프에 roomNo저장됨.

	}

	// 채팅방 나가기
	@GetMapping("/chat/exit")
	@ResponseBody
	public int exitChatRoom(@ModelAttribute Chat join) {
		System.out.println(join);

		return cService.exitChatRoom(join);
	}

//	// 채팅방 개설 첫 메세지 가져오기
//	@GetMapping("/chat/getFirstMessage")
//	@ResponseBody
//	public Chat getFirstMessage(int roomNo) {
//	  return cService.getFirstMessage(roomNo);
//	}
	
}