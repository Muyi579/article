package service;

import java.util.List;

import dao.AccountDao;
import dao.AccountDaoImpl;
import entity.Account;

public class AccountServiceImpl implements AccountService{
	private AccountDao accoun = new AccountDaoImpl();
	@Override
	public int addAccount(Account account) {
		// TODO Auto-generated method stub
		return accoun.addAccount(account);
	}

	@Override
	public List<Account> getAccount() {
		// TODO Auto-generated method stub
		return accoun.getAccount();
	}

	@Override
	public Account judgeLogin(Account account) {
		// TODO Auto-generated method stub
		return accoun.judgeLogin(account);
	}

}
