package customer;

public interface CustomerService {
	//CRUD
	
	void customer_insert(CustomerDTO dto);				//저장
	void customer_reply_insert(CustomerDTO dto);		//답글 저장
	CustomerPage customer_list(CustomerPage page);		//고객관리 리스트
	CustomerDTO customer_detail(int id);				//고객관리 상세
	void customer_read(int id);							//조회수
	void customer_update(CustomerDTO dto);				//변경저장
	void customer_delete(int id);						//삭제
}
