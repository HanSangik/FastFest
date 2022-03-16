package com.woori.yourhome.board;

import java.util.List;

import com.woori.yourhome.comment.CommentDto;

public interface BoardService {
	List<BoardDto> getList(BoardDto dto);
	void insert(BoardDto dto);
	BoardDto getView(String id);
	int getTotal(BoardDto dto);
	void delete(String id);
	void update(BoardDto dto);
	
	
	void comment_insert(CommentDto dto);
	List<CommentDto> getCommentList(CommentDto dto);
	CommentDto getCommentView(CommentDto dto);
	void comment_update(CommentDto dto);
	void comment_delete(CommentDto dto);
		
}
