<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <% 
String inputUser=(String)session.getAttribute("user");
String inputPassword=(String)session.getAttribute("password");
//验证密码
ResultSet rs=connectDatabase.exeQuery("select password from login where user='"+inputUser+"'");
int flag=0;
while(rs.next())
{
	if(rs.getString("password").equals(inputPassword))
		flag=1;
}
if(flag==0)
{
%>
	   用户名不存在或密码错误
	   <button type="button" onClick="window.location.href='../public/out.jsp'">退出</button>
<% 
}
else
{
   rs=connectDatabase.exeQuery
		   ("select aname from admin where ano="+inputUser);
   String aname="";
   while(rs.next())
	   aname=rs.getString("aname");
   if(aname==null)
	   aname="暂无信息，请先填写信息";
%>
        欢迎你，<%=inputUser%>&nbsp;，<%=aname%>
<%
}
rs.close();
connectDatabase.close();
%>