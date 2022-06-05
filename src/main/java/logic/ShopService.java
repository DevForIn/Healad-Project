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

	public List<User> userList(Integer pageNum, int limit) {		
		return  userDao.userList(pageNum,limit);
	}
	public void pointAdd(String mileage, String userId) {
		userDao.pointAdd(mileage,userId);	
		
	}

	public int count() {
		return userDao.count();
	}

	public int outCount() {
		return userDao.outCount();
	}

	public List<User> outuserList(Integer outpageNum, int limit) {
		return  userDao.outuserList(outpageNum,limit);
	}

	public List<User> userListsort(Integer pageNum, int limit, Integer sort) {
		return  userDao.userListsort(pageNum,limit,sort);
	}
	
}
