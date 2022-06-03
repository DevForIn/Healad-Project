package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import logic.Faq;

public interface FaqMapper {

	@Select("select * from FAQ order by FAQ_ID")
	List<Faq> faqlist();

	@Select("select * from FAQ where FAQ_ID=#{faqId}")
	Faq faqInfo(Integer faqId);
}
