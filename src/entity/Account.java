package entity;

/**
 * 
 * @author 吕长建 article实体类
 *
 */
public class Account {
	private Integer accountId; // 用户编号
	private String accountName; // 用户名
	private String accountPwd; //用户密码
	private String facePicture; // 用户头像路径

	// 无参
	public Account() {
		super();
	}

	public Account(Integer accountId, String accountName, String accountPwd, String facePicture) {
		super();
		this.accountId = accountId;
		this.accountName = accountName;
		this.accountPwd = accountPwd;
		this.facePicture = facePicture;
	}

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAccountPwd() {
		return accountPwd;
	}

	public void setAccountPwd(String accountPwd) {
		this.accountPwd = accountPwd;
	}

	public String getFacePicture() {
		return facePicture;
	}

	public void setFacePicture(String facePicture) {
		this.facePicture = facePicture;
	}

	@Override
	public String toString() {
		return "Account [accountId=" + accountId + ", accountName=" + accountName + ", accountPwd=" + accountPwd
				+ ", facePicture=" + facePicture + "]";
	}
	

}
