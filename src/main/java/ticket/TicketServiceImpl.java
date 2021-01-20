package ticket;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TicketServiceImpl implements TicketService {

	@Autowired TicketDAO dao;
	
	@Override
	public void ticketInsert(TicketDTO dto) {
		dao.ticketInsert(dto);
	}

	@Override
	public List<TicketDTO> ticketList() {
		return dao.ticketList();
	}

	public TicketDTO ticketDetail(int id) {
		return dao.ticketDetail(id);
		
	}

	@Override
	public void ticketRead(int id) {
		dao.ticketRead(id);		
	}

	@Override
	public void ticketDelete(int id) {
		dao.ticketDelete(id);		
	}

	@Override
	public void ticketUpdate(TicketDTO dto) {
		dao.ticketUpdate(dto);		
	}

	@Override
	public List<TicketDTO> ticketLog(String writer) {
		return dao.ticketLog(writer);
	}

	public int ticketAnswer(TicketDTO dto) {
		return dao.ticketAnswer(dto);		
	}

	public TicketDTO ticketGetAnswer(int id) {
		return dao.ticketGetAnswer(id);
	}

}
