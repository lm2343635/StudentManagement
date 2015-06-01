<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
request.setCharacterEncoding("gb2312");
String tno=request.getParameter("tno");
String cono=request.getParameter("cono");
String tname=request.getParameter("tname");
String coname=request.getParameter("coname");
// out.print(tno+"<br/>");
// out.print(cono+"<br/>");
// out.print(tname+"<br/>");
// out.print(coname+"<br/>");
out.print("insert into teacher(tno,tname,college) values('"+tno+"','"+tname+"','"+coname+"')");
out.print("insert into login values ('"+tno+"','123456')");
connectDatabase.exeUpdate("insert into teacher(tno,tname,college) values('"+tno+"','"+tname+"','"+coname+"')");
connectDatabase.exeUpdate("insert into login values ('"+tno+"','123456')");
response.sendRedirect("../admin/manageTeacherCo.jsp?cono="+cono);
%>