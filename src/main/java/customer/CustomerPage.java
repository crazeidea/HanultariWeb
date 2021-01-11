package customer;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageDTO;

@Component
public class CustomerPage extends PageDTO{
	private List<CustomerDTO> list;
	
	public List<CustomerDTO> getList() {
		return list;
	}
	
	public void setList(List<CustomerDTO> list) {
		this.list = list;
	}

}
