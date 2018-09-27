package kr.co.moviemovit.review;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
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

import kr.co.moviemovit.notice.NoticeDTO;
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

  // NEW LIST
  @RequestMapping(value="/review/cinemaList.do", method=RequestMethod.GET)
  public ModelAndView cinemaList() {
    
    ModelAndView mav= new ModelAndView();
    mav.setViewName("review/cinemaList");
    
    ArrayList<CinemaDTO> list = dao.cinemaList();
    mav.addObject("list", list); 
    return mav;
  } 

  @RequestMapping(value="/review/addrList.do", method = RequestMethod.POST)
  public void addrList(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    String msg = "";
    
    String addr1 = req.getParameter("addr1");
    System.out.println("addr1 : "+addr1);
    
    //ī�װ��� ������ �ּ� ����Ʈ
    ArrayList<CinemaDTO> addrList = dao.addrList(addr1);
    
    msg += " <a class='brandList active' id='0'>��ü</a>";
    for(int j=0; j<addrList.size(); j++) {
      CinemaDTO cinema = addrList.get(j);
      msg += "  <a class='brandList' id='"+cinema.getBrandName()+"'>";
      if(cinema.getBrandName().equals("CGV")) { msg += "CGV"; }
      else if(cinema.getBrandName().equals("LOTTE")) { msg += "�Ե��ó׸�"; }
      else if(cinema.getBrandName().equals("MEGABOX")) { msg += "�ް��ڽ�"; }
      else if(cinema.getBrandName().equals("INDEP")) { msg += "������ȭ��"; }//if end
      msg += "  </a>";
    }//for end
    
    // ���
    resp.setContentType("text/plain; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    out.println(msg);
    out.flush();
    out.close();
  }//addrList() end
  
  @RequestMapping(value="/review/selectAddr.do", method = RequestMethod.POST) 
  public ModelAndView selectAddr(@RequestParam("addr1") String addr1) throws Exception{ 
  
    System.out.println(addr1);
    ArrayList<CinemaDTO> list = dao.selectAddr(addr1);
    
    // list size�� 0�̸� ��ü List ���
    if(list.size()==0) {
      
      list = dao.cinemaList();
      
    }
    
    //�� �� �Ѿ���� �� Ȯ��
    //MOELANDVIEW�� �� �޾Ƽ� REFRESH�ϱ�
    ModelAndView mav= new ModelAndView();
    
    mav.addObject("list", list); 
    mav.setViewName("review/cinemaListSelect");
    
    return mav;
   
  } // category end
  
 @RequestMapping(value="/review/selectBrand.do", method = RequestMethod.POST) 
  public ModelAndView selectBrand(@RequestParam("addr1") String addr1, @RequestParam("brandName") String brandName) throws Exception{ 
  
   
   CinemaDTO dto = new CinemaDTO();
   
   dto.setAddr1(addr1);
   dto.setBrandName(brandName);
   
   System.out.println("�ּ� :" + addr1);
   System.out.println("�귣�� :"+ brandName);

    ArrayList<CinemaDTO> list = dao.selectBrand(dto);
    
    // list size�� 0�̸� �ּҸ� ������ List ���
    
    if(list.size()==0) {
      
      list = dao.selectAddr(addr1);
    }
    
    //�� �� �Ѿ���� �� Ȯ��
    //MOELANDVIEW�� �� �޾Ƽ� REFRESH�ϱ�
    ModelAndView mav= new ModelAndView();
    
    mav.addObject("list", list); 
    mav.setViewName("review/cinemaListSelect");
    
    return mav;
   
  } // category end
 
 
 // LIST : search
 @RequestMapping(value="/review/search.do", method=RequestMethod.GET) 
 public ModelAndView search(@Param("sch_type")String sch_type, @Param("sch_value")String sch_value) { 
 
   ModelAndView mav= new ModelAndView();
   mav.setViewName("review/cinemaList");

   ArrayList<CinemaDTO> list = dao.search(sch_type, sch_value);

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
   

   ////////////// �¼��̹��� ////////////
   // cinema IMG file
   mav.addObject("root", Utility.getRoot());
   // Real Path
   String basePath = req.getRealPath("/review/roomimg");
   MultipartFile seatImgMF = dto.getSeatImgMF();
   // �¼��̹��� �ʼ�
   String seatImg = UploadSaveManager.saveFileSpring30(seatImgMF, basePath);
   dto.setSeatImg(seatImg);

   
   ////////////// ��Ÿ�� ////////////
   // DD set�ϱ�
   String DD = "";
   
   // ��Ÿ �󿵰��̸� input �� �޾ƿ���
   if (req.getParameter("DD1").equals("ETC")) {
     DD += req.getParameter("DDand1");
   } else {
     // ��Ÿ �󿵰��� �ƴ� ��� DD1�� ������ value��
     DD += req.getParameter("DD1");
   }
   
   //DD2 ���ʹ� �ʼ� �Է��� �ƴϱ� ������ null������ Ȯ��
   //0�̶�� DD�� ���� �߰� ���� ����
   if(req.getParameter("DD2")!="0") {
     //null�� �ƴϸ� ��Ÿ �󿵰� ���� ���� Ȯ��
   if (req.getParameter("DD2").equals("ETC")) {
     DD += "," + req.getParameter("DDand2");
   } else {
     // ��Ÿ �󿵰��� �������� �ʾ����� DD2�� �� ��������
     DD += "," + req.getParameter("DD2");
   }
   } // DD2�� �Է��ߴ��� Ȯ��
   
   //DD3 ���ʹ� �ʼ� �Է� �ƴϱ⿡ null����  Ȯ��
   //0�̶�� DD�� ���� �߰� ���� ����
   if(req.getParameter("DD3")!="0") {
     //null�� �ƴϸ� DD3�� ��Ÿ�󿵰� ���� Ȯ��
   if (req.getParameter("DD3").equals("ETC")) {
     DD += "," + req.getParameter("DDand3");
   } else {
     DD += "," + req.getParameter("DD3");
   }
   } // DD3 �Է°� Ȯ�� ��
   
   //��� �� �Է� Ȯ�� �� DD3�� �Է�
   System.out.println(DD);
   dto.setDD(DD);
   
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
   // dto�� ���� dto�� ������Ʈ
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

     // ���۵Ǵ� ������ ����Ǵ� ���� ���
     String basePath = req.getSession().getServletContext().getRealPath("/review/roomimg");

     MultipartFile seatImgMF = dto.getSeatImgMF();
     MultipartFile oldseatImgMF = oldDTO.getSeatImgMF();
     
     if (seatImgMF.getSize() > 0) {
       UploadSaveManager.deleteFile(basePath, oldseatImgMF);
       // ���ο� ���� ���� ��� �����ϰ� �ϱ�
       String seatImg = UploadSaveManager.saveFileSpring30(seatImgMF, basePath);
       dto.setSeatImg(seatImg);
     } else {
       // ���������� ���� ����
       dto.setSeatImg(oldDTO.getSeatImg());
     }

     int cnt = dao.roomUpdate(dto);
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
 @RequestMapping(value="/review/roomDelete.do", method = RequestMethod.GET)
 public ModelAndView roomDelete(String roomCode) {
   
   ModelAndView mav = new ModelAndView();
   mav.setViewName("msgView");
   String msg = "";

     msg += "<!DOCTYPE html>";
     msg += "<html><body>";
     msg += "<input type='hidden' value='���'>";
     msg += "<p>�����Ͻðڽ��ϱ�?</p>";
     msg += "<input type='button' value='Ȯ��' onclick='location.href=\"./roomDeletePro.do?roomCode="
         + roomCode + "\"'>";
     msg += "<input type='button' value='���' onclick='javascript:history.back()'>";
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
 
  ////////////////////////////////////////////////// REVIEW  ////////////////////////////////////////////////////////////////////////////
  //reviewCreate-----------------------------
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
    System.out.println(ip);
    
    //���� ����� �Ѿ������ Ȯ��
    System.out.println(sdto.getPixel());
    System.out.println(sdto.getUid());
    System.out.println(sdto.getS_e());
    
    String msg = "";

    //�ش� ID�� ������ ���� �� ���� �ִ��� Ȯ��
    ReviewStar dupdto = dao.duplicate(sdto);
    
    //�ش� ID�� ���� ������ ������ ���� �� ���� �� �۾��� �ϱ�
    if(dupdto!=null) {
      
      System.out.println(dupdto.getNo());
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  var bResult = confirm('������ ������ ���� �ֽ��ϴ�. �ش� ���� ����� �� ���並 ����ϰڽ��ϱ�?');";
      msg += "  if (bResult == true) {";  // ���� ���� ���
      
      // ��� 
      int count = dao.create(sdto);  
      if (count == 0) {
        msg += "  alert('��� ����');";
        msg += "  history.go(-1);";
      } else {
        msg += "  alert('���� ��� ����');";
      } // ��� if end
        
      //���� ����
      msg += "    window.location='./deleteProc.do?no="+dupdto.getNo()+"';";
      msg += "  } else {";  // �ƴϿ��� ���� ���
      msg += "    history.go(-1);";
      msg += "  }";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    } else {
    //�ش� ID�� ���� ������ ������ �ٷ� �����������
    int count = dao.create(sdto);  
    
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
    }// �Խñ� �ߺ�Ȯ�� ��
    return mav;
  } // POST (���� ����Ǵ¾�) 
  
  //cinemaRead ( ��ȭ�� ������ ,���亸��, ����ű�� ) --------------------
  @RequestMapping(value="/review/cinemaRead.do", method=RequestMethod.GET)
  public ModelAndView cinemaRead(CinemaDTO dto) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("review/cinemaRead");
    
    System.out.println(dto.getCineCode());
    
    dto = dao.cinemaRead(dto);
    ArrayList<ReviewStar> reviewstar = dao.reviewstar();
    ArrayList<ReviewStar> list = dao.list(dto.getCineCode());
    // ������ �̵� �� �� �ø���
    
    //��������� ����� ������ Ȯ��
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
    msg += "<input type='hidden' value='���'>";
    msg += "<p>�����Ͻðڽ��ϱ�?</p>";
    msg += "<input type='button' value='Ȯ��' onclick='location.href=\"./deleteProc.do?no="
        + no + "\"'>";
    msg += "<input type='button' value='���' onclick='javascript:history.back()'>";
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
  
  
  //GET
  @RequestMapping(value="/review/reviewUpdate.do", method = RequestMethod.GET)
  public ModelAndView reviewUpdate(int no, String cineCode) {
    System.out.println("no�� :" + no + "/ cineCode�� :"+cineCode);
    ReviewStar inputStar = new ReviewStar();
    inputStar.setNo(no);
    inputStar.setCineCode(cineCode);
    ModelAndView mav = new ModelAndView();
    ReviewStar rs = dao.updateList(inputStar);
    mav.addObject("rs", rs);
    System.out.println(rs.getS_e()+" <---�����Դϴ�");
    mav.setViewName("review/reviewForm");
    return mav;
  }//reviewUpdate GET
  
  @RequestMapping(value = "/review/reviewUpdate.do", method = RequestMethod.POST)
  public ModelAndView updateProc(ReviewStar sdto) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = dao.reviewUpdate(sdto);
    
    String msg = "";
    if(cnt == 0) {
      msg += "<!DOCTYPE html>";
      msg += "<html><body>";
      msg += "<script>";
      msg += "  alert('���� �����߽��ϴ�');";
      msg += "  history.go(-1);";
      msg += "</script>";
      msg += "</html></body>";
      mav.addObject("msg", msg);
      mav.setViewName("msgView");
    }else {
      mav.addObject("cnt", cnt);
      mav.setViewName("redirect:/read.do");
    }//if end
    return mav;
  }// updateProc() end
  

 
} // class end
