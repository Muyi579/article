package test;

import java.util.List;

public class PageInfo<T> {

	private List<T> data;// 存储分页结果集
	private Integer pageNum; // 当前页
	private Integer pageSize; // 每页获取记录数
	private Integer total; // 总记录数
	private Integer pages; // 总页数
	
	
	public PageInfo() {
		super();
	}


	public PageInfo(List<T> data, Integer pageNum, Integer pageSize, Integer total) {
		super();
		this.data = data;
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.total = total;
		// 总页数 通过 总记录和每页获取的记录数换算
		this.pages = total % pageSize == 0 ? total/pageSize :(total/pageSize+1); 
	}


	public List<T> getData() {
		return data;
	}


	public void setData(List<T> data) {
		this.data = data;
	}


	public Integer getPageNum() {
		return pageNum;
	}


	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}


	public Integer getPageSize() {
		return pageSize;
	}


	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}


	public Integer getTotal() {
		return total;
	}


	public void setTotal(Integer total) {
		this.total = total;
	}


	public Integer getPages() {
		return pages;
	}


	public void setPages(Integer pages) {
		this.pages = pages;
	}


	@Override
	public String toString() {
		return "PageInfo [data=" + data + ", pageNum=" + pageNum + ", pageSize=" + pageSize + ", total=" + total
				+ ", pages=" + pages + "]";
	}
	
}
