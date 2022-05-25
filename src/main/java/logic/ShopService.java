package logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;

@Service
public class ShopService {

	@Autowired
	UserDao userDao;

	public void userInsert(User user) {
		userDao.signUp(user);
	}

	public User selectUser(String userId) {
		return userDao.selectUser(userId);
	}

	public String userSearch(User user, String url) {
		
		return userDao.search(user,url);
	}

	public void modifyUser(User user) {
		userDao.updateUser(user);		
	}

	public void modifyPwd(String userId, String newpwd1) {
		userDao.updatePwd(userId,newpwd1);		
	}

	public void deleteUser(String userId) {
		userDao.deleteUser(userId);				
	}

	public List<User> userList() {		
		return  userDao.userList();
	}
	
}
