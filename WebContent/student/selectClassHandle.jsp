<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.nefu.stumgr.util.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
request.setCharacterEncoding("gb2312");
String cno=request.getParameter("cno");
String tno=request.getParameter("tno");
String sno=(String)session.getAttribute("user");
connectDatabase.exeUpdate("insert into sc(sno,cno,tno) values ("+sno+","+cno+","+tno+")");
Semester s=new Semester();
int nowSemester=s.getSemester(sno);
response.sendRedirect("../student/selectClassSemester.jsp?semester="+nowSemester);
%>