package logic;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	
	public int boardcount(String boardid) {
		return boardDao.count(boardid);
	}
	public List<Board> boardlist(Integer pageNum, int limit, String boardid) {
		return boardDao.list(pageNum,limit,boardid);
	}
	//board : 화면에서 입력한 파라미터정보, 업로드된 파일의 내용
	public void boardwrite(Board board, HttpServletRequest request) {
		//파일 업로드
		if(board.getFile1() != null && !board.getFile1().isEmpty()) { //업로드된 파일이 존재.
			uploadFileCreate(board.getFile1(),request,"board/file/"); //파일 업로드
			board.setFileurl(board.getFile1().getOriginalFilename()); 
		}
		//db에 insert
		boardDao.write(board);
		
	}
	public Board getBoard(Integer num) {
		return boardDao.selectOne(num);
	}

	public void readcntadd(Integer num) {
		boardDao.readcntadd(num);
		
	}	
	public void boardUpdate(Board board,HttpServletRequest request) {
		if(board.getFile1() != null && !board.getFile1().isEmpty()) { //첨부파일이 수정된 경우
			uploadFileCreate(board.getFile1(),request,"board/file/"); //파일 업로드
			board.setFileurl(board.getFile1().getOriginalFilename());
		}
		boardDao.update(board);
	}

	public void boardReply(Board board) {
		boardDao.grpStepAdd(board);
		boardDao.reply(board);
		
	}

	public void boardDelete(int num) {
		boardDao.delete(num);
		
	}

	
}
