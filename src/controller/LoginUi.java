package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.LoginService;
import service.LoginServiceImpl;

/**
 * Servlet implementation class loginUi
 */
/**
 * @author 登录判断servlet
 *
 */
public class LoginUi extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginService loginService = new LoginServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginUi() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 查看操作类型
		String op = request.getParameter("op");
		if (op == null) {
			// 如果==null没做提交回到登录页面继续做
			response.sendRedirect("bootstrapTemplate/DoLogin.jsp");
		} else if ("login".equals(op)) {
			// 如果是登录调用登录方法
			login(request, response);
		} else if ("exie".equals(op)) {
			// 退出就调用登录方法
			exie(request, response);

		}
	}

	private void exie(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 构建当前会话对象
		HttpSession session = request.getSession();
		// 删除对象中的值
		session.removeAttribute("map");
		// 重定向到登录页面
		response.sendRedirect("bootstrapTemplate/DoLogin.jsp");

	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 在获取表单值
		String adminName = request.getParameter("adminName");
		String password = request.getParameter("password");

		// 调用业务层得到map集合
		Map<String, String> map = loginService.login(adminName, password);
		// 不为空就有数据
		if (map != null) {
			// 构建session对象
			HttpSession session = request.getSession();
			// 把值map集合存放到作用域
			session.setAttribute("map", map);
			// 隐藏域值
			String check = request.getParameter("check");
			// 判断是否为true
			if ("true".equals(check)) {
				// 创建cookie对象保存用户名密码
				Cookie urse = new Cookie(adminName, password);
				// 添加到响应
				response.addCookie(urse);
			} else if ("false".equals(check)) {
				// 获得cookie数组
				Cookie[] cookies = request.getCookies();
				// 定义标杆
				Cookie cookie = null;
				// 循环遍历
				for (int i = 0; i < cookies.length; i++) {
					// 赋值
					cookie = cookies[i];
					// 找到cookie中的值
					if (cookie.getName().equals(adminName)) {
						// 设置失效
						cookie.setMaxAge(0);
						// 重新添加
						response.addCookie(cookie);
					}
				}
			}
			// 跳转到主页
			response.sendRedirect("bootstrapTemplate/Homework.jsp");
		} else {
			// 否则登录错误重定向url带报错信息
			response.sendRedirect("bootstrapTemplate/DoLogin.jsp?erro=erro");
		}

	}

}
