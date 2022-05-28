package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import logic.Faq;

public interface FaqMapper {

	@Select("select count(*) from faq where fqid=#{fqid}")
	int count(String fqid);

	@Select("select * from"
			+"(select fqid,question,answer,fqregdate from"
			+"(select * from faq where faqid = #{fqid} order by fqregdate desc")
	List<Faq> list(Map<String, Object> param);

	@Select("select fqid,answer,question,fqregdate from faq where fqid=#{fqid}")
	Faq selectOne(Integer num);

}
