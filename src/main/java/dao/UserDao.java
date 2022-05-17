package dao;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import logic.User;

@Repository
public class UserDao {
	private NamedParameterJdbcTemplate template;
	private Map<String,Object> param = new HashMap<String,Object>();
	private RowMapper<User> mapper = new BeanPropertyRowMapper<>(User.class);
	
	@Autowired	
	public void setDataSource(DataSource dataSource) {	 
		template = new NamedParameterJdbcTemplate(dataSource);
	}

	public void signUp(User user) {
		SqlParameterSource param = new BeanPropertySqlParameterSource(user);
		String sql = "insert into USER_ACCOUNT "
				+ " (USER_ID, PWD, USER_NAME, PHONE_NO, POST_CODE, ADDR, ADDR_DETAIL, EMAIL, BIRTH_DATE,JOIN_DATE,WITHDRAW_YN,WITHDRAW_DATE,Mileage)"
				+ " values (:USER_ID, :PWD, :USER_NAME, :PHONE_NO, :POST_CODE, :ADDR, :ADDR_DETAIL, :EMAIL, :BIRTH_DATE,sysdate,'N',:WITHDRAW_DATE,0)";
		template.update(sql,param);
	}
}
