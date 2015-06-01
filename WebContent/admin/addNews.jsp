<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
 <jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<html>
	<head>
		<title>新增新闻</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/hover.css" type="text/css">
	</head>
	<body>
		<center>
		<img src="../images/top.jpg"><br>
		<jsp:include page="header.jsp"/>
		<form action="addNewsHandle.jsp">
		<table  border="0" style="border-spacing:0">
		   <tr>
			  <td width="272" height="40" align="center" bgcolor="#0000FF" class="block">
			  	 <a href="news.jsp"><myfont>管理新闻</myfont></a>     
			  </td>
			  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
			  <td width="272" align="center" bgcolor="#009933" class="block">
			 	 <a href="addNews.jsp"><myfont>新增新闻</myfont></a>     
			  </td>
			  <td width="1" height="40" align="center" bgcolor="#FFFFFF" class="block"></td>
			  <td width="272" align="center" bgcolor="#0000FF" class="block">
			 	 <a href="manageNewsImg.jsp"><myfont>管理滚动图片</myfont></a>     
			  </td>
		    </tr>   		
		   	<tr>
			   <td colspan="5" width="800" height="8" align="center"  bgcolor="#009933"></td>
			</tr>
		</table>
		<table  border="0">
			     <tr>
			       <td height="40" colspan="2" align="center" bgcolor="#0000FF">
			      	 <myfont>发布新闻</myfont>
			       </td>
			     </tr>
				 <tr>
				     <td width="320" height="40" align="center" bgcolor="#D9FFFF">新闻标题</td>
				     <td width="500" height="40" align="center" bgcolor="#D9FFFF">
				     	<input type="text" name="title" />
				     </td>
				 </tr>
				 <tr>
				 	<td colspan="2" align="center" bgcolor="#D9FFFF">
			      	 <p style="margin: 5px;">新闻内容</p>
			      	 <textarea rows="20" cols="90" name="content">请在这里填写新闻内容！</textarea>
			      	 <br/>
			      	 <input type="submit" value="提交"/>
			      	 <input type="reset" value="重置"/>
			       </td>
				 </tr>

		</table>
		</form>
	</body>
</html>