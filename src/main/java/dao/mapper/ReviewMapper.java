package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import logic.Review;

public interface ReviewMapper {

	@Select("select * from (select rownum rnum,REVIEW_SEQ, ITEM_NAME, USER_ID, ITEM_ID, RV_SUBJECT, RV_CONTENT, RV_FILE_URL, RV_IP, SCORE, RV_REG_DATE, RV_UPDT_DATE, RV_CHECK "
			+ " from (select r.*, i.item_name from review r, item i where r.item_id = i.item_id order by review_seq))"
			+ " where rnum >= #{start} and rnum <= #{end}")
	List<Review> list(Map<String, Object> param);
	
	
	
	/*
	@Select("select count(*) from board where rvid=#{rvid}")
	int count(String boardid);
	
	@Select("select * from"
			+"(select rownum rnum, num, userid, rvsubject, rvcontent, rvfile fileurl, rvregdate,"
			+"pwd,rvreadcnt from"
			+"(select * from board where rvid = #{rvid}))"
			+"where rnum >= #{startrow} and rnum <= #{endrow}")
	List<Review> list(Map<String, Object> param);

	
	@Insert("insert into review"
			+" (num,userid,pwd,rvsubject,rvcontent,rvfile,rvregdate,rvreadcnt,rvid,ip)"
			+" values (#{num},#{userid},#{pwd},#{rvsubject},#{rvcontent},#{fileurl},sysdate,"
			+"0,#{rvid},#{ip})")
	void write(Review review);

	@Select("select nvl(max(num),0) from review")
	int maxNum();
	
	@Select("select num,writer,subject,content,file1 fileurl,regdate,"
				+"grp,grplevel,grpstep,pass,readcnt,boardid from review")
	Review selectOne(Integer num);

	@Update("update review set rvreadcnt = rvreadcnt+1")
	void readcntadd(Integer num);

	@Update("update review set userid=#{userid}, rvsubject=#{rvsubject}, rvcontent=#{rvcontent},"
				+ "rvfile=#{fileurl}")
	void update(Review review);

	@Update("update review set grpstep = grpstep+1 "
				+ "where grp=#{grp} and grpstep > #{grpstep}")
	void grpStepAdd(Review review);

	@Insert("insert into review"
				+" (num,userid,pwd,rvsubject,rvcontent,rvfile,rvregdate,rvreadcnt,rvid,ip)"
				+" values (#{num},#{userid},#{pwd},#{rvsubject},#{rvcontent},#{fileurl},sysdate,"
				+"0,#{rvid},#{ip})")
	void reply(Review review);

	@Delete("delete from review")
	void delete(int num);

*/
}
