package dao;

import java.util.Map;

public interface LoginDao {

	/**
	 * 根据用户名密码登录
	 * 
	 * @param adminName
	 * @param password
	 * @return
	 */
	Map<String, String> login(String adminName, String password);
}
