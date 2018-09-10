package kr.co.moviemovit.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
  
  
  // CREATE
  
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
    
    if(count==0) {
      mav.addObject("msg1", "<p>영화관 등록 실패</p>");
      mav.addObject("img", "<img src='../img/fail.png'>");
      mav.addObject("link1", "<input type='button' value='다시시도' onclick='javascript:history.back()'>");
      mav.addObject("link2", "<input type='button' value='목록으로' onclick='location.href=\"./cinemaList.do?cineCode=" + dto.getCineCode() + "\"'>");
    } else {
      mav.addObject("msg1", "<p>영화관 등록 성공</p>");
      mav.addObject("img", "<img src='../img/success.jpg'>");
      mav.addObject("link1", "<input type='button' value='목록으로' onclick='location.href=\"./cinemaList.do?cineCode=" + dto.getCineCode() + "\"'>");      
    }

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
  
  
  ///////////////////////////////READ

  @RequestMapping(value="/review/cinemaRead.do", method=RequestMethod.GET)
  public ModelAndView cinemaRead(CinemaDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("review/cinemaRead");
    dto = dao.cinemaRead(dto);
    ArrayList<ReviewStar> reviewstar = dao.reviewstar();
 /*   ReviewStarDTO reviewstardto = dao.reviewstardto();*/
//    mav.addObject("reviewstardto", reviewstardto);
    mav.addObject("reviewstar", reviewstar);
    mav.addObject("dto", dto);
    return mav;
    
  }
  

  
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
        // poster posterMF ???
        String logoImg = UploadSaveManager.saveFileSpring30(logoImgMF, basePath);
        dto.setLogoImg(logoImg);
      } else {
        // 기존파일을 새로 저장
        dto.setLogoImg(oldDTO.getLogoImg());
      }

      int cnt = dao.cinemaUpdate(dto);

      if (cnt == 0) {
        mav.addObject("msg1", "<p>수정</p>");
        mav.addObject("img", "<img src='../img/fail.png'>");
        mav.addObject("link1", "<input type='button' value='다시시도' onclick='javascript:history.back()'>");
        mav.addObject("link2", "<input type='button' value='그룹목록' onclick='location.href=\"./reviewlist.do?cineCode="
            + dto.getCineCode() + "\"'>");
      } else {
        mav.addObject("msg1", "<p>수정 성공</p>");
        mav.addObject("img", "<img src='../img/success.jpg'>");
        mav.addObject("link1", "<input type='button' value='그룹목록' onclick='location.href=\"./reviewlist.do?cineCode="
            + dto.getCineCode() + "\"'>");
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
    mav.addObject("msg1", "<p>삭제하시겠습니까?</p>");
    mav.addObject("img", "<img src='/img/default.png'>");
    mav.addObject("link2", "<input type='button' value='취소' onclick='javascript:history.back()'>");
    mav.addObject("link1", "<input type='button' value='확인' onclick='location.href=\"./cinemaDeletePro.do?cineCode="
        + cineCode + "\"'>");
    
    mav.setViewName("msgView");
    return mav;
  }//userUpdateForm() end
  
  //DELETE PROCESS
  
  @RequestMapping(value="/review/cinemaDeletePro.do", method = RequestMethod.GET)
  public ModelAndView cinemaDeletePro(HttpServletRequest req) {
    ModelAndView mav = new ModelAndView();
    // dto를 현재 dto로 업데이트
    String cineCode = req.getParameter("cineCode");
    
    int count = dao.cinemaDeletePro(cineCode);
    
    if (count==0) {
      mav.addObject("msg1", "<p>삭제 실패</p>");
      mav.addObject("img", "<img src='../img/fail.png'>");
      mav.addObject("link1", "<input type='button' value='다시시도' onclick='javascript:history.back()'>");
      mav.addObject("link2", "<input type='button' value='목록' onclick='location.href=\"./cinemaList.do'>");
    } else {
      mav.addObject("msg1", "<p>삭제 성공</p>");
      mav.addObject("img", "<img src='../img/success.jpg'>");
      mav.addObject("link1", "<input type='button' value='목록' onclick='location.href=\"./cinemaList.do'>");
    } // if end

    mav.setViewName("msgView");
    
   return mav;
   
  }
  
  ////////////////////////////////////// LIST
  @RequestMapping(value="/review/cinemaList.do")
  public ModelAndView cinemaList() {
    
    ModelAndView mav= new ModelAndView();
    mav.setViewName("review/cinemaList");
    ArrayList<CinemaDTO> list = dao.cinemaList();
    ArrayList<ReviewStar> reviewstar = dao.reviewstar();
    mav.addObject("list", list);
    mav.addObject("reviewstar", reviewstar);
    return mav;
  } 

  
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
  
  //카테고리
  /*
  @RequestMapping(value="/review/cate.do", method=RequestMethod.GET) 
  public ModelAndView cate(HttpServletRequest request, @RequestParam("checkArr[]")List<String> list) { 
    
    System.out.println(list);
  
    /*ModelAndView mav= new ModelAndView();
    /*ModelAndView mav = new ModelAndView(new MappingJacksonJsonView());
  
    ArrayList<CinemaDTO> category = dao.cate(list);
    System.out.println(category.size());
    
  ArrayList<ReviewStar> reviewstar = dao.reviewstar();
   
    mav.addObject("list", category); 
    mav.addObject("reviewstar", reviewstar); 
   
    mav.setViewName("redirect:/review/reviewlist.do");
  
    return m;
      
  }
  */
  

  
  ////////////////////////////// REVIEW  ////////////////////////////////////////////////////////////////////////////
  

  /*0906 리뷰점수 매기는 폼*/
  @RequestMapping(value="/review/reviewForm.do", method=RequestMethod.GET)
  public ModelAndView reviewForm() {
    ModelAndView mav= new ModelAndView();
    mav.setViewName("review/reviewForm");
    return mav;
  } // 
  
  /*0905*/
  @RequestMapping(value="/review/reviewForm.do", method=RequestMethod.POST)
  public ModelAndView reviewform(ReviewStar sdto) {
    ModelAndView mav= new ModelAndView();
    mav.setViewName("redirect:/review/cinemaList.do");
    int count = dao.reviewForm(sdto);
    mav.addObject("count", count);
    return mav;
  } // POST

} // class end
