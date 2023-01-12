package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import DBUT.DBUT;

public class LoginDaoImpl implements LoginDao {

	@Override
	public Map<String, String> login(String adminName, String password) {
		Map<String, String> map = null;
		ResultSet doQuery = DBUT.doQuery("select admin_name , password from admin where admin_name=? and password=?",
				adminName, password);
		try {
			if (doQuery.next() == true) {
				map = new HashMap<String, String>();
				map.put("adminName", adminName);
				map.put("password", password);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}

}
