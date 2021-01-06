package controller;

import java.io.File;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import command.CommonService;
import member.MemberDTO;
import notice.NoticeDTO;
import notice.NoticePage;
import notice.NoticeServiceImpl;

@Controller
public class NoticeController {
	
	@Autowired private CommonService common;
	@Autowired private NoticeServiceImpl noticeService;
	@Autowired private NoticePage page;
	
	//답글저장처리
	@RequestMapping("/reply_insert.no")
	public String reply_insert(NoticeDTO dto, HttpSession session, MultipartFile file) {
		if (!file.isEmpty()) {
			dto.setFilename(file.getOriginalFilename());
			dto.setFilepath(common.upload("notice", file, session));
		}
		dto.setWriter(((MemberDTO)session.getAttribute("login_info")).getNickname());
		noticeService.notice_reply_insert(dto);
		return "redirect:list.no";
	}
	
	//답글쓰기 화면
	@RequestMapping("/reply.no")
	public String reply(int id, Model model) {
		model.addAttribute("dto", noticeService.notice_detail(id));
		return "notice/reply";
	}
	
	//공지사항 변경 저장처리
	@RequestMapping("/update.no")
	public String update(NoticeDTO dto, HttpSession session, String attach, MultipartFile file) {
		NoticeDTO notice = noticeService.notice_detail(dto.getId());
		String uuid = session.getServletContext().getRealPath("resources") + "/" + notice.getFilepath();
		
		if (!file.isEmpty()) {
			dto.setFilename(file.getOriginalFilename());
			dto.setFilepath(common.upload("notice", file, session));
			if (notice.getFilename()!=null) {
				File f = new File(uuid);
				if(f.exists()) f.delete();
			}
		} else {
			if (attach.isEmpty()) {
				File f = new File(uuid);
				if(f.exists()) f.delete();
			} else {
				dto.setFilename(notice.getFilename());
				dto.setFilepath(notice.getFilepath());
			}
		}
		noticeService.notice_update(dto);
		return "redirect:detail.no?id="+ dto.getId();
	}
	
	//공지사항 수정화면 
	@RequestMapping("/modify.no")
	public String modify(Model model, int id) {
		model.addAttribute("dto", noticeService.notice_detail(id));
		return "notice/modify";
	}
	
	//공지사항 삭제처리 
	@RequestMapping("/delete.no")
	public String delete(int id, HttpSession session) {
		NoticeDTO dto = noticeService.notice_detail(id);
		if (dto.getFilename()!=null) {
			File file = new File(session.getServletContext().getRealPath("resources") + "/" + dto.getFilepath());
			if (file.exists()) file.delete();
		}
		noticeService.notice_delete(id);
		return "redirect:list.no";
	}
	
	//공지사항 첨부된 첨부파일 다운로드 요청
	@RequestMapping("/download.no")
	public void download(int id, HttpSession session, HttpServletResponse response) {
		NoticeDTO dto = noticeService.notice_detail(id);
		common.download(dto.getFilename(), dto.getFilepath(), session, response);
	}
	
	//공지사항 상세페이지 화면요청
	@RequestMapping("/detail.no")
	public String detail(Model model, int id) {
		noticeService.notice_read(id);
		model.addAttribute("dto", noticeService.notice_detail(id));
		model.addAttribute("page", page);
		model.addAttribute("crlf", "\r\n");
		return "notice/detail";
	}
	
	//공지사항 작성페이지 저장요청
	@RequestMapping("/insert.no")
	public String insert(NoticeDTO dto, HttpSession session, MultipartFile file) {
		MemberDTO member = (MemberDTO)session.getAttribute("login_info");
		dto.setWriter(member.getNickname());
		
		if(!file.isEmpty()) {
			dto.setFilename(file.getOriginalFilename());
			dto.setFilepath(common.upload("notice", file, session));
		}
		
		noticeService.notice_insert(dto);
		
		return "redirect:list.no";
	}
	
	//공지사항 작성페이지 화면
	@RequestMapping("/create.no")
	public String notice() {
		return "notice/create";
	}
	
	//공지사항 목록 화면 요청
	@RequestMapping("/list.no")
	public String list(HttpSession session, Model model
						, @RequestParam(defaultValue = "") String search
						, @RequestParam(defaultValue = "") String keyword 
						, @RequestParam(defaultValue = "1") int curPage) {
		session.setAttribute("category", "no");
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		model.addAttribute("page", noticeService.notice_list(page));
		return "notice/list";
	}

}
