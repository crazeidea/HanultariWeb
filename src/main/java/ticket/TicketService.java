package ticket;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface TicketService {
	void ticketInsert(TicketDTO dto);
	TicketPage ticketList(TicketPage page);
	TicketDTO ticketDetail(int id);
	void ticketRead(int id);
	void ticketDelete(int id);
	void ticketUpdate(TicketDTO dto);
	TicketPage ticketLog(TicketPage page, String name);

}
