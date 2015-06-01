<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<% 
String inputUser="";
String inputPassword="";
//将用户名，密码存入session
if(session.getAttribute("user")==null||session.getAttribute("password")==null)
{
	inputUser=request.getParameter("user");
	inputPassword=request.getParameter("password");
	session.setAttribute("user",inputUser);
	session.setAttribute("password",inputPassword);

}
else
{
	inputUser=(String)session.getAttribute("user");
	inputPassword=(String)session.getAttribute("password");
}

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
	   <a href="register.html" >注册</a>
	   <button type="button" onClick="window.location.href='out.jsp'">退出</button>
   <% 
}
else
{
   rs=connectDatabase.exeQuery
		   ("select tno,tname from teacher where tno='"+inputUser+"'");
   String tno="";
   String tname="";
   while(rs.next())
   {
	   tno=rs.getString("tno");
	   tname=rs.getString("tname");
   }
   if(tname==null)
	   tname="暂无个人信息，请先填写个人信息";
   else
	   tname+="老师";
%>
欢迎你，<%=tno%>&nbsp;，<%=tname%>
<%
}
rs.close();
connectDatabase.close();
%>