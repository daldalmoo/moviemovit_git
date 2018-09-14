package kr.co.moviemovit.qna;

import java.util.ArrayList;




public interface QnaMapper {
	/*
		MyBatis3�� ����(notice.xml)�� ��ϵǾ� �ִ� id�� �������̽��� �޼ҵ忡
		�ٽ� �ѹ� ��������ν� MyBatis3���� ȣ���ϱ� ���ϵ��� ������.
		
		��id�� method������ �;���.
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
