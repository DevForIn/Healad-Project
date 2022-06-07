package logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReviewDao;

@Service
public class ReviewService {
	
	@Autowired
	ReviewDao reviewDao;
	
	public List<Review> reviewlist(int pageNum, int limit) {
		return reviewDao.list(pageNum, limit);
	}

	public int count() {
		return reviewDao.count();
	}

	public int countByItemId(Integer itemId) {
		return reviewDao.countByItemId(itemId);
	}

	public List<Review> reviewlistByItemId(Integer pageNum, int limit, Integer itemId) {
		return reviewDao.list(pageNum, limit, itemId);
	}

	public List<Review> list(Integer pageNum, int limit) {
		return reviewDao.masterList(pageNum,limit);
	}

	public Review reviewInfo(Integer reviewSeq) {
		return reviewDao.reviewInfo(reviewSeq);
	}

	public void deleteReview(Integer reviewSeq) {
		reviewDao.deleteReview(reviewSeq);
		
	}

	public List<Review> reviewList(String id) {
		return reviewDao.reviewList(id);
	}

}
