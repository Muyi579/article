package dao;

import java.util.List;

import entity.Account;

/**
 * 用户dao
 * @author 龙龙
 *
 */
public interface AccountDao {

	/**
	 * 注册信息
	 * @param account
	 * @return
	 */
	int addAccount(Account account);
	
	/**
	 * 获取所有用户名
	 * @param accountName
	 * @return
	 */
	List<Account> getAccount();
	
	/**
	 * 根据用户名密码判断是否登录成功
	 * @param ursename
	 * @param password
	 * @return
	 */
	Account judgeLogin(Account account);
}
