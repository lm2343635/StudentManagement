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
				out.print("����ע����û����Ѵ��ڣ�����������û���");
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
		out.print("ע���û�����"+inputUser+"<br>");
		out.print("ע�����룺"+inputPassword+"<br>");
		out.print("<a href='../index.html'>ע��ɹ������¼</a>");
		out.print("</center>");
	}
connectDatabase.exeUpdate("insert into student(sno) values("+inputUser+")");
connectDatabase.close();
}
else
{%>
<center>
   �����������벻һ��
   <a href="register.html" >ע��</a>
</center>	
<% 
}

%>

