package kr.co.moviemovit.star;


public class StarDTO {
	
	private int sCode; 	 
	private int mCode;    
	private String uid;	 
	private int star;  	
	private String comment;
	private String wdate;
	
	public StarDTO() {
		System.out.println("----------StarDTO() °´Ã¼ »ý¼º");
	}

	public int getsCode() {
		return sCode;
	}

	public void setsCode(int sCode) {
		this.sCode = sCode;
	}

	public int getmCode() {
		return mCode;
	}

	public void setmCode(int mCode) {
		this.mCode = mCode;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	
	
	
	
	
	
	

}
