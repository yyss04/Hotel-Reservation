package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.ArticleVO;
import com.board.domain.Criteria;
import com.board.domain.ReplyVO;
import com.board.domain.SearchCriteria;

@Repository
public class ArticleDAOImpl implements ArticleDAO {
	
	@Inject
	SqlSession sqlSession;

	private static final String NAMESPACE = "com.board.mappers.boardproject";
	
	// 게시글 입력
	@Override
	public void create(ArticleVO articleVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".create", articleVO);
	}
	
	// 게시글 조회
	@Override
	public ArticleVO read(Integer articleNo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".read", articleNo);
	}

	// 게시글 수정
	@Override
	public void update(ArticleVO artivleVO) throws Exception {
		sqlSession.update(NAMESPACE + ".update", artivleVO);
	}
	
	// 게시글 삭제
	@Override
	public void delete(Integer articleNo) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", articleNo);
	}
	
	// 게시글 목록 : 전체
	@Override
	public List<ArticleVO> listAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll");
	}
	
	 // 게시글 목록 : 페이징 (10)
	@Override
	public List<ArticleVO> listPaging(int page) throws Exception {
		
		if(page <= 0) {
			page = 1;
		}
		
	// 음수값이 들어올 수 없게 조건문 작성
		page = (page - 1) * 10;
		
		return sqlSession.selectList(NAMESPACE + ".listPaging", page);
	}
	
	// 게시글 전체 목록 : 페이징
	@Override
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listCriteria", criteria);
	}
	
	// 페이징 처리를 위한 전체 게시글의 갯수 구하기
	@Override
	public int countArticles(Criteria criteria) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countArticles", criteria);
	}
	
	// 검색된 목록
	@Override
	public List<ArticleVO> listSearch(SearchCriteria searchCriteria) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listSearch", searchCriteria);
	}
	
	// 검색된 게시글의 갯수를 리턴
	@Override
	public int countSearchedArticles(SearchCriteria searchCriteria) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countSearchedArticles", searchCriteria);
	}
	
	// 댓글 리스트
	@Override
	public List<ReplyVO> getReplyList(Integer articleNo) throws Exception {
		return sqlSession.selectList("com.board.mappers.boardproject.replyMapper.getReplyList", articleNo);
	}

	@Override
	public int saveReply(ReplyVO replyVO) throws Exception {
		return sqlSession.insert("com.board.mappers.boardproject.replyMapper.saveReply", replyVO);
	}

	@Override
	public int updateReply(ReplyVO replyVO) throws Exception {
		return sqlSession.update("com.board.mappers.boardproject.replyMapper.updateReply", replyVO);
	}

	@Override
	public int deleteReply(int rid) throws Exception {
		return sqlSession.delete("com.board.mappers.boardproject.replyMapper.deleteReply", rid);
	}

	@Override
	public void updateViewCnt(Integer articleNo) throws Exception {
		sqlSession.update(NAMESPACE + ".updateViewCnt", articleNo);
	}
	

}
