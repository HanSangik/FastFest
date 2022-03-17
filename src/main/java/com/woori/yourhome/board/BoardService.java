package com.woori.yourhome.board;

import java.util.List;

import com.woori.yourhome.comment.CommentDto;
import com.woori.yourhome.comment2.Comment2Dto;

public interface BoardService {
	List<BoardDto> getList(BoardDto dto);
	void insert(BoardDto dto);
	BoardDto getView(String id);
	int getTotal(BoardDto dto);
	void delete(String id);
	void update(BoardDto dto);
	void comment_insert(CommentDto dto);
	List<CommentDto> getCommentList(CommentDto dto);
	
	void comment2_insert(Comment2Dto dto);
	List<Comment2Dto> getComment2List(Comment2Dto dto);
	
	CommentDto getCommentView(CommentDto dto);
	void comment_update(CommentDto dto);
	void comment_delete(CommentDto dto);
	
	Comment2Dto getComment2View(Comment2Dto dto);
	void comment2_update(Comment2Dto dto);
	void comment2_delete(Comment2Dto dto);
		
}
