package notice;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO implements NoticeService{
	@Autowired private SqlSession sql;

	@Override
	public void notice_insert(NoticeDTO dto) {
		sql.insert("notice.mapper.insert", dto);
	}

	@Override
	public void notice_reply_insert(NoticeDTO dto) {
		sql.insert("notice.mapper.reply_insert", dto);
	}

	@Override
	public NoticePage notice_list(NoticePage page) {
		//
		return page;
	}

	@Override
	public NoticeDTO notice_detail(int id) {
		//return sql.selectOne("notice.mapper.detail", id);
		return null;
	}

	@Override
	public void notice_read(int id) {
		//sql.update("notice.mapper.read", id);
	}

	@Override
	public void notice_update(NoticeDTO dto) {
		sql.update("notice.mapper.update", dto);
	}

	@Override
	public void notice_delete(int id) {
		sql.delete("notice.mapper.delete", id);
	}

}
