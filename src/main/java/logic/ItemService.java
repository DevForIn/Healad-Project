package logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
}
