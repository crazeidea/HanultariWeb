package customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired private CustomerDAO dao;
	
	@Override
	public void customer_insert(CustomerDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void customer_reply_insert(CustomerDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public CustomerPage customer_list(CustomerPage page) {
		return dao.customer_list(page);
	}

	@Override
	public CustomerDTO customer_detail(int id) {
		return null;
	}

	@Override
	public void customer_read(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void customer_update(CustomerDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void customer_delete(int id) {
		// TODO Auto-generated method stub

	}

}
