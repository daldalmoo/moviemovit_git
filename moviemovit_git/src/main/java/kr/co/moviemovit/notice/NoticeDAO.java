package kr.co.moviemovit.notice;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class NoticeDAO {

	//@Autowired
	//DbOpen dbopen;
	
	//root-context.xml의 <bean id="sqlSession" ~>
	@Autowired
	SqlSession sqlSession;
	
	public NoticeDAO() {
		System.out.println("---NoticeDAO() 객체 생성");
	}//기본생성자
	
	/*비즈니스 로직*/
	public int create(NoticeDTO dto) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		int count = mapper.create(dto);
		return count;
	}//crate() end
	
	public ArrayList<NoticeDTO> list(NoticePage noticepage) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		ArrayList<NoticeDTO> list = mapper.list(noticepage);
		return list;
	}//list () end
	
	public int listCnt() {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		int  listCnt = mapper.listCnt();
		return listCnt;
	}//crate() end

	public NoticeDTO read(NoticeDTO dto) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		dto = mapper.read(dto);
		return dto;
	}//read () end
	
	public int delete(NoticeDTO dto) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		int cnt = mapper.delete(dto);
		return cnt;
	}//delete () end
	
	public int update(NoticeDTO dto) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		int cnt = mapper.update(dto);
		return cnt;
	}//update () end
	
}//class end
