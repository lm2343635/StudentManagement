<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
request.setCharacterEncoding("gb2312");
String cono=request.getParameter("cono");
String tno=request.getParameter("tno");
connectDatabase.exeUpdate("delete from teacher where tno="+tno);
connectDatabase.exeUpdate("delete from login where user="+tno);
response.sendRedirect("../admin/manageTeacherCo.jsp?cono="+cono);
%>