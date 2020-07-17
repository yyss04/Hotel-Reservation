package com.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.board.domain.ReplyVO;
import com.board.service.ArticleService;

@RestController
@RequestMapping(value = "/restArticle")
public class RestArticleController {
	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);

	@Inject
	private ArticleService articleService;
	
	// 댓글 리스트
	@RequestMapping(value = "/getReplyList", method = RequestMethod.POST)
	public List<ReplyVO> getReplyList(@RequestParam("articleNo") Integer articleNo) throws Exception {
		return articleService.getReplyList(articleNo);
	}
	
	// 댓글 작성
	@RequestMapping(value = "/saveReply", method = RequestMethod.POST)
	public Map<String, Object> saveReply(@RequestBody ReplyVO replyVO) throws Exception {
		Map<String, Object> result = new HashMap<>();

		try {
			articleService.saveReply(replyVO);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
	
	
	// 댓글 수정
	@RequestMapping(value = "/updateReply", method = RequestMethod.POST)
	public Map<String, Object> updateReply(@RequestBody ReplyVO replyVO) throws Exception {
		Map<String, Object> result = new HashMap<>();

		try {
			articleService.updateReply(replyVO);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
	
	
	// 댓글 삭제
	@RequestMapping(value = "/deleteReply", method = RequestMethod.POST)
	public Map<String, Object> deleteReply(@RequestParam("rid") int rid) throws Exception {
		Map<String, Object> result = new HashMap<>();

		try {
			articleService.deleteReply(rid);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
	

}



