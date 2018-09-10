package kr.co.moviemovit.people;

import org.springframework.web.multipart.MultipartFile;

public class PeopleDTO {
	
    private int peoCode;
    private String peoName;
    private String country; 
    private String peoBirth;    
    private String gender;      
    private String peoPic;
    
    private long filesize;
	
    public PeopleDTO() {
      System.out.println("---------PeopleDTO() 객체 생성");
    }//기본생성자
    
    //스프링 파일 객체-----------------------------------------  
  	//<input type='file' name='posterMF'>
  	  private MultipartFile posterMF;
  	  
  	//<input type='file' name='filenameMF'>
  	  private MultipartFile filenameMF;
  	//---------------------------------------------------------

	public int getPeoCode() {
		return peoCode;
	}

	public void setPeoCode(int peoCode) {
		this.peoCode = peoCode;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPeoBirth() {
		return peoBirth;
	}

	public void setPeoBirth(String peoBirth) {
		this.peoBirth = peoBirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPeoPic() {
		return peoPic;
	}

	public void setPeoPic(String peoPic) {
		this.peoPic = peoPic;
	}

	public String getPeoName() {
		return peoName;
	}

	public void setPeoName(String peoName) {
		this.peoName = peoName;
	}
//------------------------------------------------------------------------
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
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
//------------------------------------------------------------------------   
    
    
    
    
    
    
}//class end
