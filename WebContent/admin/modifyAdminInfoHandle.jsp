<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
request.setCharacterEncoding("gb2312");
String ano=request.getParameter("ano");
String aname=request.getParameter("aname");
aname=new String(aname.getBytes( "ISO8859-1"), "GB2312"); 
out.print(ano+"    "+aname);
connectDatabase.exeUpdate("update admin set aname='"+aname+"' where ano="+ano);
response.sendRedirect("../admin/maintainInfo.jsp");
%>