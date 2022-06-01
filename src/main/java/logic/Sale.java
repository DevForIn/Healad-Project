package logic;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class Sale {
	
	private Long saleId;
	private String userId;
	private Date saleDate;
	private String saleUserName;
	private String salePostCode;
	private String saleAddr;
	private String saleAddrDetail;
	private String remark;	
	private List<SaleItem> itemList = new ArrayList<SaleItem>();

	
	public int getTotal() {
		int sum=0;
		for(SaleItem si : itemList) {
			sum+= si.getItem().getPrice() * si.getQuantity();
		}
		return sum;
	}
	
	public List<SaleItem> getItemList() {
		return itemList;
	}
	public void setItemList(List<SaleItem> itemList) {
		this.itemList = itemList;
	}
	public Long getSaleId() {
		return saleId;
	}
	public void setSaleId(Long saleId) {
		this.saleId = saleId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getSaleDate() {
		return saleDate;
	}
	public void setSaleDate(Date saleDate) {
		this.saleDate = saleDate;
	}
	public String getSaleUserName() {
		return saleUserName;
	}
	public void setSaleUserName(String saleUserName) {
		this.saleUserName = saleUserName;
	}
	public String getSalePostCode() {
		return salePostCode;
	}
	public void setSalePostCode(String salePostCode) {
		this.salePostCode = salePostCode;
	}
	public String getSaleAddr() {
		return saleAddr;
	}
	public void setSaleAddr(String saleAddr) {
		this.saleAddr = saleAddr;
	}
	public String getSaleAddrDetail() {
		return saleAddrDetail;
	}
	public void setSaleAddrDetail(String saleAddrDetail) {
		this.saleAddrDetail = saleAddrDetail;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
