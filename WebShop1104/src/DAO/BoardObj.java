package DAO;

public class BoardObj {

	private String bno,btitle,bcontent,bauthor,bimage,bdate;

	public BoardObj(String bno, String btitle, String bauthor, String bcontent, String bimage, String bdate) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bauthor = bauthor;
		this.bcontent = bcontent;
		this.bimage = bimage;
		this.bdate = bdate;
	}

	public String getBno() {
		return bno;
	}

	public String getBtitle() {
		return btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public String getBauthor() {
		return bauthor;
	}

	public String getBimage() {
		return bimage;
	}

	public String getBdate() {
		return bdate;
	}


	
}
