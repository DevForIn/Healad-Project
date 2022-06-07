package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import logic.Review;

public interface ReviewMapper {

	//"<if test='itemId' != null > and item_id = #{itemId} </if>
	@Select({"<script>",
		"select a.rnum, a.review_seq, a.item_name, a.user_id, a.item_id, a.rv_subject, a.rv_content, a.RV_FILE_URL, a.RV_IP, a.SCORE, a.RV_REG_DATE, a.RV_UPDT_DATE, a.RV_CHECK "
		    + " from (select rownum rnum,REVIEW_SEQ, ITEM_NAME, USER_ID, ITEM_ID, RV_SUBJECT, RV_CONTENT, RV_FILE_URL, RV_IP, SCORE, RV_REG_DATE, RV_UPDT_DATE, RV_CHECK "
			+ " from (select r.*, i.item_name from review r, item i "
			+ " where r.item_id = i.item_id ",
			"<if test='itemId != null' > and i.item_id = #{itemId}</if>",
			" order by review_seq)) a where rnum >= #{start} and rnum &lt;= #{end}",
	 "</script>"})
	List<Review> list(Map<String, Object> param);

	@Select("select count(*) from review")
	int count();


	@Select("select count(*) from review where item_id = #{itemId}")
	int countByItemId(Integer itemId);

	@Select("select * from (select rownum rnum,review_seq, user_id, item_id, rv_subject, "
			+ " rv_content,rv_file_url,rv_ip,score,rv_reg_date,rv_updt_date,"
			+ " rv_check from (select * from review order by review_seq))"
			+ "  where rnum >= #{start} and rnum <= #{end}")
	List<Review> masterList(Map<String, Object> param);

	@Select("select * from REVIEW where REVIEW_SEQ=#{reviewSeq}")
	Review reviewInfo(Integer reviewSeq);

	@Delete("delete from REVIEW where REVIEW_SEQ=#{reviewSeq}")
	void deleteReview(Integer reviewSeq);

	@Select("select * from REVIEW where USER_ID=#{id}")
	List<Review> reviewList(String id);
	
}
