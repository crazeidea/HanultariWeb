package ticket;

import java.util.HashMap;

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
	public TicketPage ticketList(TicketPage page) {
		return dao.ticketList(page);
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
	public TicketPage ticketLog(TicketPage page, String name) {
		return dao.ticketLog(page, name);
	}

}
