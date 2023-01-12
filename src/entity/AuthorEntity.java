package entity;

public class AuthorEntity {
	private Integer articleAuthorId; // 文章作者id
	private String authorName; // 作者名称
	public AuthorEntity() {
		super();
	}
	public AuthorEntity(Integer articleAuthorId, String authorName) {
		super();
		this.articleAuthorId = articleAuthorId;
		this.authorName = authorName;
		
	}
	
	
	public Integer getArticleAuthorId() {
		return articleAuthorId;
	}
	public void setArticleAuthorId(Integer articleAuthorId) {
		this.articleAuthorId = articleAuthorId;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	@Override
	public String toString() {
		return "AuthorEntity [articleAuthorId=" + articleAuthorId + ", authorName=" + authorName + "]";
	}
	
}
