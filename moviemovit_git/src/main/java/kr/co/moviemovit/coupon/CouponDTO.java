package kr.co.moviemovit.coupon;

public class CouponDTO {
  private int cCode;    // 쿠폰코드
  private String uid;   // 유저 아이디
  private String startDate;   // 발급일
  private String expDate;     // 만료일

  //과제용
  private int cnt;
  private int tot;
  private String grade;
  
  public int getTot() {
    return tot;
  }

  public void setTot(int tot) {
    this.tot = tot;
  }

  public String getGrade() {
    return grade;
  }

  public void setGrade(String grade) {
    this.grade = grade;
  }

   
  public int getCnt() {
    return cnt;
  }

  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  
  public CouponDTO() {
    System.out.println("---------- CouponDTO() 객체 생성");
  }//default constructor

  public int getcCode() {
    return cCode;
  }

  public void setcCode(int cCode) {
    this.cCode = cCode;
  }

  public String getUid() {
    return uid;
  }

  public void setUid(String uid) {
    this.uid = uid;
  }

  public String getStartDate() {
    return startDate;
  }

  public void setStartDate(String startDate) {
    this.startDate = startDate;
  }

  public String getExpDate() {
    return expDate;
  }

  public void setExpDate(String expDate) {
    this.expDate = expDate;
  }
  
}//class end
