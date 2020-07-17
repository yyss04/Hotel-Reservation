package com.board.domain;

import java.util.Date;

/*
 * -- 회원 테이블

CREATE TABLE tbl_user (
  userid VARCHAR(50) NOT NULL,
  userpw VARCHAR(100) NOT NULL,
  username VARCHAR(100) NOT NULL,
  userpoint INT NOT NULL DEFAULT 0,
  sessionkey VARCHAR(50) NOT NULL DEFAULT 'none',  -- session 아이디 보관
  sessionlimit TIMESTAMP,                          -- 자동로그인 유효시간 기록
  userimg VARCHAR(100) NOT NULL DEFAULT 'user/default-user.png',
  useremail VARCHAR(50) NOT NULL,
  userjoin_date TIMESTAMP NOT NULL DEFAULT NOW(),
  userlogin_date TIMESTAMP NOT NULL DEFAULT NOW(),
  usersignature VARCHAR(200) NOT NULL DEFAULT '안녕하세요 ^^',
  PRIMARY KEY (userid)
);
 */

public class MemberVO {
	private String userid; // 회원아이디
	private String userpw; // 회원 비밀번호
	private String username; // 회원이름
	private String email; // 이메일
	private Date regdate; // 가입일자
	private Date updatedate; // 수정일자
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", email=" + email
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}
	
	

}
