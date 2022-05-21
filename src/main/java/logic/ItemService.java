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
		// TODO Auto-generated method stub
		return itemDao.select(itemCatId);
	}

	public Item selectOne(Integer itemId) {
		// TODO Auto-generated method stub
		return itemDao.selectOne(itemId);
	}
	
	
}
