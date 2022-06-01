package logic;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.NoticeDao;

@Service
public class BoardService {
	
	@Autowired
	NoticeDao noticeDao;

	private void uploadFileCreate(MultipartFile file, HttpServletRequest request, String upath) {
		String orgFile = file.getOriginalFilename();
		String uploadPath = request.getServletContext().getRealPath("/")+upath;
		File fpath = new File(uploadPath);
		if(!fpath.exists()) fpath.mkdirs();	
		try {
			file.transferTo(new File(uploadPath + orgFile));
		} catch(Exception e) {
			e.printStackTrace();
		}		
	}
	
	public void noticeWrite(Notice notice, HttpServletRequest request) {
		if(notice.getNoFile() != null && !notice.getNoFile().isEmpty()) {	
			uploadFileCreate(notice.getNoFile(),request,"board/file/");
			notice.setNoFileUrl(notice.getNoFile().getOriginalFilename());
		}
		noticeDao.write(notice);		
	}

	public int count() {
		return noticeDao.count();
	}

	public List<Notice> noticelist(Integer pageNum, int limit) {
		return noticeDao.noticelist(pageNum,limit);
	}

	public Notice noticeInfo(Integer num) {	
		return noticeDao.Info(num);
	}

	public void cntAdd(Integer num) {
		noticeDao.cntAdd(num);		
	}

	public int selectCount(String column, String find) {
		return noticeDao.selectCount(column,find);
	}

	public List<Notice> selectlist(Integer pageNum, int limit, String column, String find) {
		return noticeDao.selectlist(pageNum,limit,column,find);
	}


	public void updateNotice(Notice notice, HttpServletRequest request) {
		if(notice.getNoFile() != null && !notice.getNoFile().isEmpty()) {	
			uploadFileCreate(notice.getNoFile(),request,"board/file/");
			notice.setNoFileUrl(notice.getNoFile().getOriginalFilename());
		}
		noticeDao.updateNotice(notice);		
	}
	
}
