package logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CartDao;
import dao.ItemDao;
import dao.SaleDao;
import dao.SaleItemDao;

@Service
public class SaleService {

	@Autowired
	SaleDao saleDao;
	
	@Autowired
	SaleItemDao saleItemDao;
	
	@Autowired
	CartDao cartDao;
	
	@Autowired
	ItemDao itemDao;
	
	public void purchase(List<Cart> items, Sale sale, String userId) {
		// sale 데이터 등록
		long saleId = saleDao.selectSeq();
		sale.setSaleId(saleId);
		sale.setUserId(userId);
		saleDao.insert(sale);
		
		// sale_item 데이터 등록
		for(Cart item : items) {
			SaleItem saleItem = new SaleItem();
			saleItem.setSaleId(saleId);
			saleItem.setQuantity(item.getQuantity());
			saleItem.setPrice(item.getPrice() * item.getQuantity());
			saleItem.setItemId(item.getItemId());
			saleItemDao.insert(saleItem);
		}
		
		// cart 삭제
		cartDao.deleteByUserId(userId);
		
	}

	public void purchase(Cart cart, Sale sale, String userId) {
		// sale 데이터 등록
		long saleId = saleDao.selectSeq();
		sale.setSaleId(saleId);
		sale.setUserId(userId);
		saleDao.insert(sale);
		
		Item item = itemDao.selectOne(cart.getItemId());
		
		// sale_item 데이터 등록
		SaleItem saleItem = new SaleItem();
		saleItem.setSaleId(saleId);
		saleItem.setQuantity(cart.getQuantity());
		saleItem.setPrice(item.getPrice() * cart.getQuantity());
		saleItem.setItemId(cart.getItemId());
		saleItemDao.insert(saleItem);
	}

}
