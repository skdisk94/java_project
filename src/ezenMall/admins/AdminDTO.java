package ezenMall.admins;

public class AdminDTO {
	private String aId;
	private String aName;
	private String aPassword;
	private String aDept;
	private String aTel;
	
	public AdminDTO() {}

	public AdminDTO(String aName, String aPassword, String aDept, String aTel) {
		this.aName = aName;
		this.aPassword = aPassword;
		this.aDept = aDept;
		this.aTel = aTel;
	}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getaPassword() {
		return aPassword;
	}

	public void setaPassword(String aPassword) {
		this.aPassword = aPassword;
	}

	public String getaDept() {
		return aDept;
	}

	public void setaDept(String aDept) {
		this.aDept = aDept;
	}

	public String getaTel() {
		return aTel;
	}

	public void setaTel(String aTel) {
		this.aTel = aTel;
	}
	
	
}
