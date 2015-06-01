<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<% 
String inputUser="";
String inputPassword="";
String userType="";
//将用户名，密码存入session
if(session.getAttribute("user")==null||session.getAttribute("password")==null||session.getAttribute("userType")==null)
{
	inputUser=request.getParameter("user");
	inputPassword=request.getParameter("password");
	userType=request.getParameter("userType");
	session.setAttribute("user",inputUser);
	session.setAttribute("password",inputPassword);
	session.setAttribute("userType",userType);
}
if(request.getParameter("userType")!=null)
{
	userType=request.getParameter("userType");
	if(userType.equals("teacher"))
		response.sendRedirect("../teacher/loginHandleTeacher.jsp");
	if(userType.equals("admin"))
		response.sendRedirect("../admin/loginHandleAdmin.jsp");
	if(userType.equals("student"))
		response.sendRedirect("../student/loginHandleStudent.jsp");
}
%>