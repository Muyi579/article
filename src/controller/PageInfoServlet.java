package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import entity.ArticleEntity;
import service.ArticleService;
import service.ArticleServiceImpl;
import test.PageInfo;

/**
 * Servlet implementation class PageInfoServlet
 */
@WebServlet("/PageInfoServlet")
public class PageInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 创建业务类
		private ArticleService articleService = new ArticleServiceImpl();
		// 构建gson
		private Gson gson = new Gson();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		if ("ArticleLimit".equals(op)) {
			limitArticle(request,response);
		} else if ("updateArticle".equals(op)) {
			// 调用修改方法
			updateArticle(request, response);
		} else if ("deleteArticle".equals(op)) {
			// 调用删除方法
			deleteArticleNo(request, response);
		}
	}
	/**
	 * 根据文章编号删除文章信息
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void deleteArticleNo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 删除方法获取到请求作用域中的删除的对象id
		String articleId = request.getParameter("articleId");
		// 调用业务层方法进行删除
		int deleteArticleNo = articleService.deleteArticleNo(articleId);
		if (deleteArticleNo != 0) {
			limitArticle(request,response);
		}

	}
	private void updateArticle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取前端传来的对象
		String JSONArticle = request.getParameter("article");
		// 反射实体类
		ArticleEntity fromJson = gson.fromJson(JSONArticle, ArticleEntity.class);
		// 调用业务层方法得到结果
		int updateArticle = articleService.updateArticle(fromJson);
		if (updateArticle != 0) {
			limitArticle(request,response);
		}

	}

	private void limitArticle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String province = request.getParameter("pageSize");//下拉框值 
		String pageN0 = request.getParameter("pageNum");//当前页
		String like = request.getParameter("like");//条件
		Map<String,String> map = new HashMap<String, String>();
		map.put("pageNum", pageN0);
		map.put("like", like);
		map.put("pageSize", province);
		PageInfo<ArticleEntity> findByPage = articleService.findByPage(map);
		/*Integer pageSize = findByPage.getPageSize();//每页记录数
		Integer pages = findByPage.getPages(); // 总页数
		Integer total = findByPage.getTotal(); // 总记录数
		Integer pageNum = findByPage.getPageNum();//当前页数
		List<ArticleEntity> data = findByPage.getData();*/
		String json = gson.toJson(findByPage);
		response.setContentType("application/json");
		response.getWriter().write(json);
		
		
	}

}
