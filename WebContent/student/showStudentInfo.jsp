<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<% 
String inputUser="";
String inputPassword="";
//���û������������session
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


//��֤����
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
	   �û��������ڻ��������
	   <a href="register.html" >ע��</a>
	   <button type="button" onClick="window.location.href='../public/out.jsp'">�˳�</button>
<% 
}
else
{
   rs=connectDatabase.exeQuery
		   ("select sno,sname,sage,ssex from student where sno='"+inputUser+"'");
   String sno="";
   String sname="";
   while(rs.next())
   {
	   sno=rs.getString("sno");
	   sname=rs.getString("sname");
   }
   if(sname==null)
	   sname="���޸�����Ϣ��������д������Ϣ";
   else
	   sname+="ͬѧ";
%>
        ��ӭ�㣬<%=sno%>&nbsp;��<%=sname%>
<%
}
rs.close();
connectDatabase.close();
%>