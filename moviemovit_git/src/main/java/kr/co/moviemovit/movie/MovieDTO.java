package kr.co.moviemovit.movie;

import org.springframework.web.multipart.MultipartFile;

public class MovieDTO {
	
	private int mCode;
	private String poster;
	private String mName;
	private String genre;
	private String screen;
	private int age;
	private String s_e;
	private String country;
	private String director;
	private String actor;
	private String DD;
	private int runningTime;
	private String s_date;
	private String e_date;
	private long filesize;
	
	//스프링 파일 객체-----------------------------------------  
	//<input type='file' name='posterMF'>
	  private MultipartFile posterMF;
	  
	//<input type='file' name='filenameMF'>
	  private MultipartFile filenameMF;
	//---------------------------------------------------------  

	public MovieDTO() {} //기본생성자

	public int getmCode() {
		return mCode;
	}

	public void setmCode(int mCode) {
		this.mCode = mCode;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getScreen() {
		return screen;
	}

	public void setScreen(String screen) {
		this.screen = screen;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getS_e() {
		return s_e;
	}

	public void setS_e(String s_e) {
		this.s_e = s_e;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getDD() {
		return DD;
	}

	public void setDD(String dD) {
		DD = dD;
	}

	public int getRunningTime() {
		return runningTime;
	}

	public void setRunningTime(int runningTime) {
		this.runningTime = runningTime;
	}

	public String getS_date() {
		return s_date;
	}

	public void setS_date(String s_date) {
		this.s_date = s_date;
	}

	public String getE_date() {
		return e_date;
	}

	public void setE_date(String e_date) {
		this.e_date = e_date;
	}

	public MultipartFile getPosterMF() {
		return posterMF;
	}

	public void setPosterMF(MultipartFile posterMF) {
		this.posterMF = posterMF;
	}

	public MultipartFile getFilenameMF() {
		return filenameMF;
	}

	public void setFilenameMF(MultipartFile filenameMF) {
		this.filenameMF = filenameMF;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	
	

	
  
	

	
	
}//class end
