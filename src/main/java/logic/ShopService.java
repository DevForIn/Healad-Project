package logic;


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

}
