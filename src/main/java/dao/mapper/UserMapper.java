package dao.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.User;

public interface UserMapper {
	
	@Insert("insert into USER_ACCOUNT "
			+ " (USER_ID, PWD, USER_NAME, PHONE_NO, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, BIRTH_DATE,JOIN_DATE,WITHDRAW_YN,WITHDRAW_DATE,Mileage)"
			+ " values (#{userId}, #{pwd}, #{userName}, #{phoneNo}, #{postCode}, #{addr}, #{addrDetail}, #{email}, #{birthDate}, sysdate, 'n', #{withdrawDate}, 0)")
	void signUp(User user);

	@Select("select * from USER_ACCOUNT where USER_ID=#{value}")
	User selectUser(String userid);

	@Select({"<script>",
		"select ${col} from USER_ACCOUNT",
		"<trim prefix='where' prefixOverrides='AND||OR'>"
	  + "<if test='userId != null'> and USER_ID = #{userId}</if>"
	  + " and EMAIL=#{email} and PHONE_NO=#{phoneNo}</trim>",
	  "</script>"})	
	String search(Map<String, Object> param);

}
