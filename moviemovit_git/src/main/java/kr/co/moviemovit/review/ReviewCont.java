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
import org.springframework.validation.BindingResult;
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
    //System.out.println(cri.getPageStart());
   //System.out.println(cri.getPage());
    
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
    
    //�� �� �Ѿ���� �� Ȯ��
    //MOELANDVIEW�� �� �޾Ƽ� REFRESH�ϱ�
    ModelAndView mav= new ModelAndView();
    
    ArrayList<ReviewStar> reviewstar = dao.reviewstar();

    mav.addObject("list", category); 
    mav.addObject("reviewstar", reviewstar); 

    mav.setViewName("review/cinemaList_");
    
    return mav;
   
  } // category end
  
  
  
  ////////////////////////////// ROOM  ////////////////////////////////////////////////////////////////////////////
  
  // ROOM INSERT
  @RequestMapping(value="/review/roomForm.do", method=RequestMethod.GET)
  public ModelAndView roomForm() {
    
    ModelAndView mav= new ModelAndView();
    mav.setViewName("review/roomForm");
    return mav;
    
  } // 
  
//CINEMA INSERT PROCESS
 @RequestMapping(value="/review/roomForm.do", method=RequestMethod.POST)
 public ModelAndView roomFormProc(RoomDTO dto, HttpServletRequest req) {

   ModelAndView mav= new ModelAndView();
   mav.setViewName("msgView");
   
   // cinema IMG file
   mav.addObject("root", Utility.getRoot());
   // Real Path
   String basePath = req.getRealPath("/review/roomimg");
   MultipartFile seatImgMF = dto.getSeatImgMF();
   
   // �¼��̹��� �ʼ�
     String seatImg = UploadSaveManager.saveFileSpring30(seatImgMF, basePath);
     dto.setSeatImg(seatImg);
   
   int count = dao.roomForm(dto);
   
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
  
  
  
  
  ////////////////////////////// REVIEW  ////////////////////////////////////////////////////////////////////////////
  //reviewCreate
  @RequestMapping(value="/review/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav= new ModelAndView();
    mav.setViewName("review/reviewForm");
    return mav;
  } // get (view �����ֱ�)
  
  @RequestMapping(value="/review/create.do", method=RequestMethod.POST)
  public ModelAndView createProc(ReviewStar sdto, HttpServletRequest req) throws UnknownHostException {
    ModelAndView mav = new ModelAndView();
    
    /*ip��������*/
    InetAddress local = InetAddress.getLocalHost();
    String ip = local.getHostAddress();
    sdto.setIp(ip);
    
   System.out.println(sdto.getAround());
   System.out.println(sdto.getCineCode());
   System.out.println(sdto.getClean());
   System.out.println(sdto.getHeart());
   System.out.println(sdto.getIp());
   System.out.println(sdto.getPixel());
   System.out.println(sdto.getS_e());
   System.out.println(sdto.getSeat());
   System.out.println(sdto.getService());
   System.out.println(sdto.getSnack());
   System.out.println(sdto.getSound());
   System.out.println(sdto.getTrans());
   System.out.println(sdto.getUid());
   
    int count = dao.create(sdto);  
    
    String msg = "";
    
    if (count == 0) {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('���� ��� ����');";
      msg += "  history.go(-1);";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    } else {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('���� ��� ����');";
      msg += "  window.location='./cinemaList.do';";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    } // if end
    return mav;
  } // post  (���� ����Ǵ¾�) 
  
  
  
  //cinemaRead ( ��ȭ�� ������ ,���亸��, ����ű�� ) 
  @RequestMapping(value="/review/cinemaRead.do", method=RequestMethod.GET)
  public ModelAndView cinemaRead(CinemaDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("review/cinemaRead");
    dto = dao.cinemaRead(dto);
    ArrayList<ReviewStar> reviewstar = dao.reviewstar();
    ArrayList<ReviewStar> list = dao.list();
    // ������ �̵� �� �� �ø���
    
    //��������� ����� ������ Ȯ��
    System.out.println(list.size());
    
    mav.setViewName("review/cinemaRead"); //reviewList
    mav.addObject("list", list);
    mav.addObject("reviewstar", reviewstar);
    mav.addObject("dto", dto);
    return mav;
  }


  
} // class end
