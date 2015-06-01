<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <%
 String cono=request.getParameter("cono");
 connectDatabase.exeUpdate("delete from college where cono="+cono);
 response.sendRedirect("../admin/college&department.jsp");
 %>