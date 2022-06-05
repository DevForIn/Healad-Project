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

	public List<Sale> saleList(String id) {
		// 사용자 id에 해당하는 주문 목록
		List<Sale> list = saleDao.list(id);
		for(Sale sl : list) {
			List<SaleItem> saleitemlist = saleItemDao.list(sl.getSaleId());
			for(SaleItem slit : saleitemlist) {
				Item item = itemDao.selectOne(slit.getItemId()); // 주문상품의 상품데이터(item) 조회
				slit.setItem(item);
			}
			sl.setItemList(saleitemlist);
		}
		return list;
	}

	public List<Item> getSaleItemsRank() {
		return saleItemDao.getSaleItemsRank();
	}

	public List<Sale> allList(Integer pageNum, int limit) {
		return saleItemDao.allList(pageNum,limit);
	}

	public int count() {
		return saleItemDao.count();
	}

}
