package kr.co.moviemovit.notice;


public class NoticeDTO {


	private int noticeno;
	private String title;
	private String s_e;
	private String uid;
	private String wdate;
	private String open;
	
	
	

	public int getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}




	public String getS_e() {
		return s_e;
	}

	public void setS_e(String s_e) {
		this.s_e = s_e;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	@Override
	public String toString() {
		return "NoticeDTO [noticeno=" + noticeno + ", title=" + title + ", s_e=" + s_e + ", uid=" + uid + ", wdate="
				+ wdate + ", open=" + open + "]";
	}
}//class end
