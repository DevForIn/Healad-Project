package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	
	@Update("update FAQ set QUESTION=#{QUESTION},ANSWER=#{ANSWER} where FAQ_ID=#{faqId}")
	void updateFaq(Faq faq);

	@Insert("insert into FAQ (FAQ_ID,QUESTION,ANSWER) values (SEQ_FAQ_ID.nextval,#{QUESTION},#{ANSWER})")
	void faqWrite(Faq faq);

	@Select("select * from faq order by FAQ_ID")
	List<Faq> itemFaqList();
}
