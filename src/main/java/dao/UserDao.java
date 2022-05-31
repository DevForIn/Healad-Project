package dao;

import java.util.HashMap;
import java.util.List;
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

	public String search(User user, String url) {
		param.clear();
		param.put("email", user.getEmail());
		param.put("phoneNo", user.getPhoneNo());
		if(url.equals("id")) {
			param.put("col", "substr(USER_ID,1,length(USER_ID)-4)||'****'");			
		} else if(url.equals("pw")) {
			param.put("userId", user.getUserId());
			param.put("col","'****'||substr(PWD,5,length(PWD)-2)");
		}	
		return template.getMapper(cls).search(param);
	}

	public void updateUser(User user) {
		template.getMapper(cls).updateUser(user);		
	}

	public void updatePwd(String userId, String newpwd1) {
		param.clear();
		param.put("userId", userId);
		param.put("pwd", newpwd1);
		template.getMapper(cls).updatePwd(param);			
	}

	public void deleteUser(String userId) {
		template.getMapper(cls).deleteUser(userId);			
	}

	public List<User> userList() {
		return template.getMapper(cls).userList();
	}

	public void pointAdd(Integer point, String userId) {
		param.clear();
		param.put("userId", userId);
		param.put("Mileage", point);
		template.getMapper(cls).pointAdd(param);
	}	
}
