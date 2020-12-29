package board;

import java.util.List;

public interface BoardService {
	//CRUD 
	int board_insert(BoardDTO dto);
	BoardPage board_list(BoardPage page);
	BoardDTO board_detail(int id);
	int board_read(int id);
	int board_update(BoardDTO dto);
	int board_delete(int id);
	
	int board_comment_insert(BoardCommentDTO dto);
	List<BoardCommentDTO> board_comment_list(int pid);
	int board_comment_update(BoardCommentDTO dto);
	int board_comment_delete(int id);
}
