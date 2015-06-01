<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
 <html>
 	<head>
 		<title>信息维护</title>
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
	     <td height="40" colspan="5" align="center" bgcolor="#0000FF"><myfont>基本信息</myfont></td>
       </tr> 
	   <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">学号</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("sno") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">姓名</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("sname") %></td>
	     <td width="300" rowspan="5" align="center" bgcolor="#D9FFFF">
	     	<img width="130" height="190" src="<%=photoPath%>">
	     </td>
	   </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">性别</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("ssex") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">年龄</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("sage") %></td>
       </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">出生日期</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("birthday") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">入学时间</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("admissionTime") %></td>
       </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">民族</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("ethnic") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">学历层次</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("edubg") %></td>
       </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">政治面貌</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("political") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">专业方向</td>
	     <td width="150" align="center" bgcolor="#D9FFFF"><%=rs.getString("direction") %></td>
       </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">院系</td>
	     <td colspan="2" align="center" bgcolor="#D9FFFF"><%=rs.getString("college") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">专业</td>
	     <td width="300" align="center" bgcolor="#D9FFFF"><%=rs.getString("department") %></td>
	   </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">行政班</td>
	     <td colspan="2" align="center" bgcolor="#D9FFFF"><%=rs.getString("class") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">身份证号</td>
	     <td width="300" align="center" bgcolor="#D9FFFF"><%=rs.getString("IDcard") %></td>
	   </tr>
       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">电话</td>
	     <td colspan="2" align="center" bgcolor="#D9FFFF"><%=rs.getString("telphone") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">邮箱</td>
	     <td width="300" align="center" bgcolor="#D9FFFF"><%=rs.getString("email") %></td>
	   </tr>

       <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">籍贯</td>
	     <td colspan="2" align="center" bgcolor="#D9FFFF"><%=rs.getString("hometown") %></td>
	     <td width="150" align="center" bgcolor="#D9FFFF">家庭住址</td>
	     <td width="300" align="center" bgcolor="#D9FFFF"><%=rs.getString("homeAddress") %></td>
	   </tr>                     
	</table>
<% }
 %>
    <table  border="0"> 
       <tr>
	     <td width="303" height="40" align="center" bgcolor="#D9FFFF">
	     	<button type="button" onClick="window.location.href='../public/modifyPassword.html'">
	     		修改密码
	     	</button>
	     </td>
	     <td width="303" align="center" bgcolor="#D9FFFF">
	     	<button type="button" onClick="window.location.href='modifyStudentInfo.jsp'">
     			修改个人信息
     		</button>
	     </td>
	     <td width="303" align="center" bgcolor="#D9FFFF">
		     <button type="button" onClick="window.location.href='../public/loginHandle.jsp'">
		     	返回首页
		     </button>   	
	     </td>
       </tr>                  
	</table>
 	</body>
 </html>
<%connectDatabase.close();%>