package notice;

import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO implements NoticeService{

	@Override
	public void notice_insert(NoticeDTO dto) {
		// TODO Auto-generated method stub
		
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
