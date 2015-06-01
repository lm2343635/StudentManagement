<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
request.setCharacterEncoding("gb2312");
String cono=request.getParameter("cono");
String dno=request.getParameter("dno");
String sno=request.getParameter("sno");
connectDatabase.exeUpdate("delete from student where sno="+sno);
connectDatabase.exeUpdate("delete from login where user="+sno);
response.sendRedirect("../admin/manageStudentDe.jsp?cono="+cono+"&dno="+dno);
%>