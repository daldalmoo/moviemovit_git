package kr.co.moviemovit.people;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PeopleDAO {
	
	@Autowired
	SqlSession sqlSessionl;

	public PeopleDAO() {
		System.out.println("--------PeopleDAO() 按眉 积己");
	}//扁夯积己磊
	
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
	
	
	

}//class end