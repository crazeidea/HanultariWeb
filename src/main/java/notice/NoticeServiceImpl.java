package notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired private NoticeDAO dao;

	@Override
	public void notice_insert(NoticeDTO dto) {
		dao.notice_insert(dto);
	}

	@Override
	public void notice_reply_insert(NoticeDTO dto) {
		dao.notice_reply_insert(dto);
	}

	@Override
	public NoticePage notice_list(NoticePage page) {
		return dao.notice_list(page);
	}

	@Override
	public NoticeDTO notice_detail(int id) {
		return dao.notice_detail(id);
	}

	@Override
	public void notice_read(int id) {
		dao.notice_read(id);
	}

	@Override
	public void notice_update(NoticeDTO dto) {
		dao.notice_update(dto);
	}

	@Override
	public void notice_delete(int id) {
		dao.notice_delete(id);
	}

}
