package com.nefu.stumgr.util;
import java.io.*;

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.jspsmart.upload.*;
import com.jspsmart.upload.File;

public class servletUpload extends HttpServlet {
	private ServletConfig config;
	//初始化Servlet
	final public void init(ServletConfig config) throws ServletException {
		this.config = config;
	}
	//处理GET请求
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out = response.getWriter();
		out.println("The method of the HTML form must be POST.");
	}
	//响应POST请求
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		String upLoader=request.getParameter("uploader");
		PrintWriter out = response.getWriter();
		String fileName="";
		// 变量定义
		int count=0;
		SmartUpload mySmartUpload = new SmartUpload();
		out.print("<html>");
		out.print("	<head>");
		out.print("<link rel='stylesheet' rev='stylesheet' href='css/home.css' type='text/css'>");
		out.print("<link rel='stylesheet' rev='stylesheet' href='css/myfont.css' type='text/css'>");
		out.print("</head>");
		out.print("<body>");
		out.print("<center>");
		out.print("<img src='images/top.jpg'><br>");
		try {
			// 初始化
			mySmartUpload.initialize(config,request,response);
//			File file=mySmartUpload.getFiles().getFile(0);
//			System.out.println(file.getFileName());
			// 上载
			mySmartUpload.upload();
			// 保存上载文件到指定目录
			// PATH为form表单提交过来的
			//count = mySmartUpload.save(mySmartUpload.getRequest().getParameter("PATH"));
			if(upLoader.equals("photo"))
				count = mySmartUpload.save("/photo/");
			if(upLoader.equals("manageNewsImg"))
				count = mySmartUpload.save("/newsImg/");
			fileName=mySmartUpload.getFiles().getFile(0).getFileName();
			// 显示处理结果
			out.println(count + " success "+fileName);
		} catch (Exception e){
			out.println("Unable to upload the file.<br>");
			out.println("Error : " + e.toString());
		}
		out.print("</body>");
		out.print("</html>");		
		if(upLoader.equals("photo"))
			response.setHeader("Refresh", "1;URL='public/uploadPhotoHandle.jsp'");	
		if(upLoader.equals("manageNewsImg"))
			response.setHeader("Refresh", "1;URL='admin/uploadNewsImgHandle.jsp?fileName="+fileName+"'");	
    }
}
