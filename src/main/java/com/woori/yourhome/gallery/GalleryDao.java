package com.woori.yourhome.gallery;

import java.util.List;

public interface GalleryDao {
	List<GalleryDto> getList(GalleryDto dto);
	int getTotal(GalleryDto dto);
	void insert(GalleryDto dto );
	void update(GalleryDto dto );
	void delete(GalleryDto dto );
	GalleryDto getView(GalleryDto dto);
	//void update_likehi
	void updateLike(int id) throws Exception;
	void updateLikeCancel(int id) throws Exception;
	void insertLike(int id, String writer) throws Exception;
	void deleteLike(int id, String writer) throws Exception;
	int likeCheck(int id, String writer) throws Exception;
	void updateLikeCheck(int id, String writer) throws Exception;
	void updateLikeCheckCancel(int id, String writer) throws Exception;
}
