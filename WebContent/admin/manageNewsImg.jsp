<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<html>
	<head>
		<title>管理滚动图片</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/hover.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"/>
		<table  border="0" style="border-spacing:0">
		   <tr>
			  <td width="272" height="40" align="center" bgcolor="#0000FF" class="block">
			  	 <a href="news.jsp"><myfont>管理新闻</myfont></a>     
			  </td>
			  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
			  <td width="272" align="center" bgcolor="#0000FF" class="block">
			 	 <a href="addNews.jsp"><myfont>新增新闻</myfont></a>     
			  </td>
			  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
			  <td width="272" align="center" bgcolor="#009933" class="block">
			 	 <a href="manageNewsImg.jsp"><myfont>管理滚动图片</myfont></a>     
			  </td>
		    </tr>   		
		   	<tr>
			   <td colspan="5" width="800" height="8" align="center"  bgcolor="#009933"></td>
			</tr>
		</table>
		<form enctype="multipart/form-data" method="post" action="../servletUpload?uploader=manageNewsImg" style="margin: 0;padding: 0;">
			 <table  border="0">
			 		<tr>
				     <td colspan="2" width="825" height="40"  align="center" bgcolor="#0000FF"><myfont>上传照片</myfont></td>
			       </tr>
			       <tr>
				     <td height="40"  align="center" bgcolor="#D9FFFF">
			     	 选择照片(仅限jpg格式,比例尽量接近4:3,<strong style="color: #FF0000">文件名必须为英文</strong>)： </td>
				     <td height="40"align="center" bgcolor="#D9FFFF">
				     	<input type="file" name="ulfile"> 
				     </td>
			       </tr>
			       <tr>
				     <td height="40"  colspan="2" align="center" bgcolor="#D9FFFF">
						 <input type="submit" value="上传">
						 <input type="reset" value="清除">
				     </td>
			       </tr>
			 </table>			 
		 </form>
		<table  border="0">
		   <tr>
			     <td width="200" height="40" align="center" bgcolor="#0000FF"><myfont>发布时间</myfont></td>
			     <td width="150" height="40" align="center" bgcolor="#0000FF"><myfont>文件名</myfont></td>
			     <td height="40" align="center" bgcolor="#0000FF"><myfont>预览</myfont></td>
			     <td width="150"  height="40" align="center" bgcolor="#0000FF"><myfont>管理</myfont></td>
		   </tr>
		   	<%
		   	String searchNewsImg="select * from newsimg order by iTime desc";
		   	ResultSet rs=connectDatabase.exeQuery(searchNewsImg);
			while(rs.next())
			{%>
				  <tr>
					     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("iTime") %></td>
					     <td height="40" align="center" bgcolor="#D9FFFF"><%=rs.getString("iFile") %></td>
					     <td  align="center" bgcolor="#D9FFFF">
					     	<img style="margin: 22px;" width="268" height="190" src="../newsImg/<%=rs.getString("iFile") %>"/>
					     </td>
					     <td height="40" align="center" bgcolor="#D9FFFF">
					     	<a href="deleteNewsImg.jsp?iTime=<%=rs.getString("iTime")%>&iFile=<%=rs.getString("iFile") %>">删除</a>
					     </td>
				  </tr>
			<%		
			}
			%>
		</table>
	</body>
</html>