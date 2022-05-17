package logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ItemDao;

@Service
public class ItemService {

	@Autowired
	ItemDao itemDao;
	
	
}
