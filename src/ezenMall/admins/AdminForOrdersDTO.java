package ezenMall.admins;

public class AdminForOrdersDTO {
	private String oId;
	private String oCustomerId;
	private String oDate;
	private String oPrice;
	private String sumPrice;
	
	public AdminForOrdersDTO() {}

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

	public String getSumPrice() {
		return sumPrice;
	}
	
	public void setSumPrice(String sumPrice) {
		this.sumPrice = sumPrice;
	}
}
