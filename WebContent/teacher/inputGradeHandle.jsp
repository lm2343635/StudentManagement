<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
int sCount=Integer.parseInt(request.getParameter("sCount"));
String cno=request.getParameter("cno");
String grade="";
String sno="";
String update="";
for(int i=1;i<=sCount;i++)
{
	grade=request.getParameter("grade"+String.valueOf(i));
	sno=request.getParameter("sno"+String.valueOf(i));
	if(!grade.equals(""))
	{
		update="update sc set grade="+grade+" where sno="+sno+" and cno="+cno;
		connectDatabase.exeUpdate(update);
	}
}
response.sendRedirect("selectList.jsp?cno="+cno);
%>