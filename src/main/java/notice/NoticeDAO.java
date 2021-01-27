package notice;

import java.util.List;

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
	public List<NoticeDTO> noticeList() {
		return sql.selectList("notice.mapper.list");
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
