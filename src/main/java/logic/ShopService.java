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

	public User selectUser(String USER_ID) {
		return userDao.selectUser(USER_ID);
	}

}
