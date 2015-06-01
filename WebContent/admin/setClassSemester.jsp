<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.nefu.stumgr.util.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <%
String semester=request.getParameter("semester");
String dno=request.getParameter("dno");
String cono=request.getParameter("cono");
ResultSet rs=connectDatabase.exeQuery("select dname from department where dno="+dno);	
String dname="";
while(rs.next())
	dname= rs.getString("dname");
rs=connectDatabase.exeQuery
("select course.cno,cname,property,ccredit,tname,examTime from course,teacher,teach "+
		"where teach.cno=course.cno and teach.tno=teacher.tno and "+    
		"course.cno in (select cno from teach where dno="+dno+" and semester="+semester+")");
// ("select * from course where cno in"+
//  "(select cno from teachplan where dno="+dno+" and semester="+semester+")");
%>
<html>
	<head>
		<title><%=dname %>��<%=semester %>ѧ�ڿγ�����</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"></jsp:include>
		<form action="addClass.jsp" method="post" >
		<table  border="0">
			   <tr>
				     <td height="40" colspan="7" align="center" bgcolor="#0000FF">
				     	<myfont><%=dname %>��<%=semester %>ѧ�ڿγ�����</myfont>
				     	<button type="button"  onClick="window.location.href='setClassDe.jsp?cono=<%=cono%>&dno=<%=dno%>'">����</button>
				     </td>
			  </tr> 
			  <tr>
				     <td width="100" height="40" align="center" bgcolor="#D9FFFF">�γ̺�</td>
				     <td width="200" align="center" bgcolor="#D9FFFF">�γ���</td>
				     <td width="100" align="center" bgcolor="#D9FFFF">�γ�����</td>
				     <td width="100" align="center" bgcolor="#D9FFFF">ѧ��</td>
				     <td width="100" align="center" bgcolor="#D9FFFF">�ڿν�ʦ</td>
				     <td width="100" align="center" bgcolor="#D9FFFF">����ʱ��</td>
				     <td width="100" align="center" bgcolor="#D9FFFF">ѡ��</td>
			  </tr>
				<%
				while(rs.next())
				{%>
			   <tr>
					<td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("cno") %></td>
					<td align="center" bgcolor="#D9FFFF"><%=rs.getString("cname") %></td>
					<td align="center" bgcolor="#D9FFFF"><%=rs.getString("property") %></td>
					<td align="center" bgcolor="#D9FFFF"><%=rs.getString("ccredit") %></td>
					<td align="center" bgcolor="#D9FFFF"><%=rs.getString("tname") %></td>
					<td align="center" bgcolor="#D9FFFF">
					<%
				     if(rs.getString("examTime")==null)
				    	 out.print("δԤ������ʱ��");
				     else
				    	 out.print(rs.getString("examTime"));		 
				     %>
					</td>
					<td align="center" bgcolor="#D9FFFF">
				     	<a href="deleteClass.jsp?dno=<%=dno %>&cno=<%=rs.getString("cno")%>&semester=<%=semester%>&cono=<%=cono%>">ɾ��</a>		
				    </td>
			   </tr>
				<%
				}
				%>
			   <tr>
		     		 <td height="40" colspan="7" align="center" bgcolor="#0000FF"><myfont>�����γ�</myfont></td>
			   </tr> 
			   <tr>
				     <td height="40" colspan="7" align="center" bgcolor="#D9FFFF">
				     	�γ̺�<input type="text" name="cno"/>	
				     	��ʦ���<input type="text" name="tno"/>		
				     	<input type="hidden" name="dno" value="<%=dno%>"/>
				     	<input type="hidden" name="semester" value="<%=semester%>"/>
				     	�γ�����
				     	<select name="property">
					         <option value="null" selected></option>
					         <option value="����������" >����������</option>
					         <option value="����ѡ�޿�" >����ѡ�޿�</option>
					         <option value="רҵ��" >רҵ��</option>
					         <option value="רҵ������" >רҵ������</option>
					         <option value="רҵѡ�޿�" >רҵѡ�޿�</option>
					         <option value="�γ����" >�γ����</option>
					         <option value="רҵѡ�޿�" >ʵ����ѧ</option>
				        </select>
				        <input type="submit" value="����"/>
			  			<input type="reset" value="����"/>		
				     </td>
			   </tr>
		</table>
		</form>
		<form action="addObligatory.jsp?dno=<%=dno %>&semester=<%=semester%>&cono=<%=cono%>"  method="post" >
		<table border="0" width="830" style="margin: 0; padding: 0;">
			  <tr>
		     		 <td height="40" colspan="6" align="center" bgcolor="#0000FF"><myfont>��ӱ��޿�</myfont></td>
			  </tr>
			  <tr>
					 <td height="40" colspan="6" align="center" bgcolor="#D9FFFF">
					 ��
				     <select name="grade">
				     <option value="0" selected></option>
				     <%
				     Grades g=new Grades();
				     int grades[]=g.getGrades();
				     for(int i=0;i<grades.length;i++)
				     {
				     %>
				     <option value="<%=grades[i] %>" ><%=grades[i] %>��</option>
				     <%
				     }
				     %>
				     </select>
					 ��<%=dname %>רҵ����ѧ����ӱ��޿�
					  <input type="submit" value="ȷ�����"/>
					 </td>
			  </tr>
		</table>
		</form>
	</body>
</html>