package notice;

public interface NoticeService {
	
	void notice_insert(NoticeDTO dto); 		//신규저장:C
	void notice_reply_insert(NoticeDTO dto); 	//답글신규저장:C
	NoticePage notice_list(NoticePage page);//공지글목록조회(페이지단위):R
	NoticeDTO notice_detail( int id ); 		//공지글 상세조회:R
	void notice_read(int id); 				//조회로 인한 조회수 증가:U
	void notice_update(NoticeDTO dto); 		//공지글 정보 변경저장:U
	void notice_delete(int id); 			//공지글 삭제
}
