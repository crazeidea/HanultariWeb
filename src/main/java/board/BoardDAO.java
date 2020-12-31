package board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO implements BoardService {
	@Autowired private SqlSession sql;

	@Override
	public int board_insert(BoardDTO dto) {
		return sql.insert("board.mapper.insert", dto);
	}

	@Override
	public BoardPage board_list(BoardPage page) {
		page.setTotalList( sql.selectOne("board.mapper.total_count", page) );
		page.setList( sql.selectList("board.mapper.list", page) );
		return page;
	}

	@Override
	public BoardDTO board_detail(int id) {
		return sql.selectOne("board.mapper.detail", id);
	}

	@Override
	public int board_read(int id) {
		return sql.update("board.mapper.read", id);
	}

	@Override
	public int board_update(BoardDTO dto) {
		return sql.update("board.mapper.update", dto);
	}

	@Override
	public int board_delete(int id) {
		return sql.delete("board.mapper.delete", id);
	}

	@Override
	public int board_comment_insert(BoardCommentDTO dto) {
		return sql.insert("board.mapper.comment_insert", dto);
	}

	@Override
	public List<BoardCommentDTO> board_comment_list(int pid) {
		return sql.selectList("board.mapper.comment_list", pid);
	}

	@Override
	public int board_comment_update(BoardCommentDTO dto) {
		return sql.update("board.mapper.comment_update", dto);
	}

	@Override
	public int board_comment_delete(int id) {
		return sql.delete("board.mapper.comment_delete", id);
	}

}