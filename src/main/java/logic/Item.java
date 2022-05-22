package logic;

public class Item {
	private Integer itemId;
	
	private String itemName;
	
	private Integer price;
	
	private String description;
	
	private String pictureUrl;
	
	private String useYn;
	
	private Integer itemCatId;
	
	
	
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public Integer getItemCatId() {
		return itemCatId;
	}
	public void setItemCatId(Integer itemCatId) {
		this.itemCatId = itemCatId;
	}
	
	
}
