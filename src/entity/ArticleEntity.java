package entity;

/**
 * 
 * @author 吕长建 article实体类
 *
 */
public class ArticleEntity {
	private String articleId; // 文章编号
	private String articleTitle; // 文章标题
	private String articleContent; // 文章内容
	private String publishDate; // 发布时间
	private Integer articleClickCount;//点击量
	private Integer articleAuthorId; // 文章作者id
	private AuthorEntity authorEntity;//作者实体类
	

	// 无参
	public ArticleEntity() {
		super();
	}
	// 有参

	public ArticleEntity(String articleId, String articleTitle, String articleContent, String publishDate,
			Integer articleAuthorId) {
		super();
		this.articleId = articleId;
		this.articleTitle = articleTitle;
		this.articleContent = articleContent;
		this.publishDate = publishDate;
		this.articleAuthorId = articleAuthorId;
	}
	// set get

	public String getArticleId() {
		return articleId;
	}

	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	public Integer getArticleAuthorId() {
		return articleAuthorId;
	}

	public void setArticleAuthorId(Integer articleAuthorId) {
		this.articleAuthorId = articleAuthorId;
	}

	// tostring
	@Override
	public String toString() {
		return "articleEntity [articleId=" + articleId + ", articleTitle=" + articleTitle + ", articleContent="
				+ articleContent + ", publishDate=" + publishDate + ", articleAuthorId=" + articleAuthorId + "]";
	}

	public int getArticleClickCount() {
		return articleClickCount;
	}

	public void setArticleClickCount(int articleClickCount) {
		this.articleClickCount = articleClickCount;
	}

	public AuthorEntity getAuthorEntity() {
		return authorEntity;
	}

	public void setAuthorEntity(AuthorEntity authorEntity) {
		this.authorEntity = authorEntity;
	}

}
