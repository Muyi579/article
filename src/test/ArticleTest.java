package test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import org.junit.Test;

import dao.AccountDao;
import dao.AccountDaoImpl;
import dao.ArticleDao;
import dao.ArticleDaoImpl;
import entity.Account;
import entity.ArticleEntity;
import service.ArticleService;
import service.ArticleServiceImpl;

/**
 * @author articleTest测试类
 *
 */

public class ArticleTest {
	// 构建业务类
	ArticleService articleService = new ArticleServiceImpl();
	ArticleDao articleDao = new ArticleDaoImpl();
	AccountDao accountDao = new AccountDaoImpl();
	// 构建控制台
	Scanner scanner = new Scanner(System.in);

	// 测试所有信息
	@Test
	public void All() {
		System.out.println("请输入查询状态");
		String articletitle = scanner.next();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", articletitle);
		List<Map<String, Object>> article = articleService.getArticleOrderby(map);
		for (int i = 0; i < article.size(); i++) {
			Map<String, Object> map2 = article.get(i);
			System.out.println("文章编号：" + map2.get("articleTitle") + "\t" + "文章标题：" + map2.get("articleContent")
					+ map2.get("publishDate") + map2.get("articleClickCount"));
		}
	}

	@Test
	public void name() {
		Map<String, String> map = new HashMap<>();
		map.put("A","");
		if (map.get("A") == null || "".equals(map.get("A"))) {
			System.out.println(1);
		}
		
 	}
	@Test
	public void name1() {
		Account judgeLogin = accountDao.judgeLogin(new Account(null, "吕长建", "000", null));
		System.out.println(judgeLogin);
	}

}
