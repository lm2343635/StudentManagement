<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
  <%
 String cono=request.getParameter("cono");
 String dno=request.getParameter("dno");
 connectDatabase.exeUpdate("delete from department where dno="+dno);
 response.sendRedirect("../admin/department.jsp?cono="+cono);
 %>