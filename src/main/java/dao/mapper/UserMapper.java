package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.User;

public interface UserMapper {
	
	@Insert("insert into USER_ACCOUNT "
			+ " (USER_ID, PWD, USER_NAME, PHONE_NO, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, BIRTH_DATE,JOIN_DATE,WITHDRAW_YN,WITHDRAW_DATE,Mileage)"
			+ " values (#{USER_ID}, #{PWD}, #{USER_NAME}, #{PHONE_NO}, #{POST_CODE}, #{ADDR}, #{ADDR_DETAIL}, #{EMAIL}, #{BIRTH_DATE}, sysdate, 'N', #{WITHDRAW_DATE}, 0})")
	void signUp(User user);

	@Select("select * from USER_ACCOUNT where USER_ID=#{value}")
	User selectUser(String userid);

}
