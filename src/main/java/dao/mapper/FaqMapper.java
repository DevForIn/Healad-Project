package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import logic.Faq;

public interface FaqMapper {

	@Select("select * from (select rownum rnum,FAQ_ID,QUESTION,ANSWER from (select * from FAQ order by FAQ_ID))"
		+ " where rnum >= #{startrow} and rnum <= #{endrow}")
	List<Faq> faqlist(Map<String, Object> param);

	@Select("select * from FAQ where FAQ_ID=#{faqId}")
	Faq faqInfo(Integer faqId);

	@Select("select count(*) from FAQ")
	int faqCount();

	@Delete("delete from FAQ where FAQ_ID = #{value}")
	void deleteFaq(Integer faqId);
}
