package board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired private BoardDAO dao;
	
	@Override
	public int board_insert(BoardDTO dto) {
		return dao.board_insert(dto);
	}

	@Override
	public BoardPage board_list(BoardPage page) {
		return dao.board_list(page);
	}

	@Override
	public BoardDTO board_detail(int id) {
		return dao.board_detail(id);
	}

	@Override
	public int board_read(int id) {
		return dao.board_read(id);
	}

	@Override
	public int board_update(BoardDTO dto) {
		return dao.board_update(dto);
	}

	@Override
	public int board_delete(int id) {
		return dao.board_delete(id);
	}

	@Override
	public int board_comment_insert(BoardCommentDTO dto) {
		return dao.board_comment_insert(dto);
	}

	@Override
	public List<BoardCommentDTO> board_comment_list(int pid) {
		return dao.board_comment_list(pid);
	}

	@Override
	public int board_comment_update(BoardCommentDTO dto) {
		return dao.board_comment_update(dto);
	}

	@Override
	public int board_comment_delete(int id) {
		return dao.board_comment_delete(id);
	}

}
