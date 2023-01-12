package service;

import java.util.Map;

import dao.LoginDao;
import dao.LoginDaoImpl;

public class LoginServiceImpl implements LoginService {
	private LoginDao dologin = new LoginDaoImpl();

	@Override
	public Map<String, String> login(String adminName, String password) {
		// TODO Auto-generated method stub
		return dologin.login(adminName, password);
	}

}
