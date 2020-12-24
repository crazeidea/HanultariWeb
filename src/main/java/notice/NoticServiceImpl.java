package notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticServiceImpl implements NoticeService {
	@Autowired private NoticeDAO dao;

	@Override
	public void notice_insert(NoticeDTO dto) {
		dao.notice_insert(dto);
	}

	@Override
	public void notice_reply_insert(NoticeDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public NoticePage notice_list(NoticePage page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeDTO notice_detail(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void notice_read(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void notice_update(NoticeDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void notice_delete(int id) {
		// TODO Auto-generated method stub
		
	}

}
