package service;

import java.util.List;
import java.util.Map;

import entity.ArticleEntity;
import test.PageInfo;

/**
 * @author articleService 业务层
 *
 */

public interface ArticleService {

	/**
	 * 根据编号删除文章
	 * 
	 * @param articleId
	 * @return
	 */
	int deleteArticleNo(String articleId);

	/**
	 * 添加文章
	 * 
	 * @param articleEntity
	 * @return
	 */
	int addArticle(ArticleEntity articleEntity);

	/**
	 * 修改文章信息
	 * 
	 * @param articleEntity
	 * @return
	 */
	int updateArticle(ArticleEntity articleEntity);

	/**
	 * 查询
	 * 
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> getArticle(Map<String, Object> map);
	

	/**
	 * 排序查询
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> getArticleOrderby(Map<String, Object> map);

	/**
	 * 分页
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	PageInfo<ArticleEntity> findByPage(Map<String, String> map);
}
