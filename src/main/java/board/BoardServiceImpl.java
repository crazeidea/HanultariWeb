package board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired private BoardDAO dao;
	
	@Override
	public int board_insert(BoardDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardPage board_list(BoardPage page) {
		return dao.board_list(page);
	}

	@Override
	public BoardDTO board_detail(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int board_read(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int board_update(BoardDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int board_delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int board_comment_insert(BoardCommentDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardCommentDTO> board_comment_list(int pid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int board_comment_update(BoardCommentDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int board_comment_delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
