package kr.co.moviemovit.coupon;

public class CouponDTO {
  private int cCode;    // �����ڵ�
  private String uid;   // ���� ���̵�
  private String startDate;   // �߱���
  private String expDate;     // ������

  //������
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
    System.out.println("---------- CouponDTO() ��ü ����");
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
