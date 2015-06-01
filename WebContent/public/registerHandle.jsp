<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <center>
 <img src="../images/top.jpg"><br>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<% 
String inputUser=request.getParameter("user");
String inputPassword=request.getParameter("password");
String inputConfirmPassword=request.getParameter("ConfirmPassword");
if(inputPassword.equals(inputConfirmPassword))
{
	ResultSet rs=connectDatabase.exeQuery("select * from login");
	int flag=0;
	while(rs.next())
	{
		try
		{
			if(inputUser.equals(rs.getString("user")))
			{
				flag=1;
				out.print("<center>");
				out.print("您所注册的用户名已存在，请更换其他用户名");
				out.print("</center>");
				break;
			}
	         
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	if(flag==0)
	{
		String insert="insert into login values('"+inputUser+"','"+inputPassword+"')"; 
		try
		{
		connectDatabase.exeUpdate(insert);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		out.print("<center>");
		out.print("注册用户名："+inputUser+"<br>");
		out.print("注册密码："+inputPassword+"<br>");
		out.print("<a href='../index.html'>注册成功，请登录</a>");
		out.print("</center>");
	}
connectDatabase.exeUpdate("insert into student(sno) values("+inputUser+")");
connectDatabase.close();
}
else
{%>
<center>
   两次密码输入不一致
   <a href="register.html" >注册</a>
</center>	
<% 
}

%>

