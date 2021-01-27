package notice;

import java.util.List;

public interface NoticeService {
	void noticeInsert(NoticeDTO dto);
	List<NoticeDTO> noticeList();
	NoticeDTO noticeDetail(int id);
	void noticeRead(int id);
	void noticeDelete(int id);
	void noticeUpdate(NoticeDTO dto);

}
