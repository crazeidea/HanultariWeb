package ticket;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageDTO;

@Component
public class TicketPage extends PageDTO {
	private List<TicketDTO> list;
	
	public List<TicketDTO> getList() {
		return list;
	}
	
	public void setList(List<TicketDTO> list) {
		this.list = list;
	}
}
