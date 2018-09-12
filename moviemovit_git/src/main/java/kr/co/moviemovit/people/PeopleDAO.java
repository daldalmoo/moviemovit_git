package kr.co.moviemovit.people;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.moviemovit.coupon.CouponMapper;

@Component
public class PeopleDAO {
	
	@Autowired
	SqlSession sqlSessionl;

	public PeopleDAO() {
		System.out.println("--------PeopleDAO() 객체 생성");
	}//기본생성자
	
	public int create(PeopleDTO dto) {
		PeopleMapper mapper = sqlSessionl.getMapper(PeopleMapper.class);
		int count = mapper.create(dto);
	    return count;
	}//create() end
	
	public ArrayList<PeopleDTO> list() {
		PeopleMapper mapper = sqlSessionl.getMapper(PeopleMapper.class);
		ArrayList<PeopleDTO> list = mapper.list();
		return list;
	}//list
	
	public PeopleDTO read(PeopleDTO dto) {
		PeopleMapper mapper = sqlSessionl.getMapper(PeopleMapper.class);
		dto = mapper.read(dto);
		return dto;
	}//read() end
	
	public int delete(PeopleDTO dto) {
		PeopleMapper mapper = sqlSessionl.getMapper(PeopleMapper.class);
		int count = mapper.delete(dto);
		return count;
	}//delete() end
	
	public int update(PeopleDTO dto) {
		PeopleMapper mapper = sqlSessionl.getMapper(PeopleMapper.class);
		int count = mapper.update(dto);
		return count;
    }//update() end
	
	// 쿠폰 등록&수정시 필요한 회원 아이디 목록 가져오기 select
    public ArrayList<PeopleDTO> peolist() {
        PeopleMapper mapper = sqlSessionl.getMapper(PeopleMapper.class);
        ArrayList<PeopleDTO> list = mapper.peolist();
        return list;
    }//uidlist() end
    	
    // 쿠폰 등록&수정시 검색어와 일치하는 회원 아이디 목록 가져오기 select where
    public ArrayList<PeopleDTO> peosearch(String searchfield) {
    	PeopleMapper mapper = sqlSessionl.getMapper(PeopleMapper.class);
        ArrayList<PeopleDTO> list = mapper.peosearch(searchfield);
        return list;
    }//uidsearch() end
	
	
	

}//class end