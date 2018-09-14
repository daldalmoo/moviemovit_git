package kr.co.moviemovit.qna;

import java.util.ArrayList;




public interface QnaMapper {
	/*
		MyBatis3의 매퍼(notice.xml)에 등록되어 있는 id를 인터페이스의 메소드에
		다시 한번 등록함으로써 MyBatis3에서 호출하기 편리하도록 지원함.
		
		★id가 method명으로 와야함.
	*/
  //<select id="groupNoMax" resultType="int">
  public int groupNoMax();
	
	//<insert id="create">
	public int create(QnaDTO dto);
	
	//<select id="list" resultType="NoticeDTO">
	public ArrayList<QnaDTO> list(QnaPage qnapage);

	public int listCnt();
	
	//<select id="read" parameterType="NoticeDTO" resultType="NoticeDTO">
	public QnaDTO read(QnaDTO dto);

	//<delete id="delete" parameterType="NoticeDTO">
	public int delete(QnaDTO dto);
	
	//<update id="update" parameterType="NoticeDTO">
	public int update(QnaDTO dto);
	
	//<select id="groupNoList" parameterType="int" resultType="QnaDTO">
	public ArrayList<QnaDTO> groupNoList(QnaDTO dto);
	
	//<update id="groupNumUpdate" parameterType="int">
	public int groupNumUpdate(int GNpoint);
	
	
}//interface end
