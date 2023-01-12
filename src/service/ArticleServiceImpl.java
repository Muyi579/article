package service;

import java.util.List;
import java.util.Map;

import dao.ArticleDao;
import dao.ArticleDaoImpl;
import entity.ArticleEntity;
import test.PageInfo;

/**
 * @author articleServiceImpl业务层实体类
 *
 */
public class ArticleServiceImpl implements ArticleService {

	// 构建dao层
	private ArticleDao article = new ArticleDaoImpl();

	@Override
	public int deleteArticleNo(String articleId) {
		// TODO Auto-generated method stub
		return article.deleteArticleNo(articleId);
	}

	@Override
	public int addArticle(ArticleEntity articleEntity) {
		// TODO Auto-generated method stub
		return article.addArticle(articleEntity);
	}

	@Override
	public int updateArticle(ArticleEntity articleEntity) {
		// TODO Auto-generated method stub
		return article.updateArticle(articleEntity);
	}

	@Override
	public List<Map<String, Object>> getArticle(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return article.getArticle(map);
	}

	@Override
	public List<Map<String, Object>> getArticleOrderby(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return article.getArticleOrderby(map);
	}

	@Override
	public PageInfo<ArticleEntity> findByPage(Map<String, String> map) {
		// TODO Auto-generated method stub
		return article.findByPage(map);
	}

}
