package com.board.domain;

import java.util.Date;

/*
 * CREATE TABLE tbl_article (
articleno INT NOT NULL AUTO_INCREMENT,	-- 게시글 번호
title VARCHAR(200) NOT NULL,					-- 게시글 제목
content TEXT NULL,								-- 게시글 내용
writer VARCHAR(50) NOT NULL,					-- 게시글 작성자
regdate TIMESTAMP NOT NULL DEFAULT NOW(),	-- 게시글 등록시간
viewcnt INT DEFAULT 0,							-- 게시글 조회수
PRIMARY KEY (articleno)						-- 게시글 기본키
);
 */
public class ArticleVO {
	private Integer articleNo;

    private String title;

    private String content;

    private String writer;

    private Date regDate;

    private int viewCnt;

	public Integer getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(Integer articleNo) {
		this.articleNo = articleNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	@Override
	public String toString() {
		return "ArticleVO [articleNo=" + articleNo + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", viewCnt=" + viewCnt + ", getArticleNo()=" + getArticleNo() + ", getTitle()=" + getTitle()
				+ ", getContent()=" + getContent() + ", getWriter()=" + getWriter() + ", getViewCnt()=" + getViewCnt()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

    
}
