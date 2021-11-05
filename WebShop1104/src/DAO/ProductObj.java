package DAO;

public class ProductObj {
	
	private String pid, pname, pdescription, pprice, pfilename;

	public ProductObj(String pid, String pname, String pdescription, String pprice, String pfilename) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pdescription = pdescription;
		this.pprice = pprice;
		this.pfilename = pfilename;
	}

	public String getPid() {
		return this.pid;
	}

	public String getPname() {
		return this.pname;
	}

	public String getPdescription() {
		return this.pdescription;
	}

	public String getPprice() {
		return this.pprice;
	}

	public String getPfilename() {
		return this.pfilename;
	}
	
	

}
