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
	public List<TicketDTO> ticketList() {
		return sql.selectList("ticket.mapper.list");
		
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
	public List<TicketDTO> ticketLog(String writer) {		
		return sql.selectList("ticket.mapper.log", writer);
	}

	public int ticketAnswer(TicketDTO dto) {
		return sql.insert("ticket.mapper.answer", dto);
	}

	public TicketDTO ticketGetAnswer(int id) {
		return sql.selectOne("ticket.mapper.getanswer", id);
	}
	
	

}
