package ticket;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TicketDAO implements TicketService {
	
	@Autowired private SqlSession sql; 

	@Override
	public void ticketInsert(TicketDTO dto) {
		sql.insert("ticket.mapper.insert", dto);
		
	}

	@Override
	public TicketPage ticketList(TicketPage page) {
		page.setTotalList(sql.selectOne("ticket.mapper.total_count", page));
		page.setList(sql.selectList("ticket.mapper.list", page));
		return page;
	}

	public TicketDTO ticketDetail(int id) {
		return sql.selectOne("ticket.mapper.detail", id);
	}

	@Override
	public void ticketRead(int id) {
		sql.update("ticket.mapper.read", id);		
	}

	@Override
	public void ticketDelete(int id) {
		sql.delete("ticket.mapper.delete", id);
	}

	@Override
	public void ticketUpdate(TicketDTO dto) {
		sql.update("ticket.mapper.update", dto);
		
	}

	@Override
	public TicketPage ticketLog(TicketPage page, String name) {
		page.setTotalList(sql.selectOne("ticket.mapper.total_count"));
		page.setList(sql.selectList("ticket.mapper.list", page));
		return page;
	}
	
	

}
