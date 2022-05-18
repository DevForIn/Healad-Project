package dao;

import java.util.HashMap;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import dao.mapper.UserMapper;
import logic.User;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<String,Object>();
	private Class<UserMapper> cls = UserMapper.class; 


	public void signUp(User user) {
		template.getMapper(cls).signUp(user);
	}

	public User selectUser(String userid) {
		return template.getMapper(cls).selectUser(userid);
	}
	
}
