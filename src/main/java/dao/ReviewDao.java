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


	public int count() {
		return template.getMapper(cls).count();
	}


	public int countByItemId(Integer itemId) {
		return template.getMapper(cls).countByItemId(itemId);
	}


	public List<Review> list(Integer pageNum, int limit, Integer itemId) {
		param.clear();
		int start = (pageNum - 1) * limit +1;
		int end = start + limit -1;
		param.put("start", start);
		param.put("end", end);
		param.put("itemId", itemId);
		return template.getMapper(cls).list(param);
	}


	public List<Review> masterList(Integer pageNum, int limit) {
		param.clear();
		int start = (pageNum - 1) * limit +1;
		int end = start + limit -1;
		param.put("start", start);
		param.put("end", end);
		return template.getMapper(cls).masterList(param);
	}


	public Review reviewInfo(Integer reviewSeq) {
		return template.getMapper(cls).reviewInfo(reviewSeq);
	}


	public void deleteReview(Integer reviewSeq) {
		template.getMapper(cls).deleteReview(reviewSeq);
	}


	public List<Review> reviewList(String id) {
		return template.getMapper(cls).reviewList(id); 
	}
	
	
	

}
