package kr.co.moviemovit.book;

public class BookDTO {
  private String bCode;  // 예매코드(PK)
  private String wdate;  // 예매날짜
  private String uid;    // 유저 아이디 <- userTable
  private int sCode;     // 상영코드 <- screenTable
  private int cCode;     // 쿠폰사용여부 <- couponTable
  private String seat;   // 예매좌석위치(최대5명)
  private String auditType;  // 관람객유형 (adu you sen kid -> 성인 청소년 경로우대 아이)
  
  public BookDTO() {
    System.out.println("---------- BookDTO() 객체 생성");
  }//default constructor

  public String getbCode() {
    return bCode;
  }

  public void setbCode(String bCode) {
    this.bCode = bCode;
  }

  public String getWdate() {
    return wdate;
  }

  public void setWdate(String wdate) {
    this.wdate = wdate;
  }

  public String getUid() {
    return uid;
  }

  public void setUid(String uid) {
    this.uid = uid;
  }

  public int getsCode() {
    return sCode;
  }

  public void setsCode(int sCode) {
    this.sCode = sCode;
  }

  public int getcCode() {
    return cCode;
  }

  public void setcCode(int cCode) {
    this.cCode = cCode;
  }

  public String getSeat() {
    return seat;
  }

  public void setSeat(String seat) {
    this.seat = seat;
  }

  public String getAuditType() {
    return auditType;
  }

  public void setAuditType(String auditType) {
    this.auditType = auditType;
  }
  
}//class end
