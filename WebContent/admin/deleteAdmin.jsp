<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
request.setCharacterEncoding("gb2312");
String ano=request.getParameter("ano");
connectDatabase.exeUpdate("delete from admin where ano="+ano);
connectDatabase.exeUpdate("delete from login where user="+ano);
response.sendRedirect("../admin/manageAdmin.jsp");
%>