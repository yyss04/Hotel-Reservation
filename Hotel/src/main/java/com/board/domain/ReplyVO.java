package com.board.domain;

import java.util.Date;

/*
 * CREATE TABLE tbl_reply (
  rid INT NOT NULL AUTO_INCREMENT,
  articleno INT NOT NULL DEFAULT 0,
  content VARCHAR(1000) NOT NULL,
  reg_id VARCHAR(50) NOT NULL,
  reg_dt TIMESTAMP NOT NULL DEFAULT NOW(),
  edit_dt TIMESTAMP NOT NULL DEFAULT NOW(),
  PRIMARY KEY (rid)
);
 */
public class ReplyVO {
	
	private int rid;
    private Integer ArticleNo;
    private String content;
    private String reg_id;
    private Date reg_dt;
    private Date edit_dt;
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public Integer getArticleNo() {
		return ArticleNo;
	}
	public void setArticleNo(Integer articleNo) {
		ArticleNo = articleNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	public Date getEdit_dt() {
		return edit_dt;
	}
	public void setEdit_dt(Date edit_dt) {
		this.edit_dt = edit_dt;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [rid=" + rid + ", ArticleNo=" + ArticleNo + ", content=" + content + ", reg_id=" + reg_id
				+ ", reg_dt=" + reg_dt + ", edit_dt=" + edit_dt + "]";
	}
    
    


}
