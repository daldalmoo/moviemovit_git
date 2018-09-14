package kr.co.moviemovit.qna;

import java.util.ArrayList;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Component;

import kr.co.moviemovit.notice.NoticeDTO;
import kr.co.moviemovit.notice.NoticeMapper;

@Component
public class QnaDAO {

	//@Autowired
	//DbOpen dbopen;
	
	//root-context.xml의 <bean id="sqlSession" ~>
	@Autowired
	SqlSession sqlSession;
	
	public QnaDAO() {
		System.out.println("---NoticeDAO() 객체 생성");
	}//기본생성자
	
	/*비즈니스 로직*/
	public int groupNoMax() {
	  QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
    int count = mapper.groupNoMax();
    return count;
	}//groupNoMax()
	
	public int create(QnaDTO dto) {
		QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
		int count = mapper.create(dto);
		return count;
	}//crate() end
	
	public ArrayList<QnaDTO> list(QnaPage qnapage) {
		QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
		ArrayList<QnaDTO> list = mapper.list(qnapage);
		return list;
	}//list () end
	
	public int listCnt() {
		QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
		int listCnt = mapper.listCnt();
		return listCnt;
	}//crate() end

	public QnaDTO read(QnaDTO dto) {
		QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
		dto = mapper.read(dto);
		return dto;
	}//read () end
	
	public int delete(QnaDTO dto) {
		QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
		int cnt = mapper.delete(dto);
		return cnt;
	}//delete () end
	
	public int update(QnaDTO dto) {
		QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
		int cnt = mapper.update(dto);
		return cnt;
	}//update () end
	
	public ArrayList<QnaDTO> groupNoList(QnaDTO dto) {
	  QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
	  ArrayList<QnaDTO> list = mapper.groupNoList(dto);
    return list;
	}//groupNoList() end
	
	public int groupNumUpdate(int GNpoint) {
	  QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
    int cnt = mapper.groupNumUpdate(GNpoint);
    return cnt;
	}//groupNoList() end
  
    
}//class end
