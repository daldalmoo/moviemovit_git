package kr.co.moviemovit.review;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;

import net.utility.UploadSaveManager;
import net.utility.Utility;

@Controller
public class ReviewCont {
  
  @Autowired
  ReviewDAO dao;
  
  public ReviewCont(){
    System.out.println("----------------ReviewCon created");
    
  } //
  
  //////////////////////////////// CINEMA  ////////////////////////////////

  @RequestMapping(value="/review/List2.do", method=RequestMethod.GET)
  public ModelAndView roomList() {
    
    ModelAndView mav= new ModelAndView();
    mav.setViewName("review/cinemaList2");
    
    ArrayList<CinemaDTO> list = dao.cinemaList();
    mav.addObject("list", list); 
    return mav;
  } 

  
  

  
  // CINEMA INSERT
  @RequestMapping(value="/review/cinemaForm.do", method=RequestMethod.GET)
  public ModelAndView cinemaForm() {
    
    ModelAndView mav= new ModelAndView();
    mav.setViewName("review/cinemaForm");
    return mav;
    
  } // 
  
  // CINEMA INSERT PROCESS
  @RequestMapping(value="/review/cinemaForm.do", method=RequestMethod.POST)
  public ModelAndView cinemaForm(CinemaDTO dto, HttpServletRequest req) {

    ModelAndView mav= new ModelAndView();
    mav.setViewName("msgView");
    
    // cinema IMG file
    mav.addObject("root", Utility.getRoot());
    // Real Path
    String basePath = req.getRealPath("/review/img");
    MultipartFile logoImgMF = dto.getLogoImgMF();
    
    
    // 이미지가 첨부되지 않았으면 디폴트 이미지로 SET
    if(logoImgMF.isEmpty()) {  
      dto.setLogoImg("default.png");
    } else { 
      String logoImg = UploadSaveManager.saveFileSpring30(logoImgMF, basePath);
      dto.setLogoImg(logoImg);
    }
    
    // CINECODE가 NVL로 만들어지지 않기 때문에 별도로 생성
    // BRAND의 앞자리 + 해당 브랜드 내 몇번째 영화관인지 cincodeset
    String cineCode = dao.setCineCode(dto.getBrandName());
    dto.setCineCode(cineCode);
    int count = dao.cinemaForm(dto);
    
    String msg = "";
    
    if (count == 0) {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('등록 실패');";
      msg += "  history.go(-1);";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    } else {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('등록 성공');";
      msg += "  window.location='./cinemaList.do';";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    } // if end

    return mav;
  } // 
  
  // CREATE : 위도, 경도를 얻기 위한 정보
  @RequestMapping(value="/review/geoCoding.do")
  public void geoCoding(HttpServletRequest req, HttpServletResponse response) throws Exception{
    String location = req.getParameter("addr");

    Geocoder geocoder = new Geocoder();
    // setAddress : 변환하려는 주소 (경기도 성남시 분당구 등)
    // setLanguate : 인코딩 설정
    GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setAddress(location).setLanguage("ko").getGeocoderRequest();
    GeocodeResponse geocoderResponse;
    geocoderResponse = geocoder.geocode(geocoderRequest);
          if (geocoderResponse.getStatus() == GeocoderStatus.OK & !geocoderResponse.getResults().isEmpty()) {
                GeocoderResult geocoderResult=geocoderResponse.getResults().iterator().next();
                LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation();
                                         
                Float[] coords = new Float[2];
                coords[0] = latitudeLongitude.getLat().floatValue();
                coords[1] = latitudeLongitude.getLng().floatValue();
                String coordStr = Float.toString(coords[0])+"&"+Float.toString(coords[1]);
                
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/xml");
            response.getWriter().write(coordStr); // 응답결과반환
          }
  } // 
  
  
  /////////////////////////////////////// READ

/*  @RequestMapping(value="/review/cinemaRead.do", method=RequestMethod.GET)
  public ModelAndView cinemaRead(CinemaDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("review/cinemaRead");
    dto = dao.cinemaRead(dto);
    ArrayList<ReviewStar> reviewstar = dao.reviewstar();
    mav.addObject("reviewstar", reviewstar);
    mav.addObject("dto", dto);
    return mav;
    
  }*/
  

  
  //////////////////////////////////////// UPDATE
  
  //GET
  @RequestMapping(value="/review/cinemaUpdate.do", method = RequestMethod.GET)
  public ModelAndView cinemaUpdate(CinemaDTO dto) {
    ModelAndView mav = new ModelAndView();
    // dto를 현재 dto로 업데이트
    dto = dao.cinemaRead(dto);
    mav.addObject("dto", dto);
    mav.setViewName("review/cinemaUpdate");
    return mav;
  }//userUpdateForm() end
  
  //POST
  @RequestMapping(value="/review/cinemaUpdate.do", method = RequestMethod.POST)
  public ModelAndView cinemaUpdateProc(CinemaDTO dto, HttpServletRequest req) {
   
      ModelAndView mav = new ModelAndView();
      mav.setViewName("msgView");
      
      String cineCode = req.getParameter("cineCode");
  
      CinemaDTO oldDTO = dao.cinemaRead(dto);
      
      dto.setCineCode(cineCode);

      // 전송되는 파일이 저장되는 실제 경로
      String basePath = req.getSession().getServletContext().getRealPath("/review/img");

      MultipartFile logoImgMF = dto.getLogoImgMF();
      MultipartFile oldlogoImgMF = oldDTO.getLogoImgMF();
      
      if (logoImgMF.getSize() > 0) {
        UploadSaveManager.deleteFile(basePath, oldlogoImgMF);
        // 새로운 파일 있을 경우 삭제하고 하기
        String logoImg = UploadSaveManager.saveFileSpring30(logoImgMF, basePath);
        dto.setLogoImg(logoImg);
      } else {
        // 기존파일을 새로 저장
        dto.setLogoImg(oldDTO.getLogoImg());
      }

      int cnt = dao.cinemaUpdate(dto);
      String msg = "";

      if (cnt == 0) {
        msg += "<!DOCTYPE html>";
        msg += "<html><body>";
        msg += "<script>";
        msg += "  alert('수정 실패');";
        msg += "  history.go(-1);";
        msg += "</script>";
        msg += "</html></body>";
        mav.addObject("msg", msg);
        mav.setViewName("msgView");
      } else {
        msg += "<!DOCTYPE html>";
        msg += "<html><body>";
        msg += "<script>";
        msg += "  alert('수정 성공');";
        msg += "  window.location='./cinemaList.do';";
        msg += "</script>";
        msg += "</html></body>";
        mav.addObject("msg", msg);
        mav.setViewName("msgView");
      } // if end

      return mav;

    } // end

  
  ////////////////////////////////////// DELETE
  
  //GET
  @RequestMapping(value="/review/cinemaDelete.do", method = RequestMethod.GET)
  public ModelAndView cinemaDelete(HttpServletRequest req) {
    ModelAndView mav = new ModelAndView();
    // dto를 현재 dto로 업데이트
    String cineCode = req.getParameter("cineCode");
    
    mav.addObject("cineCode", cineCode);
    
    String msg = "";

      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<p>삭제하시겠습니까?</p>";
      msg += "<input type='button' value='확인' onclick='location.href=\"./cinemaDeletePro.do?cineCode="
          + cineCode + "\"'>";
      msg += "<input type='button' value='취소' onclick='javascript:history.back()'>";
      msg += "</html></body>";
      
      mav.addObject("msg", msg);
      mav.setViewName("msgView");

    return mav;
  }//userUpdateForm() end
  
  //DELETE PROCESS
  
  @RequestMapping(value="/review/cinemaDeletePro.do", method = RequestMethod.GET)
  public ModelAndView cinemaDeletePro(HttpServletRequest req) {
    ModelAndView mav = new ModelAndView();
    String cineCode = req.getParameter("cineCode");
    
    int count = dao.cinemaDeletePro(cineCode);
    String msg = "";
    
    if (count == 0) {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('삭제 실패');";
      msg += "  history.go(-1);";
      msg += "</script>";
      msg += "</body></html>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    } else {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('삭제 성공');";
      msg += "  window.location='./cinemaList.do';";
      msg += "</script>";
      msg += "</body></html>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    } // if end

   return mav;
   
  }
  
  ////////////////////////////////////// LIST + 페이징 0912
  @RequestMapping(value="/review/cinemaList.do")
  public ModelAndView cinemaList(HttpServletRequest request) {
    
    ModelAndView mav= new ModelAndView();
    Criteria cri = new Criteria();

    //첫페이지일 경우 page를 1로 설정
    //1페이지인지 판단 여부 = request page 값이 null 여부를 판단
    String pagetemp = request.getParameter("page");
    int page = 1;

    //null이 아니라면 page를 int형으로 변화시키고 page에 set
    if (pagetemp!=null) {
    page = Integer.parseInt(pagetemp);
    cri.setPage(page);
    }
    
    //0이랑 10
    //System.out.println(cri.getPageStart());
   //System.out.println(cri.getPage());
    
    ArrayList<CinemaDTO> list = dao.listCriteria(cri);
    
    mav.addObject("list", list);  // 게시판의 글 리스트
    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);
    
    //total은 xml 별도 추가 없이 컨트롤러에서 count
    //list를 불러와서
    ArrayList<CinemaDTO> alllist = dao.cinemaList();
    // size 재기
    int totalcount = alllist.size();
    pageMaker.setTotalCount(totalcount);
    mav.addObject("pageMaker", pageMaker);

    ArrayList<ReviewStar> reviewstar = dao.reviewstar();
    
    mav.addObject("list", list);
    mav.addObject("reviewstar", reviewstar);
    return mav;
  } 

  // LIST : search
  @RequestMapping(value="/review/search.do", method=RequestMethod.GET) 
  public ModelAndView search(HttpServletRequest request) { 
  
    ModelAndView mav= new ModelAndView();
    mav.setViewName("review/cinemaList");
    
    System.out.println(request.getParameter("sch_type"));
    
    String sch_type = request.getParameter("sch_type"); 
    String sch_value = request.getParameter("sch_value"); 
    
    ArrayList<CinemaDTO> list = dao.search(sch_type, sch_value);
    ArrayList<ReviewStar> reviewstar = dao.reviewstar();

    mav.addObject("list", list); 
    mav.addObject("reviewstar", reviewstar); 
   
   
    return mav; 
    
  }

  
  //LIST : 카테고리
  @RequestMapping(value="/review/category.do") 
  public ModelAndView cate(@RequestParam(value="checkArr[]", defaultValue="nth")List<String> list, 
      @RequestParam(value="checkArr2[]", defaultValue="nth")List<String> addrlist) throws Exception{ 
    
    System.out.println(list);
    System.out.println(addrlist);
    
    //when brandName is null
    if(list.get(0).equals("nth")) {
      list.clear();
      String [] brandNames = {"CGV", "LOTTE", "INDEP", "MEGABOX"};
      list.addAll(Arrays.asList(brandNames));}
    //when addr1 is null
    if(addrlist.get(0).equals("nth")) {
      addrlist.clear();
      String [] addrs = {"SEO", "GGD", "ICH", "CCD", "KSD", "KSD", "JLD", "JJD"};
      addrlist.addAll(Arrays.asList(addrs));}

    System.out.println(list);
    System.out.println(addrlist);
    
    ArrayList<CinemaDTO> category = dao.cate(list, addrlist);
    System.out.println(category);
    System.out.println(category.size());
    
    //값 잘 넘어오는 것 확인
    //MOELANDVIEW로 값 받아서 REFRESH하기
    ModelAndView mav= new ModelAndView();
    
    ArrayList<ReviewStar> reviewstar = dao.reviewstar();

    mav.addObject("list", category); 
    mav.addObject("reviewstar", reviewstar); 

    mav.setViewName("review/cinemaList_");
    
    return mav;
   
  } // category end
  
  
  
  ////////////////////////////// ROOM /////////////////////////////////////
  
  // ROOM INSERT
  @RequestMapping(value="/review/roomForm.do", method=RequestMethod.GET)
  public ModelAndView roomForm(String cineCode) {
    
    ModelAndView mav= new ModelAndView();
    mav.setViewName("review/roomForm");
    mav.addObject("cineCode", cineCode);
    
    System.out.println(cineCode);
    
    return mav;
    
  } // 
  
  // ROOM INSERT PROCESS
 @RequestMapping(value="/review/roomForm.do", method=RequestMethod.POST)
 public ModelAndView roomFormProc(RoomDTO dto, HttpServletRequest req) {

   ModelAndView mav= new ModelAndView();
   mav.setViewName("msgView");
   
   //RoomCode and RoomName create
   RoomDTO setdto = new RoomDTO();
   setdto = dao.setRoomCode(dto.getCineCode());
   
   System.out.println(setdto.getRoomCode());
   System.out.println(setdto.getRoomName());
   
   dto.setRoomCode(setdto.getRoomCode());
   dto.setRoomName(setdto.getRoomName());
   
   //RoomName
   System.out.println(req.getParameter("DD1")); 
   System.out.println(req.getParameter("DD2")); 
   System.out.println(req.getParameter("DD3")); 
   

   ////////////// 좌석이미지 ////////////
   // cinema IMG file
   mav.addObject("root", Utility.getRoot());
   // Real Path
   String basePath = req.getRealPath("/review/roomimg");
   MultipartFile seatImgMF = dto.getSeatImgMF();
   // 좌석이미지 필수
   String seatImg = UploadSaveManager.saveFileSpring30(seatImgMF, basePath);
   dto.setSeatImg(seatImg);

   
   ////////////// 상영타입 ////////////
   // DD set하기
   String DD = "";
   
   // 기타 상영관이면 input 값 받아오기
   if (req.getParameter("DD1").equals("ETC")) {
     DD += req.getParameter("DDand1");
   } else {
     // 기타 상영관이 아닌 경우 DD1에 선택한 value값
     DD += req.getParameter("DD1");
   }
   
   //DD2 부터는 필수 입력이 아니기 때문에 null값인지 확인
   //0이라면 DD에 별도 추가 하지 않음
   if(req.getParameter("DD2")!="0") {
     //null이 아니면 기타 상영관 선택 여부 확인
   if (req.getParameter("DD2").equals("ETC")) {
     DD += "," + req.getParameter("DDand2");
   } else {
     // 기타 상영관을 선택하지 않았으면 DD2의 값 가져오기
     DD += "," + req.getParameter("DD2");
   }
   } // DD2값 입력했는지 확인
   
   //DD3 부터는 필수 입력 아니기에 null인지  확인
   //0이라면 DD에 별도 추가 하지 않음
   if(req.getParameter("DD3")!="0") {
     //null이 아니면 DD3가 기타상영관 여부 확인
   if (req.getParameter("DD3").equals("ETC")) {
     DD += "," + req.getParameter("DDand3");
   } else {
     DD += "," + req.getParameter("DD3");
   }
   } // DD3 입력값 확인 끝
   
   //모든 값 입력 확인 후 DD3에 입력
   System.out.println(DD);
   dto.setDD(DD);
   
   int count = dao.roomForm(dto);
   
   String msg = "";
   
   if (count == 0) {
     msg += "<!DOCTYPE html>";
     msg += "<html><body>";
     msg += "<script>";
     msg += "  alert('등록 실패');";
     msg += "  history.go(-1);";
     msg += "</script>";
     msg += "</html></body>";
     mav.addObject("msg", msg);
     mav.setViewName("msgView");
   } else {
     msg += "<!DOCTYPE html>";
     msg += "<html><body>";
     msg += "<script>";
     msg += "  alert('등록 성공');";
     msg += "  window.location='./cinemaList.do';";
     msg += "</script>";
     msg += "</html></body>";
     mav.addObject("msg", msg);
     mav.setViewName("msgView");
   } // if end

   return mav;
 } // 
  
  
 ////////////////////////////////////// LIST
 @RequestMapping(value="/review/roomList.do", method=RequestMethod.GET)
 public ModelAndView roomList(String cineCode) {
   
   ModelAndView mav= new ModelAndView();
   mav.setViewName("review/roomList");
   
   System.out.println(cineCode);
   
   ArrayList<RoomDTO> list = dao.roomList(cineCode);
   mav.addObject("list", list); 
   return mav;
 } 


 //////////////////////////////////////// UPDATE
 
 //GET
 @RequestMapping(value="/review/roomUpdate.do", method = RequestMethod.GET)
 public ModelAndView roomUpdate(RoomDTO dto) {
   ModelAndView mav = new ModelAndView();
   // dto를 현재 dto로 업데이트
   dto = dao.roomRead(dto);
 
   mav.addObject("dto", dto);
   mav.setViewName("review/roomUpdate");
   return mav;
 }//userUpdateForm() end
 
 //POST
 @RequestMapping(value="/review/roomUpdate.do", method = RequestMethod.POST)
 public ModelAndView roomUpdateProc(RoomDTO dto, String roomCode, HttpServletRequest req) {
  
     ModelAndView mav = new ModelAndView();
     mav.setViewName("msgView");
 
     RoomDTO oldDTO = dao.roomRead(dto);
     
     dto.setCineCode(roomCode);

     // 전송되는 파일이 저장되는 실제 경로
     String basePath = req.getSession().getServletContext().getRealPath("/review/roomimg");

     MultipartFile seatImgMF = dto.getSeatImgMF();
     MultipartFile oldseatImgMF = oldDTO.getSeatImgMF();
     
     if (seatImgMF.getSize() > 0) {
       UploadSaveManager.deleteFile(basePath, oldseatImgMF);
       // 새로운 파일 있을 경우 삭제하고 하기
       String seatImg = UploadSaveManager.saveFileSpring30(seatImgMF, basePath);
       dto.setSeatImg(seatImg);
     } else {
       // 기존파일을 새로 저장
       dto.setSeatImg(oldDTO.getSeatImg());
     }

     int cnt = dao.roomUpdate(dto);
     String msg = "";

     if (cnt == 0) {
       msg += "<!DOCTYPE html>";
       msg += "<html><body>";
       msg += "<script>";
       msg += "  alert('수정 실패');";
       msg += "  history.go(-1);";
       msg += "</script>";
       msg += "</html></body>";
       mav.addObject("msg", msg);
       mav.setViewName("msgView");
     } else {
       msg += "<!DOCTYPE html>";
       msg += "<html><body>";
       msg += "<script>";
       msg += "  alert('수정 성공');";
       msg += "  window.location='./cinemaList.do';";
       msg += "</script>";
       msg += "</html></body>";
       mav.addObject("msg", msg);
       mav.setViewName("msgView");
     } // if end

     return mav;

   } // end

 
 ////////////////////////////////////// DELETE
 
 //GET
 @RequestMapping(value="/review/roomDelete.do", method = RequestMethod.GET)
 public ModelAndView roomDelete(String roomCode) {
   
   ModelAndView mav = new ModelAndView();
   mav.setViewName("msgView");
   String msg = "";

     msg += "<!DOCTYPE html>";
     msg += "<html><body>";
     msg += "<input type='hidden' value='취소'>";
     msg += "<p>삭제하시겠습니까?</p>";
     msg += "<input type='button' value='확인' onclick='location.href=\"./roomDeletePro.do?roomCode="
         + roomCode + "\"'>";
     msg += "<input type='button' value='취소' onclick='javascript:history.back()'>";
     msg += "</html></body>";
     
     mav.addObject("msg", msg);
     mav.setViewName("msgView");

   return mav;
 }// roomDelete end
 
 //DELETE PROCESS
 
 @RequestMapping(value="/review/roomDeletePro.do", method = RequestMethod.GET)
 public ModelAndView roomDeletePro(String roomCode) {
   ModelAndView mav = new ModelAndView();
  
   System.out.println(roomCode + "PROC");
   int count = dao.roomDeletePro(roomCode);
   String msg = "";
   
   if (count == 0) {
     msg += "<!DOCTYPE html>";
     msg += "<html><body>";
     msg += "<script>";
     msg += "  alert('삭제 실패');";
     msg += "  history.go(-1);";
     msg += "</script>";
     msg += "</body></html>";
     mav.addObject("msg", msg);
     mav.setViewName("msgView");
   } else {
     msg += "<!DOCTYPE html>";
     msg += "<html><body>";
     msg += "<script>";
     msg += "  alert('삭제 성공');";
     msg += "  window.location='./cinemaList.do';";
     msg += "</script>";
     msg += "</body></html>";
     mav.addObject("msg", msg);
     mav.setViewName("msgView");
   } // if end

  return mav;
  
 }
 
  ////////////////////////////// REVIEW  ////////////////////////////////////////////////////////////////////////////
  //reviewCreate-----------------------------
  @RequestMapping(value="/review/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav= new ModelAndView();
    mav.setViewName("review/reviewForm");
    return mav;
  } // get (view 보여주기)
  
  @RequestMapping(value="/review/create.do", method=RequestMethod.POST)
  public ModelAndView createProc(ReviewStar sdto, HttpServletRequest req) throws UnknownHostException {
    ModelAndView mav = new ModelAndView();
    /*ip가져오기*/
    InetAddress local = InetAddress.getLocalHost();
    String ip = local.getHostAddress();
    sdto.setIp(ip);
    
    /*값이 제대로 넘어오는지 확인
    System.out.println(sdto.getPixel());*/ 
    
    int count = dao.create(sdto);  
    String msg = "";
    
    if (count == 0) {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('별점 등록 실패');";
      msg += "  history.go(-1);";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    } else {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('별점 등록 성공');";
      msg += "  window.location='./cinemaList.do';";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    } // if end
    return mav;
  } // POST (실제 실행되는애) 
  
  
  
  //cinemaRead ( 영화관 상세정보 ,리뷰보기, 리뷰매기기 ) --------------------
  @RequestMapping(value="/review/cinemaRead.do", method=RequestMethod.GET)
  public ModelAndView cinemaRead(CinemaDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("review/cinemaRead");
    dto = dao.cinemaRead(dto);
    ArrayList<ReviewStar> reviewstar = dao.reviewstar();
    ArrayList<ReviewStar> list = dao.list();
    // 페이지 이동 및 값 올리기
    
    //사이즈값으로 제대로 찍히나 확인
    System.out.println(list.size());
    
    mav.setViewName("review/cinemaRead"); //reviewList
    mav.addObject("list", list);
    mav.addObject("reviewstar", reviewstar);
    mav.addObject("dto", dto);
    return mav;
  }
  //reviewDelete
  
  
  
  //reviewDelete -------------------------------------
  @RequestMapping(value="/review/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(String no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("msgView");
    String msg = "";
    
    msg += "<!DOCTYPE html>";
    msg += "<html><body>";
    msg += "<input type='hidden' value='취소'>";
    msg += "<p>삭제하시겠습니까?</p>";
    msg += "<input type='button' value='확인' onclick='location.href=\"./deleteProc.do?no="
        + no + "\"'>";
    msg += "<input type='button' value='취소' onclick='javascript:history.back()'>";
    msg += "</html></body>";
    mav.addObject("msg", msg);
    mav.setViewName("msgView");
    return mav;
  }

  @RequestMapping(value="/review/deleteProc.do", method=RequestMethod.GET)
   public ModelAndView deleteProc(String no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("msgView");
    
    System.out.println("proc"+ no);
    int count = dao.deleteProc(no);
    String msg = "";
    
    if (count == 0) {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('삭제 실패');";
      msg += "  history.go(-1);";
      msg += "</script>";
      msg += "</body></html>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    } else {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('삭제 성공');";
      msg += "  window.location='./cinemaList.do';";
      msg += "</script>";
      msg += "</body></html>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    } // if end
   return mav;
  }


  
  
} // class end
