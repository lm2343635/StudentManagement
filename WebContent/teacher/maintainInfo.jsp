<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <html>
 	<head>
 		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
 		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
 		<title>��Ϣά��</title>
 	</head>
 	<body>
 	<center>
 	<img src="../images/top.jpg"><br>
 	<jsp:include page="../teacher/header.jsp"></jsp:include>
 <%
String inputUser=(String)session.getAttribute("user");
String inputPassword=(String)session.getAttribute("password");
String photoPath="../photo/"+inputUser+".jpg";
ResultSet rs=connectDatabase.exeQuery("select * from teacher where tno="+inputUser);
while(rs.next())
{
%>
<table  border="0">
   <tr>
	     <td height="40" colspan="5" align="center" bgcolor="#0000FF"><myfont>������Ϣ</myfont></td>
  </tr> 
	   <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">����</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("tno") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">����</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("tname") %></td>
	     <td width="300" rowspan="5" align="center" bgcolor="#D9FFFF">
	     	<img width="130" height="190" src="<%=photoPath%>">
	     </td>
	   </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">�Ա�</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("tsex") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">����</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("tage") %></td>
       </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">��������</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("birthday") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">��У����</td>
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
	     <td width="150" align="center" bgcolor="#D9FFFF">�绰</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("telphone") %></td>
       </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">����</td>
	     <td colspan="2" align="center" bgcolor="#D9FFFF"><%=rs.getString("email") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">Ժϵ</td>
	     <td width="300" align="center" bgcolor="#D9FFFF"><%=rs.getString("college") %></td>
	   </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">���֤��</td>
	     <td colspan="2" align="center" bgcolor="#D9FFFF"><%=rs.getString("IDcard") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">��ͥסַ</td>
	     <td width="300" align="center" bgcolor="#D9FFFF"><%=rs.getString("homeAddress") %></td>
	   </tr>                     

<% 
}
 %>
	</table>
	<table  border="0"> 
       <tr>
	     <td width="303" height="40" align="center" bgcolor="#D9FFFF">
	     	<button type="button" onClick="window.location.href='../public/modifyPassword.jsp'">
	     		�޸�����
	     	</button>
	     </td>
	     <td width="303" align="center" bgcolor="#D9FFFF">
	     	<button type="button" onClick="window.location.href='modifyTeacherInfo.jsp'">
     			�޸ĸ�����Ϣ
     		</button>
	     </td>
	     <td width="303" align="center" bgcolor="#D9FFFF">
		     <button type="button" onClick="window.location.href='../teacher/loginHandleTeacher.jsp'">
		     	������ҳ
		     </button>   	
	     </td>
       </tr>                  
	</table>
 	</body>
 </html>
<%connectDatabase.close();%>