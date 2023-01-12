package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBUT.DBUT;
import entity.Account;

/**
 * Accountdao层实现类
 * @author 龙龙
 *
 */
public class AccountDaoImpl implements AccountDao{

	@Override
	public int addAccount(Account account) {
		return DBUT.doUpdate("insert into account(account_name,account_pwd,face_picture) values(?,?,?)", account.getAccountName(),account.getAccountPwd(),account.getFacePicture());
	}

	@Override
	public List<Account> getAccount() {
		List<Account> list = new ArrayList<Account>();
		ResultSet rs = DBUT.doQuery("select account_id,account_name,account_pwd,face_picture from account");
		try {
			while (rs.next()) {
				Integer accountId = rs.getInt("account_id");
				String accountName = rs.getString("account_name");
				String accountPwd = rs.getString("account_pwd");
				String facePicture = rs.getString("face_picture");
				Account ac = new Account(accountId, accountName, accountPwd, facePicture);
				list.add(ac);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Account judgeLogin(Account account) {
		Account acc = null;
		ResultSet rs = DBUT.doQuery("select account_name,face_picture from account where account_name=? and account_pwd=?", account.getAccountName(),account.getAccountPwd());
		try {
			 
				while (rs.next()) {
					if (rs.wasNull()) {
						return acc;
					}
						String accountName = rs.getString("account_name");
						String facePicture = rs.getString("face_picture");
						acc = new Account(null, accountName, null, facePicture);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return acc;
	}

}
