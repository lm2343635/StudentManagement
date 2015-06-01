<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
String cno=request.getParameter("cno");
connectDatabase.exeUpdate("delete from course where cno="+cno);
response.sendRedirect("../admin/setAllCourse.jsp?");
%>