package logic;

public class Item {
	private Long itemId;
	
	private String itemName;
	
	private Long price;
	
	private String description;
	
	private String pictureUrl;
	
	private String useYn;
	
	private Integer itemCatId;
	
	public Long getItemId() {
		return itemId;
	}
	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
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
