package controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownloadServlet
 */
@WebServlet("/FileDownloadServlet")
public class FileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 读取服务器指定位置的文件
		// 存储头像的文件目录
		String root = "D:\\中软\\filetext\\imgss\\";
		// 获取指定的文件名
		String fileName = request.getParameter("fileName");
		System.out.println(fileName);
		// 关联文件
		File file = new File(root + fileName);

		// 通过字节读取流 读文件
		FileInputStream fis = new FileInputStream(file);

		// 字节数组输出流
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		byte[] b = new byte[1024];
		int n;

		// 边读边写
		while ((n = fis.read(b)) != -1) { // 有数据可读
			// 写
			bos.write(b, 0, n);
		}
		bos.close();
		fis.close();

		// 通过Servlet输出流将文件以字节数组的形式输出到网页上
		ServletOutputStream sos = response.getOutputStream();
		sos.write(bos.toByteArray());
		sos.flush();
		sos.close();

	}

}
