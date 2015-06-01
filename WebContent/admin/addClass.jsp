<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <%
 request.setCharacterEncoding("gb2312");
 String dno=request.getParameter("dno");
 String tno=request.getParameter("tno");
 String cno=request.getParameter("cno");
 String cono=request.getParameter("cono");
 String property=request.getParameter("property");
 String semester=request.getParameter("semester");
 connectDatabase.exeUpdate("insert into teach values("+dno+","+cno+","+semester+","+tno+",'"+property+"')");
 response.sendRedirect("../admin/setClassSemester.jsp?dno="+dno+"&cono="+cono+"&semester="+semester);
 %>