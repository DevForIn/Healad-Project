package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.User;

public interface UserMapper {
	
	@Insert("insert into USER_ACCOUNT "
			+ " (USER_ID, PWD, USER_NAME, PHONE_NO, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, BIRTH_DATE,JOIN_DATE,WITHDRAW_YN,WITHDRAW_DATE,Mileage)"
			+ " values (#{userId}, #{pwd}, #{userName}, #{phoneNo}, #{postCode}, #{addr}, #{addrDetail}, #{email}, #{birthDate}, sysdate, 'N', #{withdrawDate}, 0)")
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

	@Update("update USER_ACCOUNT "
	+ " set USER_NAME=#{userName}, PHONE_NO=#{phoneNo}, POST_CODE=#{postCode}, "
	+ " ADDR=#{addr}, ADDR_DETAIL=#{addrDetail}, EMAIL=#{email}, BIRTH_DATE=#{birthDate} "
	+ " where USER_ID = #{userId}")
	void updateUser(User user);

	@Update("update USER_ACCOUNT set PWD=#{pwd} where USER_ID = #{userId}")
	void updatePwd(Map<String, Object> param);

	@Update("update USER_ACCOUNT set "
	+ " PWD=null, USER_NAME=null, PHONE_NO=null, POST_CODE=null, ADDR=null, ADDR_DETAIL=null, "
	+ " EMAIL=null, BIRTH_DATE=null,JOIN_DATE=null,WITHDRAW_YN='Y',WITHDRAW_DATE=sysdate,Mileage=null "
	+ " where USER_ID = #{userId}")
	void deleteUser(String userId);

	@Update("update USER_ACCOUNT set Mileage=Mileage+#{Mileage} where USER_ID = #{userId}")
	void pointAdd(Map<String, Object> param);

	@Select("select count(*) from USER_ACCOUNT where WITHDRAW_YN = 'N'")
	int count();
	
	@Select("select * from ( select rownum rnum,USER_ID,PWD,USER_NAME,PHONE_NO,POST_CODE,"
		+ " ADDR,ADDR_DETAIL,EMAIL,BIRTH_DATE,WITHDRAW_YN,WITHDRAW_DATE,JOIN_DATE,MILEAGE "
		+ " from (select * from USER_ACCOUNT where WITHDRAW_YN = 'N' and USER_ID != 'admin' order by JOIN_DATE)) "
		+ " where rnum >= #{start} and rnum <= #{end}")
	List<User> userList(Map<String, Object> param);

	@Select("select count(*) from USER_ACCOUNT where WITHDRAW_YN = 'Y'")
	int outCount();
	
	@Select("select * from ( select rownum rnum,USER_ID,WITHDRAW_DATE "
			+ " from (select * from USER_ACCOUNT where WITHDRAW_YN = 'Y')) "
			+ " where rnum >= #{start} and rnum <= #{end}")
	List<User> outuserList(Map<String, Object> param);

	@Select("select * from ( select rownum rnum,USER_ID,PWD,USER_NAME,PHONE_NO,POST_CODE,"
			+ " ADDR,ADDR_DETAIL,EMAIL,BIRTH_DATE,WITHDRAW_YN,WITHDRAW_DATE,JOIN_DATE,MILEAGE "
			+ " from (select * from USER_ACCOUNT where WITHDRAW_YN = 'N' and USER_ID != 'admin' order by MILEAGE ${odb})) "
			+ " where rnum >= #{start} and rnum <= #{end}")
	List<User> userListsort(Map<String, Object> param);
}
