<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
request.setCharacterEncoding("gb2312");
String ano=request.getParameter("ano");
String aname=request.getParameter("aname");
connectDatabase.exeUpdate("insert into admin values('"+ano+"','"+aname+"')");
connectDatabase.exeUpdate("insert into login values ('"+ano+"','123456')");
response.sendRedirect("../admin/manageAdmin.jsp");
%>