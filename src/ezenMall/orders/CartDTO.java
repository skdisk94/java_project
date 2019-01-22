package ezenMall.orders;

public class CartDTO {
	private String cId;
	private String pId;
	private String pName;
	private String imgName;
	private String description;
	private String unitPrice;
	private String quantity;
	private int sum;
	
	public CartDTO() {}
	
	public CartDTO(String pId, String pName, String unitPrice, String quantity, int sum, String imgName, String description) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.imgName = imgName;
		this.description = description;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.sum=sum;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	@Override
	public String toString() {
		return "CartDTO [cId=" + cId + ", pId=" + pId + ", pName=" + pName + ", imgName=" + imgName + ", description="
				+ description + ", unitPrice=" + unitPrice + ", quantity=" + quantity + ", sum=" + sum + "]";
	}
	
	
	
}
