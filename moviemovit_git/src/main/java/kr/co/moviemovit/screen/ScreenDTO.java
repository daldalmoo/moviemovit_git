package kr.co.moviemovit.screen;

public class ScreenDTO {
	private int sCode;			//상영코드
	private String roomCode;	//상영관
	private String sdate;		//상영날짜	10자
	private String stime;		//상영시작시간 4자, 24시간제
	private int mCode;			//영화코드
	
	public ScreenDTO() {}//기본생성자

	public int getsCode() {
		return sCode;
	}

	public void setsCode(int sCode) {
		this.sCode = sCode;
	}

	public String getRoomCode() {
		return roomCode;
	}

	public void setRoomCode(String roomCode) {
		this.roomCode = roomCode;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getStime() {
		return stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	public int getmCode() {
		return mCode;
	}

	public void setmCode(int mCode) {
		this.mCode = mCode;
	}
	
}//class end
