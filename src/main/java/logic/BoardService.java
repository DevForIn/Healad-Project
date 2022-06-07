package logic;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.FaqDao;
import dao.NoticeDao;

@Service
public class BoardService {
	
	@Autowired
	NoticeDao noticeDao;
	
	@Autowired
	FaqDao faqDao;

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

	public List<Faq> fqalist(Integer pageNum, int limit) {
		return faqDao.fqalist(pageNum,limit);
	}

	public Faq faqInfo(Integer faqId) {
		return faqDao.faqInfo(faqId);
	}

	public int faqCount() {
		return faqDao.faqCount();
	}


	public void deleteFaq(Integer faqId) {
		faqDao.deleteFaq(faqId);
		
	}

	public void deleteNotice(Integer noticeId) {
		noticeDao.deleteNotice(noticeId);
		
	}

	public void updateFaq(Faq faq) {
		faqDao.updateFaq(faq);
		
	}

	public void faqWrite(Faq faq) {
		faqDao.faqWrite(faq);
	}

	public List<Faq> itemFaqList() {
		return faqDao.itemFaqList();
	}

}
