package ticket;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface TicketService {
	void ticketInsert(TicketDTO dto);
	List<TicketDTO> ticketList();
	TicketDTO ticketDetail(int id);
	void ticketRead(int id);
	void ticketDelete(int id);
	void ticketUpdate(TicketDTO dto);
	List<TicketDTO> ticketLog(String name);
	int ticketAnswer(TicketDTO dto);

}
