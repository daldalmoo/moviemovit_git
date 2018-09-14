package kr.co.moviemovit.review;

import java.util.ArrayList;
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
    
    
    // �̹����� ÷�ε��� �ʾ����� ����Ʈ �̹����� SET
    if(logoImgMF.isEmpty()) {  
      dto.setLogoImg("default.png");
    } else { 
      String logoImg = UploadSaveManager.saveFileSpring30(logoImgMF, basePath);
      dto.setLogoImg(logoImg);
    }
    
    // CINECODE�� NVL�� ��������� �ʱ� ������ ������ ����
    // BRAND�� ���ڸ� + �ش� �귣�� �� ���° ��ȭ������ cincodeset
    String cineCode = dao.setCineCode(dto.getBrandName());
    dto.setCineCode(cineCode);
    int count = dao.cinemaForm(dto);
    
    String msg = "";
    
    if (count == 0) {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('��� ����');";
      msg += "  history.go(-1);";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    } else {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('��� ����');";
      msg += "  window.location='./cinemaList.do';";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    } // if end

    return mav;
  } // 
  
  // CREATE : ����, �浵�� ��� ���� ����
  @RequestMapping(value="/review/geoCoding.do")
  public void geoCoding(HttpServletRequest req, HttpServletResponse response) throws Exception{
    String location = req.getParameter("addr");

    Geocoder geocoder = new Geocoder();
    // setAddress : ��ȯ�Ϸ��� �ּ� (��⵵ ������ �д籸 ��)
    // setLanguate : ���ڵ� ����
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
            response.getWriter().write(coordStr); // ��������ȯ
          }
  } // 
  
  
  /////////////////////////////////////// READ

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
    // dto�� ���� dto�� ������Ʈ
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

      // ���۵Ǵ� ������ ����Ǵ� ���� ���
      String basePath = req.getSession().getServletContext().getRealPath("/review/img");

      MultipartFile logoImgMF = dto.getLogoImgMF();
      MultipartFile oldlogoImgMF = oldDTO.getLogoImgMF();
      
      if (logoImgMF.getSize() > 0) {
        UploadSaveManager.deleteFile(basePath, oldlogoImgMF);
        // ���ο� ���� ���� ��� �����ϰ� �ϱ�
        // poster posterMF ???
        String logoImg = UploadSaveManager.saveFileSpring30(logoImgMF, basePath);
        dto.setLogoImg(logoImg);
      } else {
        // ���������� ���� ����
        dto.setLogoImg(oldDTO.getLogoImg());
      }

      int cnt = dao.cinemaUpdate(dto);
      String msg = "";

      if (cnt == 0) {
        msg += "<!DOCTYPE html>";
        msg += "<html><body>";
        msg += "<script>";
        msg += "  alert('���� ����');";
        msg += "  history.go(-1);";
        msg += "</script>";
        msg += "</html></body>";
        mav.addObject("msg", msg);
        mav.setViewName("msgView");
      } else {
        msg += "<!DOCTYPE html>";
        msg += "<html><body>";
        msg += "<script>";
        msg += "  alert('���� ����');";
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
    // dto�� ���� dto�� ������Ʈ
    String cineCode = req.getParameter("cineCode");
    
    mav.addObject("cineCode", cineCode);
    
    String msg = "";

      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<p>�����Ͻðڽ��ϱ�?</p>";
      msg += "<input type='button' value='Ȯ��' onclick='location.href=\"./cinemaDeletePro.do?cineCode="
          + cineCode + "\"'>";
      msg += "<input type='button' value='���' onclick='javascript:history.back()'>";
      msg += "</html></body>";
      
      mav.addObject("msg", msg);
      mav.setViewName("msgView");

    return mav;
  }//userUpdateForm() end
  
  //DELETE PROCESS
  
  @RequestMapping(value="/review/cinemaDeletePro.do", method = RequestMethod.GET)
  public ModelAndView cinemaDeletePro(HttpServletRequest req) {
    ModelAndView mav = new ModelAndView();
    // dto�� ���� dto�� ������Ʈ
    String cineCode = req.getParameter("cineCode");
    
    int count = dao.cinemaDeletePro(cineCode);
    String msg = "";
    
    if (count == 0) {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('���� ����');";
      msg += "  history.go(-1);";
      msg += "</script>";
      msg += "</body></html>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    } else {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('���� ����');";
      msg += "  window.location='./cinemaList.do';";
      msg += "</script>";
      msg += "</body></html>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    } // if end

   return mav;
   
  }
  
  ////////////////////////////////////// LIST + ����¡ 0912
  @RequestMapping(value="/review/cinemaList.do")
  public ModelAndView cinemaList(HttpServletRequest request) {
    
    ModelAndView mav= new ModelAndView();
    Criteria cri = new Criteria();

    //ù�������� ��� page�� 1�� ����
    //1���������� �Ǵ� ���� = request page ���� null ���θ� �Ǵ�
    String pagetemp = request.getParameter("page");
    int page = 1;

    //null�� �ƴ϶�� page�� int������ ��ȭ��Ű�� page�� set
    if (pagetemp!=null) {
    page = Integer.parseInt(pagetemp);
    cri.setPage(page);
    }
    
    //0�̶� 10
    System.out.println(cri.getPageStart());
    System.out.println(cri.getPage());
    
    ArrayList<CinemaDTO> list = dao.listCriteria(cri);
    
    mav.addObject("list", list);  // �Խ����� �� ����Ʈ
    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);
    
    //total�� xml ���� �߰� ���� ��Ʈ�ѷ����� count
    //list�� �ҷ��ͼ�
    ArrayList<CinemaDTO> alllist = dao.cinemaList();
    // size ���
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

  
  //LIST : ī�װ�
  @RequestMapping(value="/review/categorize.do", method=RequestMethod.POST) 
  public ModelAndView cate(@RequestParam("checkArr[]")List<String> list, @RequestParam("checkArr2[]")List<String> list2) throws Exception{ 
    
    System.out.println(list);
    System.out.println(list2);
  
    ArrayList<CinemaDTO> category = dao.cate(list, list2);
    System.out.println(category);
    System.out.println(category.size());
    
    //�� �� �Ѿ���� �� Ȯ��
    //MOELANDVIEW�� �� �޾Ƽ� REFRESH�ϱ�
    ModelAndView mav= new ModelAndView();
    
    ArrayList<ReviewStar> reviewstar = dao.reviewstar();

    mav.addObject("list", category); 
    mav.addObject("reviewstar", reviewstar); 

    mav.setViewName("review/cinemaList_");
    
    return mav;
   
  }
 

  ////////////////////////////// REVIEW  ////////////////////////////////////////////////////////////////////////////

  /*0906 �������� �ű�� ��*/
  @RequestMapping(value="/review/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav= new ModelAndView();
    mav.setViewName("review/reviewForm");
    return mav;
  } // 
  
  @RequestMapping(value="/review/create.do", method=RequestMethod.POST)
  public ModelAndView createProc(ReviewStar sdto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("review/msgView");
    //int count = dao.create(sdto);
    //mav.addObject("count", count);
    return mav;
  }
  
  
  
  
  /*
  
  @RequestMapping(value="/review/reviewForm.do", method=RequestMethod.POST)
  public ModelAndView reviewform(ReviewStar sdto) {
    ModelAndView mav= new ModelAndView();
    mav.setViewName("redirect:/review/cinemaList.do");
    int count = dao.reviewForm(sdto);
    mav.addObject("count", count);
    return mav;
  } // POST*/
  
  
  /* review ���                              ���Ȯ���ϴ� ��
  @RequestMapping(value="/review/cinemaRead.do")
  public ModelAndView list(ReviewStar sdto) {
      ModelAndView mav = new ModelAndView();
      ArrayList<ReviewStar> list = dao.list();
      // ������ �̵� �� �� �ø���
      mav.setViewName("review/cinemaRead"); //reviewList
      mav.addObject("list", list);
      return mav; 
  }*/ //list() end

  
} // class end
