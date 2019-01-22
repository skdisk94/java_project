package ezenMall.orders;

public class OrdersDTO {
	private String oId;
	private String oCustomerId;
	private String oDate;
	private String oPrice;
	
	public String getoId() {
		return oId;
	}
	public void setoId(String oId) {
		this.oId = oId;
	}
	public String getoCustomerId() {
		return oCustomerId;
	}
	public void setoCustomerId(String oCustomerId) {
		this.oCustomerId = oCustomerId;
	}
	public String getoDate() {
		return oDate;
	}
	public void setoDate(String oDate) {
		this.oDate = oDate;
	}
	public String getoPrice() {
		return oPrice;
	}
	public void setoPrice(String oPrice) {
		this.oPrice = oPrice;
	}
	
}
