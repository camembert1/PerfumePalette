package com.kh.perfumePalette.chatting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.perfumePalette.member.Member;

@Controller
@SessionAttributes({ "member", "roomNo" })
//model에 추가된 값의 key와 SessionAttribute 어노테이션에 작성된 키값이 같으면 해당 값을 session Scope에 자동으로 이동시켜줌
public class ChattingController {

	@Autowired
	private ChatService cService;

	// 채팅방 목록 조회
	@GetMapping("/chat/chatRoomList")
	public String selectChatRoomList(Model model) {

		try {
			List<ChatRoom> crList = cService.selectChatRoomList();
			if (crList.size() == 0) {
//				Alert alert = new Alert("/", "채팅방이 존재하지 않습니다.");
//				model.addAttribute("alert", alert);
				return "chat/chatRoomList";
			} else {
				model.addAttribute("chatRoomList", crList);
				return "chat/chatRoomList";
			}
		} catch (Exception e) {
			e.printStackTrace(); // 콘솔창에 에러 출력
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}

	}

	// 채팅방 만들기
	@PostMapping("/chat/openChatRoom")
	public String openChatRoom(@ModelAttribute("member") Member member, // loginUser값을 얻어와야해서 @ModelAttribute 생략하면
																		// 안됨
			Model model, ChatRoom room, RedirectAttributes ra) {

		// @ModelAttribute -> 커맨드객체 (@ModelAttribute는 생략가능)

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
	public int openChatRoomAjax(@ModelAttribute("member") Member member, // loginUser값을 얻어와야해서 @ModelAttribute 생략하면
																			// 안됨
			Model model, ChatRoom room, RedirectAttributes ra) {

		// @ModelAttribute -> 커맨드객체 (@ModelAttribute는 생략가능)

		room.setMemberId(member.getMemberId());

		int chatRoomNo = cService.openChatRoom(room);
		// pk값을 반환 받기 위해 객체이름을 chatRoomNo으로 작성

		return chatRoomNo;
	}

	// 채팅방 입장
	@GetMapping("/chat/room/{roomNo}")
	public String joinChatRoom(@ModelAttribute("member") Member member, Model model, @PathVariable("roomNo") int roomNo,
			ChatRoom join, RedirectAttributes ra) {
		join.setMemberId(member.getMemberId());
		List<Chat> list = cService.joinChatRoom(join);

		model.addAttribute("list", list);
		model.addAttribute("roomNo", roomNo); // session스코프에 roomNo저장됨.

		return "chat/chatRoom";

	}

	// 채팅방 입장
	@GetMapping("/chat/room2/{roomNo}")
	@ResponseBody
	public void joinChatRoomAjax(@ModelAttribute("member") Member member, Model model, @PathVariable("roomNo") int roomNo,
			ChatRoom join, RedirectAttributes ra) {
		join.setMemberId(member.getMemberId());
		List<Chat> list = cService.joinChatRoom(join);

		model.addAttribute("list", list);
		model.addAttribute("roomNo", roomNo); // session스코프에 roomNo저장됨.

	}

	// 채팅방 나가기
	@GetMapping("/chat/exit")
	@ResponseBody
	public int exitChatRoom(@ModelAttribute Chat join) {
		System.out.println(join);

		return cService.exitChatRoom(join);
	}

}