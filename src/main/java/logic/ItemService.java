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

	public List<Item> itemList(Integer pageNum, int limit) {
		return itemDao.itemList(pageNum,limit);
	}

	public List<Item> itemListCat(Integer cat_no) {
		return itemDao.itemListCat(cat_no);
	}
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

	public List<Item> itemUseList(Integer sort) {		
		return itemDao.itemUseList(sort);
	}

	public List<Item> itemCatYN(Integer cat_no, Integer sort) {		
		return itemDao.itemCatYN(cat_no,sort);
	}

	public int count() {
		return itemDao.count();
	}	
	
}
