package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Servlet Filter implementation class UtfFilter
 */
public class ConfigFilter implements Filter {
	// 定义一个获取初始化值的标杆
	private static String encoding = null;

	/**
	 * Default constructor.
	 */
	public ConfigFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if (encoding != null) {
			// 设置请求的编码格式
			request.setCharacterEncoding(encoding);
			// 响应的编码格式
			response.setCharacterEncoding(encoding);
			// 放行
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// 获取初始化变量赋值
		encoding = fConfig.getInitParameter("character");
	}

}
