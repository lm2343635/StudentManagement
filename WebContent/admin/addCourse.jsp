<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <%
 request.setCharacterEncoding("gb2312");
 String cname=request.getParameter("cname");
 String cno=request.getParameter("cno");
 String ccredit=request.getParameter("ccredit");
 connectDatabase.exeUpdate("insert into course values("+cno+",'"+cname+"',"+ccredit+")");
 response.sendRedirect("../admin/setAllCourse.jsp");
 %>