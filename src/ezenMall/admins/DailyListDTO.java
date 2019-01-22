package ezenMall.admins;

public class DailyListDTO {
	private String customerId;
	private String date;
	private String pName;
	private String unitPrice;
	private String quantity;
	private String orderId;
	private String sumPrice;
	private String pId;
	private String pSumPrice;
	
	public DailyListDTO() {}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getSumPrice() {
		return sumPrice;
	}

	public void setSumPrice(String sumPrice) {
		this.sumPrice = sumPrice;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getpSumPrice() {
		return pSumPrice;
	}

	public void setpSumPrice(String pSumPrice) {
		this.pSumPrice = pSumPrice;
	}

	@Override
	public String toString() {
		return customerId + "\t\t" + date + "\t" + pName + "\t" + unitPrice + "\t\t" + quantity + "\t\t" + orderId + "\t" + sumPrice;
	}
	
	public String toString2() {
		return date+"\t"+pId+"\t"+pName+"\t"+unitPrice+"\t\t"+quantity+"\t\t"+pSumPrice;
	}
}
