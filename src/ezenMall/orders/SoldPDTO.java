package ezenMall.orders;

public class SoldPDTO {
	private String sOrderId;
	private String sProductId;
	private String sQuantity;
	
	public String getsOrderId() {
		return sOrderId;
	}
	public void setsOrderId(String sOrderId) {
		this.sOrderId = sOrderId;
	}
	public String getsProductId() {
		return sProductId;
	}
	public void setsProductId(String sProductId) {
		this.sProductId = sProductId;
	}
	public String getsQuantity() {
		return sQuantity;
	}
	public void setsQuantity(String sQuantity) {
		this.sQuantity = sQuantity;
	}
	
}
