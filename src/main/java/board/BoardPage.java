package board;

import java.util.List;

import org.springframework.stereotype.Component;

import command.PageDTO;

@Component
public class BoardPage extends PageDTO {
	private int id;
	private List<BoardDTO> list;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<BoardDTO> getList() {
		return list;
	}
	public void setList(List<BoardDTO> list) {
		this.list = list;
	}
}
