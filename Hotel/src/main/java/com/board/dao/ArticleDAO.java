package com.board.dao;

import java.util.List;

import com.board.domain.ArticleVO;
import com.board.domain.Criteria;
import com.board.domain.ReplyVO;
import com.board.domain.SearchCriteria;

public interface ArticleDAO {
	
	void create(ArticleVO articleVO) throws Exception;
	
	ArticleVO read(Integer articleNo) throws Exception;
	
	void update(ArticleVO artivleVO) throws Exception;
	
	void delete(Integer articleNo) throws Exception;
	
	List<ArticleVO>	listAll() throws Exception;
	
	List<ArticleVO> listPaging(int page) throws Exception;
	
	List<ArticleVO> listCriteria(Criteria criteria) throws Exception;
	
	int countArticles(Criteria criteria) throws Exception;
	
	// 검색된 목록
	List<ArticleVO> listSearch(SearchCriteria searchCriteria) throws Exception;
	
	// 검색된 게시글의 갯수를 리턴
	int countSearchedArticles(SearchCriteria searchCriteria) throws Exception;

	// 댓글 리스트
	public List<ReplyVO> getReplyList(Integer articleNo) throws Exception;
	
	public int saveReply(ReplyVO replyVO) throws Exception;
	
	public int updateReply(ReplyVO replyVO) throws Exception;

	public int deleteReply(int rid) throws Exception;
	
	// 게시글 조회수
	void updateViewCnt(Integer articleNo) throws Exception;

}
