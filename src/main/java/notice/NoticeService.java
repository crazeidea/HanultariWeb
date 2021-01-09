package notice;

public interface NoticeService {
	void noticeInsert(NoticeDTO dto);
	NoticePage noticeList(NoticePage page);
	NoticeDTO noticeDetail(int id);
	void noticeRead(int id);
	void noticeDelete(int id);
	void noticeUpdate(NoticeDTO dto);

}
