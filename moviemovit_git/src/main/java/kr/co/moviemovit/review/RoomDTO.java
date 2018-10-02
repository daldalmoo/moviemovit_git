package kr.co.moviemovit.review;

import org.springframework.web.multipart.MultipartFile;

public class RoomDTO {
  
  //roomTable
  
  private String roomCode; 
  private String cineCode;
  private int    roomName;
  private int    seatCnt;
  private String DD;
  private String seatImg;
  private String etc;
  
  //상영관 자리 이미지 파일 첨부
  private MultipartFile seatImgMF;

  public String getRoomCode() {
    return roomCode;
  }

  public void setRoomCode(String roomCode) {
    this.roomCode = roomCode;
  }

  public String getCineCode() {
    return cineCode;
  }

  public void setCineCode(String cineCode) {
    this.cineCode = cineCode;
  }

  public int getRoomName() {
    return roomName;
  }

  public void setRoomName(int roomName) {
    this.roomName = roomName;
  }

  public int getSeatCnt() {
    return seatCnt;
  }

  public void setSeatCnt(int seatCnt) {
    this.seatCnt = seatCnt;
  }

  public String getDD() {
    return DD;
  }

  public void setDD(String dD) {
    DD = dD;
  }

  public String getSeatImg() {
    return seatImg;
  }

  public void setSeatImg(String seatImg) {
    this.seatImg = seatImg;
  }

  public String getEtc() {
    return etc;
  }

  public void setEtc(String etc) {
    this.etc = etc;
  }

  public MultipartFile getSeatImgMF() {
    return seatImgMF;
  }

  public void setSeatImgMF(MultipartFile seatImgMF) {
    this.seatImgMF = seatImgMF;
  }

  @Override
  public String toString() {
    return "RoomDTO [roomCode=" + roomCode + ", cineCode=" + cineCode + ", roomName=" + roomName + ", seatCnt="
        + seatCnt + ", DD=" + DD + ", seatImg=" + seatImg + ", etc=" + etc + ", seatImgMF=" + seatImgMF + "]";
  }
  
  
} // class end
