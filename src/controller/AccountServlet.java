package controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;

import entity.Account;
import service.AccountService;
import service.AccountServiceImpl;
import service.ArticleService;
import service.ArticleServiceImpl;

/**
 * Servlet implementation class AccountServlett
 */
@MultipartConfig // 表示控制器支持文件上传
@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
	// 用户业务类
	private AccountService accountService = new AccountServiceImpl();
	// 管理员业务类
	private ArticleService articleService = new ArticleServiceImpl();
	private static final long serialVersionUID = 1L;
	// gson对象
	private Gson gson = new Gson();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AccountServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收参数op值
		String op = request.getParameter("op");
		// 做判断是否存在用户
		if ("judgeAccountName".equals(op)) {
			// 调用查询
			judgeAccountName(request, response);
		} else if ("registered".equals(op)) {
			// 调用注册方法
			doRegistered(request, response);
		} else if ("orderBy".equals(op)) {
			// 排序方法
			orderByDate(request, response);
		} else if ("judgeLogin".equals(op)) {
			judgeLoginUi(request, response);
		}
	}

	private void judgeLoginUi(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 判断登录获取值
		String ursename = request.getParameter("ursename");
		String password = request.getParameter("password");
		Account account = new Account(null, ursename, password, null);
		Account judgeLogin = accountService.judgeLogin(account);
		if (judgeLogin == null) {
			response.setContentType("application/json");

			// 响应
			response.getWriter().write("false");
		} else {
			if (judgeLogin.getFacePicture() == null) {
				judgeLogin.setFacePicture("001.jpeg");
			}
			// 转换
			String json = gson.toJson(judgeLogin);
			response.setContentType("application/json");
			// 响应
			response.getWriter().write(json);
		}

	}

	private void orderByDate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 创建map集合
		Map<String, Object> map1 = new HashMap<String, Object>();
		// 添加查询方式
		map1.put("state", "发布日期");
		// 调用业务方法得到结果
		List<Map<String, Object>> orderByDate = articleService.getArticleOrderby(map1);
		// 创建map集合
		Map<String, Object> map2 = new HashMap<String, Object>();
		// 添加查询方式
		map2.put("state", "点击量");
		// 调用业务方法得到结果
		List<Map<String, Object>> orderByclick = articleService.getArticleOrderby(map2);
		// 创建集合
		Map<Object, Object> map = new HashMap<>();
		// 把两次的结果放进去
		map.put("orderByclick", orderByclick);
		map.put("orderByDate", orderByDate);
		// 转换
		String json = gson.toJson(map);
		response.setContentType("application/json");
		// 响应
		response.getWriter().write(json);
	}

	/**
	 * 注册
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void doRegistered(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// 获取表单提交值
		String accountName = request.getParameter("accountName");
		String accountPwd = request.getParameter("accountPwd");
		Part part = request.getPart("fileName");
		Account account = null;
		// 没有空的情况下
		if (accountPwd != "" && accountName != "") {
			if (part == null) {
				// 构建实体类
				account = new Account(null, accountName, accountPwd, null);
			} else {
				String img = "image/jpg,image/jpeg,image/png,image/gif";
				List<String> imgList = Arrays.asList(img.split(","));
				String contentType = part.getContentType();
				if (imgList.contains(contentType) == false) {
					response.sendRedirect(
							"${pageContext.request.contextPath}/bootstrapTemplate/register.jsp?fileError=文件类型错误");
				} else {
					// 获取文件真实名:Servlet 3.0不提供获取上传文件名的方法,通过请求头信息间接获取
					String header = part.getHeader("content-disposition");
					String realName = header.substring(header.indexOf("filename=") + 10, header.length() - 1);
					// 获取真实文件名的后缀
					String fileSuffix = realName.substring(realName.lastIndexOf("."));// 切割文件名

					// 使用时间戳+随机数自动生成文件名,避免文件名重复问题
					// JDK1.8 日期时间类
					LocalDateTime now = LocalDateTime.now();// 当前系统时间
					DateTimeFormatter ofPattern = DateTimeFormatter.ofPattern("yyyyMMddhhmmssSSS");// 日期格式
					// 将当前日期时间转成字符串
					String formatDate = ofPattern.format(now);
					// 随机数
					int random = (int) (Math.random() * 1000 + 1);
					// 拼接
					StringBuffer stringBufferfileName = new StringBuffer();
					stringBufferfileName.append(formatDate).append(random);

					// 将文件存储在指定服务器中(本地电脑E盘)
					File file = new File("D:\\中软\\filetext\\imgss\\");
					if (!file.exists()) {
						file.mkdirs();
					}
					// 将文件写入指定位置
					String filePath = file.getPath() + File.separator + stringBufferfileName + fileSuffix; // E:\fileupload\images\1.jpg
					String fileName = stringBufferfileName + fileSuffix;
					part.write(filePath);
					// 构建实体类
					account = new Account(null, accountName, accountPwd, fileName);
				}
			}
			// 调用业务层方法
			accountService.addAccount(account);
			// 转发到主页
			response.sendRedirect("bootstrapTemplate/home.jsp");
			;
		}
	}

	/**
	 * 查询判断
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void judgeAccountName(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 获取名字
		String accountName = request.getParameter("account");
		// 得到所有信息
		List<Account> accountNameLise = accountService.getAccount();
		// 遍历
		for (Account string : accountNameLise) {
			// 判断名字是否存在
			if (string.getAccountName().equals(accountName)) {
				// 存在响应true
				response.getWriter().write("true");
			}
		}
	}

}
