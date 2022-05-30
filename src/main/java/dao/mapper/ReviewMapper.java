package dao.mapper;

public interface ReviewMapper {/*
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
