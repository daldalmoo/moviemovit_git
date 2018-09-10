package kr.co.moviemovit.review;

import org.springframework.web.multipart.MultipartFile;

public class CinemaDTO {
  
  // cinema table
  private String cineCode;
  private String brandName;
  private String cineName;
  private String tel;
  private String addr1;
  private String addr2;
  private String addr3;
  private String wido;
  private String kyengdo;
  private String logoImg;
  private MultipartFile logoImgMF;
  private String wdate;
  private String etc;
  private String home;
  private int startotal;
  private ReviewStar ReviewStar;
  public String getCineCode() {
    return cineCode;
  }
  public void setCineCode(String cineCode) {
    this.cineCode = cineCode;
  }
  public String getBrandName() {
    return brandName;
  }
  public void setBrandName(String brandName) {
    this.brandName = brandName;
  }
  public String getCineName() {
    return cineName;
  }
  public void setCineName(String cineName) {
    this.cineName = cineName;
  }
  public String getTel() {
    return tel;
  }
  public void setTel(String tel) {
    this.tel = tel;
  }
  public String getAddr1() {
    return addr1;
  }
  public void setAddr1(String addr1) {
    this.addr1 = addr1;
  }
  public String getAddr2() {
    return addr2;
  }
  public void setAddr2(String addr2) {
    this.addr2 = addr2;
  }
  public String getAddr3() {
    return addr3;
  }
  public void setAddr3(String addr3) {
    this.addr3 = addr3;
  }
  public String getWido() {
    return wido;
  }
  public void setWido(String wido) {
    this.wido = wido;
  }
  public String getKyengdo() {
    return kyengdo;
  }
  public void setKyengdo(String kyengdo) {
    this.kyengdo = kyengdo;
  }
  public String getLogoImg() {
    return logoImg;
  }
  public void setLogoImg(String logoImg) {
    this.logoImg = logoImg;
  }
  public MultipartFile getLogoImgMF() {
    return logoImgMF;
  }
  public void setLogoImgMF(MultipartFile logoImgMF) {
    this.logoImgMF = logoImgMF;
  }
  public String getWdate() {
    return wdate;
  }
  public void setWdate(String wdate) {
    this.wdate = wdate;
  }
  public String getEtc() {
    return etc;
  }
  public void setEtc(String etc) {
    this.etc = etc;
  }
  public String getHome() {
    return home;
  }
  public void setHome(String home) {
    this.home = home;
  }
  public int getStartotal() {
    return startotal;
  }
  public void setStartotal(int startotal) {
    this.startotal = startotal;
  }
  public ReviewStar getReviewStar() {
    return ReviewStar;
  }
  public void setReviewStar(ReviewStar reviewStar) {
    ReviewStar = reviewStar;
  }
  
 
} // class end
