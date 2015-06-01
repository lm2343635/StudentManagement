<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <%
 request.setCharacterEncoding("gb2312");
 String cono=request.getParameter("cono");
 String coname=request.getParameter("coname");
 connectDatabase.exeUpdate("insert into college values("+cono+",'"+coname+"')");
 response.sendRedirect("../admin/college&department.jsp");
 %>