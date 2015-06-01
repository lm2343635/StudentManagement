<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
request.setCharacterEncoding("gb2312");
String dno=request.getParameter("dno");
String cno=request.getParameter("cno");
String cono=request.getParameter("cono");
String semester=request.getParameter("semester");
// out.print(dno+"<br/>");
// out.print(cno+"<br/>");
// out.print(semester+"<br/>");
connectDatabase.exeUpdate("delete from teach where dno="+dno+" and cno="+cno+" and semester="+semester);
response.sendRedirect("../admin/setClassSemester.jsp?dno="+dno+"&cono="+cono+"&semester="+semester);
%>