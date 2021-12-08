package com.koreait.project1207.domain;

// 로직을 담기 위함이 아닌, 단순히 테이블의 레코드 한 건을 담고
// 클라이언트가 전송한 폼 데이터를 담기 위한 용도의 객체  (클래스명은 테이블명과 같게 !)
public class Notice {
	private int notice_id;
	private String title;
	private String writer;
	private String content;
	private String regdate;
	private int hit;
	
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int norice_id) {
		this.notice_id = norice_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
}
