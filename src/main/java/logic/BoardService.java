package logic;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.NoticeDao;

@Service
public class BoardService {
	
	@Autowired
	NoticeDao noticeDao;

	private void uploadFileCreate(MultipartFile file, HttpServletRequest request, String upath) {
		// 업르도된 파일의 원래 이름 
		String orgFile = file.getOriginalFilename();
		// 업로드 될 폴더의 절대 경로 - 
		String uploadPath = request.getServletContext().getRealPath("/")+upath;
		File fpath = new File(uploadPath);
		if(!fpath.exists()) fpath.mkdirs();	
		try {
			// transferTo : file(업로드되는 파일내용)을 업로드폴더의 원래파일이름으로 저장
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
	
}
