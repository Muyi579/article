package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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

/**
 * Servlet implementation class tableServlet
 */
@WebServlet("/tableServlet")
public class TableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 创建业务类
	private ArticleService articleService = new ArticleServiceImpl();
	// 构建gson
	private Gson gson = new Gson();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TableServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 在request中获取到op操作的值
		String op = request.getParameter("op");
		// 如果为空默认查所有/getarticle也是查所有
		if (op == null || "getarticle".equals(op)) {
			// 调用查所有方法需要两个参数
			getArticleAll(request, response);
			// 如果op的值是deleteArticle进行删除操作
		} else if ("deleteArticle".equals(op)) {
			// 调用删除方法
			deleteArticleNo(request, response);
		} else if ("updateArticle".equals(op)) {
			// 调用修改方法
			updateArticle(request, response);
		} else if ("likeTitle".equals(op)) {
			// 调用模糊方法
			likeArticle(request, response);
		}

	}

	private void likeArticle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取模糊值..
		String likeArticleTitle = request.getParameter("like");
		// 构建集合
		Map<String, Object> map = new HashMap<String, Object>();
		// 添加查询状态
		map.put("state", "模糊查询");
		// 添加条件
		map.put("like", likeArticleTitle);
		// 调用业务层方法
		List<Map<String, Object>> list = articleService.getArticle(map);
		String json = gson.toJson(list);
		response.setContentType("application/json");
		response.getWriter().write(json);// 响应
	}

	private void updateArticle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取前端传来的对象
		String JSONArticle = request.getParameter("article");
		// 反射实体类
		ArticleEntity fromJson = gson.fromJson(JSONArticle, ArticleEntity.class);
		// 调用业务层方法得到结果
		int updateArticle = articleService.updateArticle(fromJson);
		// 转为json字符型
		String json = gson.toJson(updateArticle);
		// 设置响应格式
		response.setContentType("application/json");
		response.getWriter().write(json);// 响应

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
		// 转为json字符型
		String json = gson.toJson(deleteArticleNo);
		// 设置响应格式
		response.setContentType("application/json");
		response.getWriter().write(json);// 响应

	}

	/**
	 * 查所有文章信息
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void getArticleAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 在request中获取到op操作的值
		/*String op = request.getParameter("op");
		if (op == null) {
			response.sendRedirect("bootstrapTemplate/Homework.jsp");
		}*/
		// 构建对象
		Map<String, Object> map = new HashMap<String, Object>();
		// 添加查询状态
		map.put("state", "查所有");
		// 调用业务层
		List<Map<String, Object>> list = articleService.getArticle(map);
		// 转换
		String json = gson.toJson(list);
		response.setContentType("application/json");
		response.getWriter().write(json);// 响应
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
