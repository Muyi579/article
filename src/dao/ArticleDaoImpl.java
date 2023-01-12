package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import DBUT.DBUT;
import entity.ArticleEntity;
import entity.AuthorEntity;
import test.PageInfo;

/**
 * @author articleDaoImpl的dao层实现类
 *
 */
public class ArticleDaoImpl implements ArticleDao {

	@Override
	public int deleteArticleNo(String articleId) {
		// TODO Auto-generated method stub
		return DBUT.doUpdate("delete from article where article_id = ?", articleId);
	}

	@Override
	public int addArticle(ArticleEntity articleEntity) {
		// TODO Auto-generated method stub
		return DBUT.doUpdate(
				"insert into article(article_id,article_title,article_content,publish_date,article_author_id) values(?,?,?,?,?)",
				articleEntity.getArticleId(), articleEntity.getArticleTitle(), articleEntity.getArticleContent(),
				articleEntity.getPublishDate(), articleEntity.getArticleAuthorId());
	}

	@Override
	public int updateArticle(ArticleEntity articleEntity) {
		// TODO Auto-generated method stub
		return DBUT.doUpdate(
				"update article set article_title=?,article_content=? where article_id=?",
				articleEntity.getArticleTitle(), articleEntity.getArticleContent(), articleEntity.getArticleId());
	}

	@Override
	public List<Map<String, Object>> getArticle(Map<String, Object> map) {
		List<Map<String, Object>> list = new ArrayList<>();
		ResultSet rs = null;
		if ("模糊查询".equals(map.get("state"))) {
			rs = DBUT.doQuery(
					"select A.article_id,A.article_title,A.article_content,A.publish_date,B.author_name from article A inner join author B  on A.article_author_id = B.article_author_id where A.article_title like ?",
					"%" + map.get("like") + "%");
		} else if ("查所有".equals(map.get("state"))) {
			rs = DBUT.doQuery(
					"select A.article_id,A.article_title,A.article_content,A.publish_date,B.author_name from article A inner join author B  on A.article_author_id = B.article_author_id ");
		} else if ("发布日期".equals(map.get("state"))) {
			rs = DBUT.doQuery("select article_title,article_content from article order by publish_date desc limit 0,3");
		} else if ("点击量".equals(map.get("state"))) {
			rs = DBUT.doQuery("select article_title,article_content from article order by article_click_count desc limit 0,3");
		}
		try {
			while (rs.next()) {

				// 获取到每一个值
				String articleId = rs.getString("article_id");
				String articleTitle = rs.getString("article_title");
				String articleContent = rs.getString("article_content");
				String publishDate = rs.getString("publish_date");
				String authorName = rs.getString("author_name");
				Map<String, Object> parm = new HashMap<>();
				parm.put("articleId", articleId);
				parm.put("articleTitle", articleTitle);
				parm.put("articleContent", articleContent);
				parm.put("publishDate", publishDate);
				parm.put("authorName", authorName);
				// 存入集合
				list.add(parm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> getArticleOrderby(Map<String, Object> map) {
		List<Map<String, Object>> list = new ArrayList<>();
		ResultSet rs = null;
		if ("发布日期".equals(map.get("state"))) {
			rs = DBUT.doQuery("select article_title,article_content,publish_date,article_click_count from article order by publish_date desc limit 0,3");
		} else if ("点击量".equals(map.get("state"))) {
			rs = DBUT.doQuery("select article_title,article_content,publish_date,article_click_count from article order by article_click_count desc limit 0,3");
		}
		try {
			while (rs.next()) {

				String articleTitle = rs.getString("article_title");
				String articleContent = rs.getString("article_content");
				String publishDate = rs.getString("publish_date");
				Integer articleClickCount = rs.getInt("article_click_count");
				Map<String, Object> parm = new HashMap<>();
				parm.put("articleTitle", articleTitle);
				parm.put("articleContent", articleContent);
				parm.put("publishDate", publishDate);
				parm.put("articleClickCount", articleClickCount);
				// 存入集合
				list.add(parm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public PageInfo<ArticleEntity> findByPage(Map<String, String> map) {
		List<ArticleEntity> data = new ArrayList<>();
		Integer pageNum = Integer.parseInt( map.get("pageNum"));
		Integer pageSize =Integer.parseInt( map.get("pageSize"));
		Integer total = 0;
		PageInfo<ArticleEntity> pageInfo =null;
		ResultSet rs = DBUT.doQuery("select A.article_id,A.article_title,A.article_content,A.publish_date,B.author_name from article A inner join author B  on A.article_author_id = B.article_author_id where A.article_title like ?  limit ?,?", 
				"%" + map.get("like") + "%",(pageNum-1)*pageSize,pageSize);
		try {
			while (rs.next()) {
				String articleId = rs.getString("article_id");
				String articleTitle = rs.getString("article_title");
				String articleContent = rs.getString("article_content");
				String publishDate = rs.getString("publish_date");
				String authorName = rs.getString("author_name");
				ArticleEntity article = new ArticleEntity();
				article.setArticleId(articleId);
				article.setArticleTitle(articleTitle);
				article.setArticleContent(articleContent);
				article.setPublishDate(publishDate);
				AuthorEntity authorEntity = new AuthorEntity();
				authorEntity.setAuthorName(authorName);
				article.setAuthorEntity(authorEntity);
				data.add(article);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		// 获取符合当前查询条件的总记录数
		rs = DBUT.doQuery("select count(*) from article A inner join author B  on A.article_author_id = B.article_author_id where A.article_title like ?","%" + map.get("like") + "%");
		try {
			while (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		pageInfo = new PageInfo<>(data, pageNum, pageSize, total);
		
		return pageInfo;
	}

}
