<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <html>
 	<head>
 		<title>��Ϣά��</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
 	</head>
 	<body>
 	<center>
 	<img  src="../images/top.jpg"><br>
 	<jsp:include page="header.jsp"></jsp:include>
 <%
String inputUser=(String)session.getAttribute("user");
String inputPassword=(String)session.getAttribute("password");
ResultSet rs=connectDatabase.exeQuery("select * from student where sno="+inputUser);
String photoPath="../photo/"+inputUser+".jpg";
while(rs.next())
{
%>
	 <table  border="0">
       <tr>
	     <td height="40" colspan="5" align="center" bgcolor="#0000FF"><myfont>������Ϣ</myfont></td>
       </tr> 
	   <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">ѧ��</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("sno") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">����</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("sname") %></td>
	     <td width="300" rowspan="5" align="center" bgcolor="#D9FFFF">
	     	<img width="130" height="190" src="<%=photoPath%>">
	     </td>
	   </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">�Ա�</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("ssex") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">����</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("sage") %></td>
       </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">��������</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("birthday") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">��ѧʱ��</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("admissionTime") %></td>
       </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">����</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("ethnic") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">ѧ�����</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("edubg") %></td>
       </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">������ò</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("political") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">רҵ����</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("direction") %></td>
       </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">Ժϵ</td>
	     <td colspan="2" align="center" bgcolor="#D9FFFF"><%=rs.getString("college") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">רҵ</td>
	     <td width="300" align="center" bgcolor="#D9FFFF"><%=rs.getString("department") %></td>
	   </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">������</td>
	     <td colspan="2" align="center" bgcolor="#D9FFFF"><%=rs.getString("class") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">����֤��</td>
	     <td width="300" align="center" bgcolor="#D9FFFF"><%=rs.getString("IDcard") %></td>
	   </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">�绰</td>
	     <td colspan="2" align="center" bgcolor="#D9FFFF"><%=rs.getString("telphone") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">����</td>
	     <td width="300" align="center" bgcolor="#D9FFFF"><%=rs.getString("email") %></td>
	   </tr>

       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">����</td>
	     <td colspan="2" align="center" bgcolor="#D9FFFF"><%=rs.getString("hometown") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">��ͥסַ</td>
	     <td width="300" align="center" bgcolor="#D9FFFF"><%=rs.getString("homeAddress") %></td>
	   </tr>                     
	</table>
<% }
 %>
    <table  border="0"> 
       <tr>
	     <td width="303" height="40" align="center" bgcolor="#D9FFFF">
	     	<button type="button" onClick="window.location.href='../public/modifyPassword.html'">
	     		�޸�����
	     	</button>
	     </td>
	     <td width="303" align="center" bgcolor="#D9FFFF">
	     	<button type="button" onClick="window.location.href='modifyStudentInfo.jsp'">
     			�޸ĸ�����Ϣ
     		</button>
	     </td>
	     <td width="303" align="center" bgcolor="#D9FFFF">
		     <button type="button" onClick="window.location.href='../public/loginHandle.jsp'">
		     	������ҳ
		     </button>   	
	     </td>
       </tr>                  
	</table>
 	</body>
 </html>
<%connectDatabase.close();%>