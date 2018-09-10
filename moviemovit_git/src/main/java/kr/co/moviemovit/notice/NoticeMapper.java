package kr.co.moviemovit.notice;

import java.util.ArrayList;


public interface NoticeMapper {
	/*
		MyBatis3의 매퍼(notice.xml)에 등록되어 있는 id를 인터페이스의 메소드에
		다시 한번 등록함으로써 MyBatis3에서 호출하기 편리하도록 지원함.
		
		★id가 method명으로 와야함.
	*/
	
	//<insert id="create">
	public int create(NoticeDTO dto);
	
	//<select id="list" resultType="NoticeDTO">
	public ArrayList<NoticeDTO> list(NoticePage noticepage);

	public int listCnt();
	
	//<select id="read" parameterType="NoticeDTO" resultType="NoticeDTO">
	public NoticeDTO read(NoticeDTO dto);

	//<delete id="delete" parameterType="NoticeDTO">
	public int delete(NoticeDTO dto);
	
	//<update id="update" parameterType="NoticeDTO">
	public int update(NoticeDTO dto);
}//interface end
