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
	   <button type="button" onClick="window.location.href='out.jsp'">�˳�</button>
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
	   tname="���޸�����Ϣ��������д������Ϣ";
   else
	   tname+="��ʦ";
%>
��ӭ�㣬<%=tno%>&nbsp;��<%=tname%>
<%
}
rs.close();
connectDatabase.close();
%>