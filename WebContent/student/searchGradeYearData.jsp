<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
String sno=(String)session.getAttribute("user");
String year="";
if(request.getParameter("year")==null)
	year="1";
else
	year=request.getParameter("year");       
int semester1=Integer.parseInt(year)*2;
int semester2=Integer.parseInt(year)*2-1;
ResultSet rs=connectDatabase.exeQuery("select sc.cno,semester,cname,tname,ccredit,grade from sc,teach,course,teacher "+
		"where sno="+sno+" and semester in("+semester1+","+semester2+")"+
		" and sc.tno=teach.tno and sc.cno=teach.cno and course.cno=sc.cno and sc.tno=teacher.tno order by semester"); 
%>
<table  border="0" style="margin: 0; padding: 0;">
	 <tr>
	     <td colspan="6" height="40" align="center" bgcolor="#0000FF">
	     	<myfont><%=sno %>����<%=year %>ѧ��ɼ���ѯ</myfont>
	     </td>
	 </tr>
	 <tr>
	     <td height="40" width="95" align="center" bgcolor="#D9FFFF">�γ̺�</td>
	     <td width="100" align="center" bgcolor="#D9FFFF">�޶�ѧ��</td>
	     <td width="200" align="center" bgcolor="#D9FFFF">�γ���</td>
	     <td width="200" align="center" bgcolor="#D9FFFF">�ον�ʦ</td>
	     <td width="100" align="center" bgcolor="#D9FFFF">ѧ��</td>
	     <td width="100" align="center" bgcolor="#D9FFFF">�ɼ�</td>
	 </tr>
	<%
	while(rs.next())
	{
	%>
	 <tr>
	     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("sc.cno") %></td>
	     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("semester") %></td>
	     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("cname") %></td>
	     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("tname") %></td>
	     <td align="center" bgcolor="#D9FFFF"><%=rs.getString("ccredit") %></td>
	     <td align="center" bgcolor="#D9FFFF">
	     <%
	     if(rs.getString("grade")==null)
	    	 out.print("���޳ɼ�");
	     else
	    	 out.print(rs.getString("grade"));
	     %>
	     </td>
	 </tr>	
	<%
	}
	%>
</table>