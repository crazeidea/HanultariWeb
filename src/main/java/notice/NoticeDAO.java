package notice;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO implements NoticeService {
	
	@Autowired private SqlSession sql; 

	@Override
	public void noticeInsert(NoticeDTO dto) {
		sql.insert("notice.mapper.insert", dto);
		
	}

	@Override
	public NoticePage noticeList(NoticePage page) {
		page.setTotalList(sql.selectOne("notice.mapper.total_count", page));
		page.setList(sql.selectList("notice.mapper.list", page));
		return page;
	}

	public NoticeDTO noticeDetail(int id) {
		return sql.selectOne("notice.mapper.detail", id);
	}

	@Override
	public void noticeRead(int id) {
		sql.update("notice.mapper.read", id);		
	}

	@Override
	public void noticeDelete(int id) {
		sql.delete("notice.mapper.delete", id);
	}

	@Override
	public void noticeUpdate(NoticeDTO dto) {
		sql.update("notice.mapper.update", dto);
		
	}
	
	

}
