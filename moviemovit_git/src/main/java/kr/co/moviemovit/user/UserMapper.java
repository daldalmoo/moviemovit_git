package kr.co.moviemovit.user;

public interface UserMapper {
	/*
		MyBatis3의 매퍼(notice.xml)에 등록되어 있는 id를 인터페이스의 메소드에
		다시 한번 등록함으로써 MyBatis3에서 호출하기 편리하도록 지원함.
		
		★id가 method명으로 와야함.
	 */

	/*회원가입*/
	//<insert id="joinMember">
	public int joinMember(UserDTO dto);
	
	/*아이디 중복확인*/
	//<select id="idCheck">
	public int idCheck(UserDTO dto);
	
	/*이메일 중복확인*/
	//<select id="emailCheck">
	public int emailCheck(UserDTO dto);
	/***************************************************************************/
	/*로그인*/
	//<select id="loginProc">
	public UserDTO loginProc(UserDTO dto);
	
	/*회원정보*/
	//<select id="getMemberInfo">
	public UserDTO getMemberInfo(UserDTO dto);
	
	/*회원탈퇴*/
	//<update id="userDelete">
	public int userDelete(UserDTO dto);
	
	/*회원수정*/
	//<update id="updateMember">
	public int updateMember(UserDTO dto);
	
	/*아이디 찾기*/
	//<select id="findUserID">
	public UserDTO findUserID(UserDTO dto);
	
	/*비밀번호 찾기*/
	//<select id="findUserPw">
	public UserDTO findUserPw(UserDTO dto);
	
	/*임시비밀번호 업데이트*/
	//<update id="setRandomPw">
	public int setRandomPw(UserDTO dto);
}//interface end