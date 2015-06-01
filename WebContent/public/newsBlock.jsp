<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<table id="__01" width="923" height="259" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="4">
			<img src="../images/news_01.gif" width="923" height="33" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/news_02.gif" width="12" height="215" alt=""></td>
		<td width="268" height="215">
			<div id="container">
				<ul id="tabs">
					<li class="on">1</li>
					<li>2</li>
					<li>3</li>
					<li>4</li>
				</ul>
				<div id="content">
					<%
					String searchNewsImg="select iFile from newsimg order by iTime desc";
					ResultSet rsi=connectDatabase.exeQuery(searchNewsImg);
					int newsImgNumber=1;
					ArrayList<String> iFiles=new ArrayList<String>();
		 			while(rsi.next()&&newsImgNumber<=4)
		 			{
						iFiles.add(rsi.getString("iFile"));
		 				newsImgNumber++;
		 			}
					%>
					<div class="on"><img width="268" height="190" src="../newsImg/<%=iFiles.get(0)%>"/></div>
					<%
					for(int i=1;i<4;i++)
					{
					%>
					<div><img width="268" height="190" src="../newsImg/<%=iFiles.get(i)%>"/></div>
					<%
					}
					%>
				</div>
				<div id="arrow">
					<span>&lt;</span>
					<span>&gt;</span>
				</div>
			</div>	
			<script src="../javascript/newsAnimation.js"></script>
		</td>
		<td width="633" height="215" alt="">
			<table border="0"  >
	            <tr>
			           	 <td width="300">新闻标题</td>
			   			 <td width="150">发布者</td>
			    		 <td width="183">发布时间</td>
	 			</tr>

	 			<%
	 			String searchNews="select nid,nname,author,ndate from news order by ndate desc";
	 			ResultSet rs=connectDatabase.exeQuery(searchNews);
	 			int newsNumber=1;
	 			while(rs.next()&&newsNumber<=8)
	 			{
	 				%>
	 			    <tr>
			           	 <td ><a href="../public/news.jsp?nid=<%=rs.getString("nid") %>" ><%=rs.getString("nname")%></a></td>
			   			 <td ><%=rs.getString("author") %></td>
			    		 <td ><%=rs.getString("ndate") %></td>
	 			    </tr>
	 			<% 
	 				newsNumber++;	
	 			}
	 			%>
			</table>
		</td>
		<td>
			<img src="../images/news_05.gif" width="10" height="215" alt=""></td>
	</tr>
	<tr>
		<td colspan="4">
			<img src="../images/news_06.gif" width="923" height="11" alt=""></td>
	</tr>
</table>