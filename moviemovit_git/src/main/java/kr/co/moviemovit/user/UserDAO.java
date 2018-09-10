package kr.co.moviemovit.user;

import javax.jws.soap.SOAPBinding.Use;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public UserDAO() {
		System.out.println("---UserDAO() 객체생성");
	}//기본생성자 

	/*비즈니스 로직*/
	
	//1) 회원가입 insert
	public int joinMember(UserDTO dto) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int result = mapper.joinMember(dto);
		return result;
	}//joinMember() end
	
	//2) 아이디 중복확인
	public int idCheck(UserDTO dto) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		//id_result의 값이 1이면 중복아이디
		int id_result = mapper.idCheck(dto);
		return id_result;
	}//idCheck() end
	
	//3) 이메일 중복확인
	public int emailCheck(UserDTO dto) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		//em_result의 값이 1이면 중복아이디
		int em_result = mapper.emailCheck(dto);
		return em_result;
	}//emailCheck() end

	/***************************************************************************/
	//1) 로그인
	public UserDTO loginProc(UserDTO dto) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		//loginGrade의 값이 회원등급
		UserDTO loginGrade = mapper.loginProc(dto);
		return loginGrade;
	}//loginProc() end
	
	//2) 회원정보 read
	public UserDTO getMemberInfo(UserDTO dto) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		dto = mapper.getMemberInfo(dto);
		return dto;
	}//getMemberInfo() end
	
	//3) 회원 탈퇴
	public int userDelete(UserDTO dto) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		//check의 값이 1이면 삭제할 회원 존재
		int check = mapper.userDelete(dto);
		return check;
	}//userDelete() end
	
	//4) 회원수정
	public int updateMember(UserDTO dto) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int result = mapper.updateMember(dto);
		return result;
	}//updateMember() end
	
	//5) 아이디 찾기
	public UserDTO findUserID(UserDTO dto) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		dto = mapper.findUserID(dto);
		return dto;
	}//findUserID() end
	
	//6) 비밀번호 찾기
	public UserDTO findUserPw(UserDTO dto) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		dto = mapper.findUserPw(dto);
		return dto;
	}//findUserPw() end
	
	//7) 생성된 임시비밀번호 업데이트
	public int setRandomPw(UserDTO dto) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int pw_result = mapper.setRandomPw(dto);
		return pw_result;
	}//setRandomPw() end
}//class end
