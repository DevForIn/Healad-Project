package logic;

public class SaleItem {
	
	private Long saleItemId;
	private Long saleId;
	private Integer itemId;
	private Integer quantity;
	private Integer price;
	
	public Long getSaleItemId() {
		return saleItemId;
	}
	public void setSaleItemId(Long saleItemId) {
		this.saleItemId = saleItemId;
	}
	public Long getSaleId() {
		return saleId;
	}
	public void setSaleId(Long saleId) {
		this.saleId = saleId;
	}
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	
	
}
