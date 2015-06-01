<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <%
 request.setCharacterEncoding("gb2312");
 String cono=request.getParameter("cono");
 String dno=request.getParameter("dno");
 String dname=request.getParameter("dname");
 connectDatabase.exeUpdate("insert into department values("+dno+","+cono+",'"+dname+"')");
 response.sendRedirect("../admin/department.jsp?cono="+cono);
 %>