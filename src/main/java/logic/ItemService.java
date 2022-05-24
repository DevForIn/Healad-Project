package logic;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.ItemDao;

@Service
public class ItemService {

	@Autowired
	ItemDao itemDao;

	public List<Item> getMenuList(Integer itemCatId) {
		return itemDao.select(itemCatId);
	}

	public Item selectOne(Integer itemId) {
		return itemDao.selectOne(itemId);
	}

	public List<Item> itemList() {
		return itemDao.itemList();
	}

	public List<Item> itemListCat(Integer cat_no) {
		return itemDao.itemListCat(cat_no);
	}
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
		
	public void insertItem(Item item, HttpServletRequest request) {
		if(item.getPicture() != null && !item.getPicture().isEmpty()) {	
			uploadFileCreate(item.getPicture(),request,"img/");
			item.setPictureUrl(item.getPicture().getOriginalFilename());
		}
		itemDao.insertItem(item);		
	}


	public void YNchange(Integer itemId, String useYn) {
		itemDao.YNchange(itemId,useYn);	
	}	
	
}
