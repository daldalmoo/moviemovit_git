package kr.co.moviemovit.qna;


public class QnaDTO {


	private int qCode;
	private String qType;
	private String title;
	private String content;
	private String uid;
	private String wdate;
	private int groupNo;
	private int groupNum;
	private int indent;
	
	
	public int getqCode() {
		return qCode;
	}
	public void setqCode(int qCode) {
		this.qCode = qCode;
	}
	public String getqType() {
		return qType;
	}
	public void setqType(String qType) {
		this.qType = qType;
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
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	@Override
	public String toString() {
		return "QnaDTO [qCode=" + qCode + ", qType=" + qType + ", title=" + title + ", content=" + content + ", uid="
				+ uid + ", wdate=" + wdate + ", groupNo=" + groupNo + ", indent=" + indent + ", groupNum=" + groupNum
				+ "]";
	}
	
	
	


}//class end
