package notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired NoticeDAO dao;
	
	@Override
	public void noticeInsert(NoticeDTO dto) {
		dao.noticeInsert(dto);
	}

	@Override
	public NoticePage noticeList(NoticePage page) {
		return dao.noticeList(page);
	}

	public NoticeDTO noticeDetail(int id) {
		return dao.noticeDetail(id);
		
	}

	@Override
	public void noticeRead(int id) {
		dao.noticeRead(id);		
	}

	@Override
	public void noticeDelete(int id) {
		dao.noticeDelete(id);		
	}

	@Override
	public void noticeUpdate(NoticeDTO dto) {
		dao.noticeUpdate(dto);		
	}

}
