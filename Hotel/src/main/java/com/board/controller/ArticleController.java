package com.board.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.ArticleVO;
import com.board.domain.PageMaker;
import com.board.domain.ReplyVO;
import com.board.domain.SearchCriteria;
import com.board.service.ArticleService;

@Controller
@RequestMapping("/article")
public class ArticleController {

	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);

	@Inject
	ArticleService articleService;
	
	// 등록 페이지 이동
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET() {

		logger.info("write GET...");

		return "/article/write";
	}
	
	// 글 등록
	// RedirectAttributes : redirect된 페이지까지 데이터는 전송하지만, uri상에선 안보임
	// addFlashAttribute : 메시지를 String데이터로 저장
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(ArticleVO articleVO,
	                        RedirectAttributes redirectAttributes) throws Exception {

	    logger.info("write POST...");
	    logger.info(articleVO.toString());
	    articleService.create(articleVO);

	    return "redirect:/article/listSearch";
	}

	// 글 조회
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(ArticleVO articleVO, @RequestParam("articleNo") Integer articleNo,
						@ModelAttribute("searchCriteria") SearchCriteria searchCriteria,
	                   Model model) throws Exception {

	    logger.info("read ...");
	    logger.info("articleVO : " + articleVO.toString());
	    model.addAttribute("article", articleService.read(articleNo));
	    
	    // 댓글폼
	    model.addAttribute("replyVO", new ReplyVO());
	    
	    return "/article/read";
	}
	
	// 수정 페이지
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("articleNo") Integer articleNo,
							ArticleVO articleVO,
	                        @ModelAttribute("searchCriteria") SearchCriteria searchCriteria,
	                        Model model) throws Exception {

	    logger.info("search modifyGet() called ...");
	    logger.info("articleVO : " + articleVO.toString());
	    logger.info(searchCriteria.toString());
	    model.addAttribute("article", articleService.read(articleNo));

	    return "article/modify";
	}

	// 수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(ArticleVO articleVO,
	                         SearchCriteria searchCriteria,
	                         RedirectAttributes redirectAttributes) throws Exception {

	    articleService.update(articleVO);
	    redirectAttributes.addAttribute("page", searchCriteria.getPage());
	    redirectAttributes.addAttribute("perPageNum", searchCriteria.getPerPageNum());
	    redirectAttributes.addAttribute("searchType", searchCriteria.getSearchType());
	    redirectAttributes.addAttribute("keyword", searchCriteria.getKeyword());
	    redirectAttributes.addFlashAttribute("msg", "modSuccess");

	    return "redirect:/article/listSearch";
	}
	
	// 게시물 삭제
		@RequestMapping(value = "/remove", method = RequestMethod.GET)
		public String remove(@RequestParam("articleNo") Integer articleNo) throws Exception {
			articleService.delete(articleNo);
			return "redirect:/article/listSearch";
		}
	
	// 후기게시판 조회
    @RequestMapping(value = "/listSearch", method = RequestMethod.GET)
    public String list(@ModelAttribute("searchCriteria") SearchCriteria searchCriteria,
                       Model model) throws Exception {

        logger.info("search list() called ...");

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(searchCriteria);
        pageMaker.setTotalCount(articleService.countSearchedArticles(searchCriteria));

        model.addAttribute("articles", articleService.listSearch(searchCriteria));;
        model.addAttribute("pageMaker", pageMaker);

        return "article/listsearch";
    }
    

	
	
	
	
}
