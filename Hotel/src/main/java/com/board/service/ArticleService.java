package com.board.service;

import java.util.List;

import com.board.domain.ArticleVO;
import com.board.domain.Criteria;
import com.board.domain.ReplyVO;
import com.board.domain.SearchCriteria;

public interface ArticleService {
	
	void create(ArticleVO articleVO) throws Exception;

	ArticleVO read(Integer articleNo) throws Exception;

	void update(ArticleVO articleVO) throws Exception;

	void delete(Integer articleNo) throws Exception;

	List<ArticleVO> listAll() throws Exception;
	
	List<ArticleVO> listCriteria(Criteria criteria) throws Exception;

	int countArticles(Criteria criteria) throws Exception;

	List<ArticleVO> listSearch(SearchCriteria searchCriteria) throws Exception;

	int countSearchedArticles(SearchCriteria searchCriteria) throws Exception;

	// 댓글 리스트
	public List<ReplyVO> getReplyList(Integer articleNo) throws Exception;
	
	public int saveReply(ReplyVO replyVO) throws Exception;
	
	public int updateReply(ReplyVO replyVO) throws Exception;
	
	public int deleteReply(int rid) throws Exception;
	
}
