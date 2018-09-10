package kr.co.moviemovit.coupon;

public class CouponDTO {
  private int cCode;    // 쿠폰코드
  private String uid;   // 유저 아이디
  private String startDate;   // 발급일
  private String expDate;     // 만료일
  
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
