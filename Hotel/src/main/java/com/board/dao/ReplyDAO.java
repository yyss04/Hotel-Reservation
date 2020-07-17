package com.board.dao;


import java.util.List;

import com.board.domain.ReplyVO;

public interface ReplyDAO {
	List<ReplyVO> list(Integer articleNo) throws Exception;

	void create(ReplyVO replyVO) throws Exception;

	void update(ReplyVO replyVO) throws Exception;

	void delete(Integer replyNo) throws Exception;

}
