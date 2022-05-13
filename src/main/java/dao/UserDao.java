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
	// NamedParameterJdbcTemplate : 스프링 프레임 워크에서 설정한 jdbc 관련 클래스
	private NamedParameterJdbcTemplate template;
	private Map<String,Object> param = new HashMap<String,Object>();
	private RowMapper<User> mapper = new BeanPropertyRowMapper<>(User.class);
	
	@Autowired	// DataSource 객체 주입.
	public void setDataSource(DataSource dataSource) {	// dataSource -> spring_db.xml의  DriverManagerDataSource 객체 
		template = new NamedParameterJdbcTemplate(dataSource);
	}

	public void insert(User user) {
		SqlParameterSource param = new BeanPropertySqlParameterSource(user);
		String sql = "insert into useraccount "
				+ " (userid, password, username, phoneno, postcode, address, email, birthday)"
				+ " values (:userid, :password, :username, :phoneno, :postcode, :address, :email, :birthday)";
		template.update(sql,param);
	}

	public User selectOne(String userid) {
		param.clear();
		param.put("userid", userid);
		// template.queryForObject : 조회되는 레코드 한개 
		// userid의 객체가 User로 전달됨
		return template.queryForObject("select * from useraccount where userid=:userid", param,mapper);
	}
}
