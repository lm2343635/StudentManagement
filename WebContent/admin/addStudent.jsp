<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
request.setCharacterEncoding("gb2312");
String sno=request.getParameter("sno");
String cono=request.getParameter("cono");
String dno=request.getParameter("dno");
String sname=request.getParameter("sname");
String dname=request.getParameter("dname");
String coname=request.getParameter("coname");
// out.print(sno+"<br/>");
// out.print(cono+"<br/>");
// out.print(sname+"<br/>");
// out.print(dname+"<br/>");
// out.print("insert into student(sno,sname,college,department) values('"+sno+"','"+sname+"','"+coname+"','"+dname+"')");
// out.print("insert into login values ('"+sno+"','123456')");
connectDatabase.exeUpdate("insert into student(sno,sname,college,department) values('"+sno+"','"+sname+"','"+coname+"','"+dname+"')");
connectDatabase.exeUpdate("insert into login values ('"+sno+"','123456')");
response.sendRedirect("../admin/manageStudentDe.jsp?cono="+cono+"&dno="+dno);
%>