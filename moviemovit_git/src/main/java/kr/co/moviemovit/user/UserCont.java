package kr.co.moviemovit.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.utility.*;

@Controller
public class UserCont {
	@Autowired
	UserDAO dao;
	
	public UserCont() {
		System.out.println("---UserCont() 객체 생성");
	}//기본생성자
	
	//결과확인
	//http://localhost:9090/moviemovit/index.do
	
	//1) 회원약관
	@RequestMapping(value="/user/agree.do", method = RequestMethod.GET)
	public String agree() {
		return "user/agreement";
	}//agree() end
	
	//2) 회원가입 폼
	@RequestMapping(value="/user/joinform.do", method = RequestMethod.GET)
	public String joinForm() {
		return "user/joinForm";
	}//joinForm() end
	
	//3) 회원가입
	@RequestMapping(value="/user/joininsert.do", method = RequestMethod.POST)
	public ModelAndView joinInsert(UserDTO dto) {
		ModelAndView mav = new ModelAndView();
		String msg = "";
		int result = dao.joinMember(dto);
		
		//회원가입 결과 창
		if(result == 0) {
			msg += "<!DOCTYPE html>";
			msg += "<html><body>";
			msg += "<script>";
			msg += "  alert('회원가입에 실패했습니다');";
			msg += "  history.go(-1);";
			msg += "</script>";
			msg += "</html></body>";
			mav.addObject("msg", msg);
			mav.setViewName("msgView");
		}else {
			mav.addObject("result", result);
			mav.setViewName("redirect:/index.do");
		}//if end
		return mav;
	}//joinInsert() end
	
	//4) 아이디 중복검사
	@RequestMapping(value="/user/idcheck.do", method = RequestMethod.POST)
	public void idCheck(UserDTO dto, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		String message = "";
		
		//joinForm.jsp에서 uid넘긴거 받아옴
		if(dto.getUid().length()<5 || dto.getUid().length()>10) {
			message = "<span style='color:red;font-weight:bold'>사용불가. 5~10자 이내로 입력하세요</span>";
		}else {
			int id_result = dao.idCheck(dto); //아이디 중복확인
			if(id_result == 0) {
				message = "<span style='color:blue;font-weight:bold'>사용 가능한 아이디 입니다</span>";
			} else {
				 message = "<span style='color:green;font-weight:bold'>중복 아이디 입니다</span>";
			}
		}//if end
		
		resp.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(message);
		out.flush();
		out.close();
	}//idCheck() end
	
	//5) 이메일 중복검사
	@RequestMapping(value="/user/emailcheck.do", method = RequestMethod.POST)
	public void emailCheck(UserDTO dto, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		String message = "";
		
		if(dto.getEmail().indexOf("@")<0 || dto.getEmail().length()<0) {
			message = "<span style='color:red;font-weight:bold'>이메일을 확인하세요</span>";
		}else {
			int em_result = dao.emailCheck(dto); //이메일 중복확인
			if(em_result == 0) {
				message = "<span style='color:blue;font-weight:bold'>사용 가능한 이메일 입니다</span>";
			} else {
				 message = "<span style='color:green;font-weight:bold'>중복 이메일 입니다</span>";
			}
		}//if end
		
		resp.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(message);
		out.flush();
		out.close();

	}//emailCheck() end
	
	/***************************************************************************/
	
	//1) 로그인 폼 
	@RequestMapping(value="/user/loginform.do", method = RequestMethod.GET)
	public String loginForm() {
		return "user/loginForm";
	}//joinForm() end
	
	//2) 로그인
	@RequestMapping(value="/user/loginproc.do", method = RequestMethod.POST)
	public ModelAndView loginProc(UserDTO dto, HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView();
		String msg = "";

		dto = dao.loginProc(dto);  
		
		if(dto==null) {
			//비번이 틀렸을 경우
			msg += "<!DOCTYPE html>";
			msg += "<html><body>";
			msg += "<script>";
			msg += "  alert('아이디와 비밀번호를 다시 확인하세요');";
			msg += "  history.go(-1);";
			msg += "</script>";
			msg += "</html></body>";
			mav.addObject("msg", msg);
			mav.setViewName("msgView");
		}else {
			//로그인 성공 시 로그인 한 값 session 영역에 올리기
			if(!(dto.getGrade().equals("F"))) {
				HttpSession session = req.getSession();
				session.setAttribute("s_id", dto.getUid());
				session.setAttribute("s_passwd", dto.getUpw());
				//180903 경민 추가
				session.setAttribute("s_grade", dto.getGrade());
				
				//쿠키(아이디 저장)
				String c_id = req.getParameter("c_id");
				if(c_id==null) { //체크하지 않은 경우
					c_id="";
				}
				
				Cookie cookie = null;
				if(c_id.equals("SAVE")) {
					cookie = new Cookie("c_id", dto.getUid());
					cookie.setMaxAge(60*60*24*31); //한달
				}else {
					cookie = new Cookie("c_id", "");
					cookie.setMaxAge(0);
				}
				resp.addCookie(cookie);
				mav.addObject("dto",dto);
				mav.setViewName("redirect:/index.do");
			} else if(dto.getGrade().equals("F")) {
				//탈퇴한 회원이 로그인 할 때			
				msg += "<!DOCTYPE html>";
				msg += "<html><body>";
				msg += "<script>";
				msg += "  alert('탈퇴한 회원의 아이디입니다. 재가입 후 로그인 하세요');";
				msg += "  history.go(-1);";
				msg += "</script>";
				msg += "</html></body>";
				mav.addObject("msg", msg);
				mav.setViewName("msgView");
			}
		}//if end

		return mav;
	}//loginProc() end
	
	//3) 로그아웃
	@RequestMapping(value="/user/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = req.getSession();
		session.removeAttribute("s_id");
		session.removeAttribute("s_passwd");		
		
		mav.setViewName("redirect:/index.do");
		return mav;
	}//logout() end
	
	//4) 마이페이지
	@RequestMapping(value="/user/mypage.do", method = RequestMethod.GET)
	public ModelAndView mypage(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		
		//로그인되어서 session에 올라간 값 가져오기
		String uid = (String)session.getAttribute("s_id");
		String upw = (String)session.getAttribute("s_passwd");
		
		//uid,upw dto에 담기
		UserDTO dto = new UserDTO();
		dto.setUid(uid);
		dto.setUpw(upw);
		
		//DB에서 회원정보 가져오기
		dto = dao.getMemberInfo(dto);

		//페이지 이동 및 값 올리기
		mav.addObject("dto", dto);
		mav.setViewName("user/userInfo");
		return mav;
	}//mypage() end
	
	//5) 회원탈퇴 폼
	@RequestMapping(value="/user/userDelete.do", method = RequestMethod.GET)
	public ModelAndView userDeleteForm(UserDTO dto) {
		ModelAndView mav = new ModelAndView();
		//userCheckForm.jsp에서 dto.uid를 히든속성에 담기위해서
		mav.addObject("dto", dto);
		mav.setViewName("user/userCheckForm");
		return mav;
	}//userDeleteForm() end
	
	//6) 회원탈퇴 처리
	@RequestMapping(value="/user/userDelete.do", method = RequestMethod.POST)
	public ModelAndView userDeleteProc(UserDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String root = Utility.getRoot(); // /moviemovit
		String msg = "";
		//dto를 통해 upw, hidden을 통해 uid 받아옴
		//DB에 회원탈퇴(등급을 F로 변경)
		int check = dao.userDelete(dto);
		
		if(check==1) {
			HttpSession session = req.getSession();
			session.removeAttribute("s_id");
			session.removeAttribute("s_passwd");
			
			//회원탈퇴 성공 시
			msg += "<!DOCTYPE html>";
			msg += "<html><body>";
			msg += "<script>";
			msg += "  alert('회원탈퇴에 성공했습니다');";
			msg += " location.href='" + root + "/index.do'";
			msg += "</script>";
			msg += "</html></body>";
			mav.addObject("msg", msg);
			mav.setViewName("msgView");
		}else {
			//회원탈퇴 실패 시
			msg += "<!DOCTYPE html>";
			msg += "<html><body>";
			msg += "<script>";
			msg += "  alert('비밀번호가 틀렸습니다');";
			msg += "  history.go(-1);";
			msg += "</script>";
			msg += "</html></body>";
			mav.addObject("msg", msg);
			mav.setViewName("msgView");
		}
		
		return mav;
	}//userDeleteProc() end
	
	//7) 회원수정 폼
	@RequestMapping(value="/user/userUpdate.do", method = RequestMethod.GET)
	public ModelAndView userUpdate(UserDTO dto) {
		ModelAndView mav = new ModelAndView();
		//userUpdate.jsp에서 dto.uid를 히든속성에 담기위해서
		mav.addObject("dto", dto);
		mav.setViewName("user/userUpdate");
		return mav;
	}//userUpdateForm() end
	
	//8) 회원수정 입력 폼
	@RequestMapping(value="/user/userUpdateForm.do", method = RequestMethod.POST)
	public ModelAndView userUpdateForm(UserDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String root = Utility.getRoot(); // /moviemovit
		//dto를 통해 upw, hidden을 통해 uid 받아옴
		//DB에서 회원정보 조회하기
		dto = dao.getMemberInfo(dto);
		
		mav.addObject("dto",dto);
		mav.addObject("root", root);
		mav.setViewName("user/userUpdateForm");
		return mav;
	}//userUpdateForm() end
	
	//9) 회원수정 처리
	@RequestMapping(value="/user/userUpdateProc.do", method = RequestMethod.POST)
	public ModelAndView userUpdateProc(UserDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String root = Utility.getRoot(); // /moviemovit
		String msg = "";
		//dto를 통해 새로 입력한 회원정보 가져옴
		//DB에 수정한 회원정보 입력하기
		int result = dao.updateMember(dto);
		
		if(result == 0) {
			msg += "<!DOCTYPE html>";
			msg += "<html><body>";
			msg += "<script>";
			msg += "  alert('회원수정에 실패했습니다');";
			msg += "  history.go(-1);";
			msg += "</script>";
			msg += "</html></body>";
			mav.addObject("msg", msg);
			mav.setViewName("msgView");
		}else {			
			msg += "<!DOCTYPE html>";
			msg += "<html><body>";
			msg += "<script>";
			msg += "  alert('회원수정을 완료했습니다');";
			msg += " location.href='" + root + "/index.do'";
			msg += "</script>";
			msg += "</html></body>";
			mav.addObject("msg", msg);
			mav.setViewName("msgView");
		}//if end
		return mav;

	}//userUpdateProc() end
	
	//10) 아이디 찾기 폼
	@RequestMapping(value="/user/findUserId.do", method = RequestMethod.GET)
	public String findUserId() {
		return "user/findUserId";
	}//findUseruid() end
	
	//11) 아이디 찾기 처리
	@RequestMapping(value="/user/findUserIdProc.do", method = RequestMethod.POST)
	public ModelAndView findUserIdProc(UserDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String msg1 = "";
		String root = Utility.getRoot(); // /moviemovit
		
		//11-1) DB에서 이름과 메일주소가 일치하는 회원에게 아이디 발급
		//dto에는 아이디, 이름, 메일주소가 반환
		dto = dao.findUserID(dto);
		
		//11-2) 메일서버 지정하기
		String mailServer = "mw-002.cafe24.com";
		Properties props = new Properties();
		props.put("mail.smtp.host", mailServer);
		props.put("mail.smtp.auth", "true");
		
		//11-3) 메일 서버에서 인증받은 아이디/비번
		Authenticator myAuth = new MyAuthenticator();
		
		//11-4) 2)과 3)을 통해 실제 존재하는 메일인지 검증
		Session sess = Session.getInstance(props,myAuth);
		
		//11-5) 메일 보내기
		//받는사람, 보내는사람, 제목, 내용
		try {
			req.setCharacterEncoding("UTF-8");
			String to = dto.getEmail();
			String from = "moviemovit_manager@naver.com";
			String subject = dto.getUid().trim() + "님의 아이디를 발송합니다";
			String msgText = "아이디 : " + dto.getUid().trim();
			msgText += " / 해당 아이디로 로그인하시기 바랍니다.";
			
			//엔터 및 특수문자 변경
			msgText = Utility.convertChar(msgText);
			
			//받는사람1 (왼쪽은 배열형태 문법)
			InternetAddress[] address = {new InternetAddress(to)};
			
			Message msg = new MimeMessage(sess);
			
			//받는사람 - 실제 보내고자 하는 사람의 메일주소
			msg.setRecipients(Message.RecipientType.TO, address);
			
			//보내는 사람
			msg.setFrom(new InternetAddress(from));
			
			//메일제목
			msg.setSubject(subject);
			
			//메일 내용
			//내가 지금 보낸 내용을 html형태로 한글이 깨지지않게 보내겠다
			msg.setContent(msgText, "text/html; charset=UTF-8");
			
			//메일 전송
			Transport.send(msg);
			
		} catch (Exception e) {
			System.out.println("아이디 발송 실패 : " + e);
		}//end
		
		if(dto == null) {
			msg1 += "<!DOCTYPE html>";
			msg1 += "<html><body>";
			msg1 += "<script>";
			msg1 += "  alert('아이디 찾기 실패');";
			msg1 += "  history.go(-1);";
			msg1 += "</script>";
			msg1 += "</html></body>";
			mav.addObject("msg", msg1);
			mav.setViewName("msgView");
		}else {			
			msg1 += "<!DOCTYPE html>";
			msg1 += "<html><body>";
			msg1 += "<script>";
			msg1 += "  alert('" + dto.getUname() + " 님에게 메일이 발송되었습니다');";
			msg1 += " location.href='" + root + "/user/loginform.do'";
			msg1 += "</script>";
			msg1 += "</html></body>";
			mav.addObject("msg", msg1);
			mav.setViewName("msgView");
		}//if end
		return mav;
	}//findUserIdProc() end
	
	//12) 비밀번호 찾기 폼
	@RequestMapping(value="/user/findUserPw.do", method = RequestMethod.GET)
	public String findUserPw() {
		return "user/findUserPw";
	}//findUserPw() end
	
	//13) 비밀번호 찾기 처리
	@RequestMapping(value="/user/findUserPwProc.do", method = RequestMethod.POST)
	public ModelAndView findUserPwProc(UserDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String root = Utility.getRoot(); // /moviemovit
		String msg1 = "";
		String uid = "";
		String uname = "";
		String email = "";
		String temPasswd = ""; //임시비밀번호
		int pw_result = 0;
		
		//11-1) DB에서 아이디,이름,메일주소가 일치하는 회원에게 비밀번호 발급
		//dto에는 아이디, 이름, 메일주소, 비밀번호가 반환
		dto = dao.findUserPw(dto);
		
		if(dto != null) {
			//임시 비밀번호 생성
			temPasswd = randomPasswd(8);
			
			//임시 비밀번호 dto에 세팅해서 아래 DB에 전송
			dto.setUpw(temPasswd);
			
			//생성된 임시비밀번호 업데이트
			pw_result = dao.setRandomPw(dto);
		}else {
			System.out.println("비밀번호 찾기 실패");
		}//if end
		
		//11-2) 메일서버 지정하기
		String mailServer = "mw-002.cafe24.com";
		Properties props = new Properties();
		props.put("mail.smtp.host", mailServer);
		props.put("mail.smtp.auth", "true");
		
		//11-3) 메일 서버에서 인증받은 아이디/비번
		Authenticator myAuth = new MyAuthenticator();
		
		//11-4) 2)과 3)을 통해 실제 존재하는 메일인지 검증
		Session sess = Session.getInstance(props,myAuth);
		
		//11-5) 메일 보내기
		//받는사람, 보내는사람, 제목, 내용
		try {
			req.setCharacterEncoding("UTF-8");
			String to = dto.getEmail();
			String from = "moviemovit_manager@naver.com";
			String subject = dto.getUid().trim() + "님의 임시 비밀번호를 발송합니다";
			String msgText = "아이디 : " + dto.getUid().trim();
			msgText += " / 임시 비밀번호 : " + dto.getUpw().trim();
			msgText += "//임시비밀번호로 로그인 후 비밀번호를 변경하시기 바랍니다.";
			
			//엔터 및 특수문자 변경
			msgText = Utility.convertChar(msgText);
			
			//받는사람1 (왼쪽은 배열형태 문법)
			InternetAddress[] address = {new InternetAddress(to)};
			
			Message msg = new MimeMessage(sess);
			
			//받는사람 - 실제 보내고자 하는 사람의 메일주소
			msg.setRecipients(Message.RecipientType.TO, address);
			
			//보내는 사람
			msg.setFrom(new InternetAddress(from));
			
			//메일제목
			msg.setSubject(subject);
			
			//메일 내용
			//내가 지금 보낸 내용을 html형태로 한글이 깨지지않게 보내겠다
			msg.setContent(msgText, "text/html; charset=UTF-8");
			
			//메일 전송
			Transport.send(msg);
			
		} catch (Exception e) {
			System.out.println("비밀번호 발송 실패 : " + e);
		}//end
		
		if(pw_result == 0) {
			msg1 += "<!DOCTYPE html>";
			msg1 += "<html><body>";
			msg1 += "<script>";
			msg1 += "  alert('비밀번호 찾기 실패');";
			msg1 += "  history.go(-1);";
			msg1 += "</script>";
			msg1 += "</html></body>";
			mav.addObject("msg", msg1);
			mav.setViewName("msgView");
		}else {			
			msg1 += "<!DOCTYPE html>";
			msg1 += "<html><body>";
			msg1 += "<script>";
			msg1 += "  alert('" + dto.getUname() + " 님에게 메일이 발송되었습니다');";
			msg1 += " location.href='" + root + "/user/loginform.do'";
			msg1 += "</script>";
			msg1 += "</html></body>";
			mav.addObject("msg", msg1);
			mav.setViewName("msgView");
		}//if end
		return mav;
	}//findUserPwProc() end
	
	  //임시비밀번호 생성 ------------8일차 수업내용 확인 특수문자가 반드시 들어가게!
	  public String randomPasswd(int length) {
	    int index = 0;
	    char[] charSet = new char[] {
	        '0','1','2','3','4','5','6','7','8','9'
	        ,'a','b','c','d','e','f','g','h','i','j','k','l','m'
	        ,'n','o','p','q','r','s','t','u','v','w','x','y','z'
	        ,'A','B','C','D','E','F','G','H','I','J','K','L','M'
	        ,'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
	        ,'!','@','#','$','%','^','&','*'
	    };
	    StringBuffer sb = new StringBuffer();
	    for(int idx=0; idx<length; idx++) {
	      index = (int)(charSet.length * Math.random());
	      sb.append(charSet[index]);
	    }//for end
	    
	    return sb.toString();
	  }//randomPasswd() end
	
}//class end