package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ReviewMapper;
import logic.Review;

@Repository
public class ReviewDao {
	
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<String,Object>();
	private Class<ReviewMapper> cls = ReviewMapper.class;
	
	
	public List<Review> list(int pageNum, int limit) {
		param.clear();
		int start = (pageNum - 1) * limit +1;
		int end = start + limit -1;
		param.put("start", start);
		param.put("end", end);
		return template.getMapper(cls).list(param);
	}
	
	
	
	/*
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<String,Object>();
	private Class<ReviewMapper> cls = ReviewMapper.class;
	
	public int count(String rvid) {
		return template.getMapper(cls).count(rvid);
	}
	public List<Review> list(Integer pageNum, int limit, String rvid) {
		param.clear();
		int startrow = (pageNum - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		param.put("startrow", startrow);
		param.put("endrow", endrow);
		param.put("rvid", rvid);
		return template.getMapper(cls).list(param);
	}
	public void write(Review review) {
		int num = maxNum() +1; 
		review.setNum(num);
		
		template.getMapper(cls).write(review);
	}
	private int maxNum() {
		return template.getMapper(cls).maxNum();
	}
	public Review selectOne(Integer num) {
		return template.getMapper(cls).selectOne(num);
	}
	public void readcntadd(Integer num) {
		template.getMapper(cls).readcntadd(num);
	}
	public void update(Review review) {
		template.getMapper(cls).update(review);
		
	}
	public void grpStepAdd(Review review) {
		template.getMapper(cls).grpStepAdd(review);
		
	}
	public void reply(Review review) {
		review.setNum(maxNum()+1);
		review.setGrplevel(review.getGrplevel()+1);
		review.setGrpstep(review.getGrpstep()+1); 
		template.getMapper(cls).reply(review);
		
	}
	
	public void delete(int num) {
		template.getMapper(cls).delete(num);
		
	}
*/
}
