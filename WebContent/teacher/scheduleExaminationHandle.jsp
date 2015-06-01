<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
Date date=new Date();
int nowYear=date.getYear()+1900;
request.setCharacterEncoding("gb2312");
String tno=(String)session.getAttribute("user");
ResultSet rs=connectDatabase.exeQuery("select cno from teach where tno="+tno);
ArrayList<String> cnos=new ArrayList<String>();
while(rs.next())
{
	cnos.add(rs.getString("cno"));
}
ArrayList<String> examTimeMonths=new ArrayList<String>();
ArrayList<String> examTimeDays=new ArrayList<String>();
ArrayList<String> cnosSelected=new ArrayList<String>();
for(int i=0;i<cnos.size();i++)
{
	if(!request.getParameter("examTimeMonth"+cnos.get(i)).equals("-1")&&!request.getParameter("examTimeDay"+cnos.get(i)).equals("-1"))
	{
		examTimeMonths.add(request.getParameter("examTimeMonth"+cnos.get(i)));
		examTimeDays.add(request.getParameter("examTimeDay"+cnos.get(i)));
		cnosSelected.add(cnos.get(i));
	}
}
for(int i=0;i<examTimeMonths.size();i++)
{
	if(Integer.parseInt(examTimeMonths.get(i))<10)
		examTimeMonths.set(i, "0"+examTimeMonths.get(i));
	if(Integer.parseInt(examTimeDays.get(i))<10)
		examTimeDays.set(i, "0"+examTimeDays.get(i));	
}
ArrayList<String> examTimes=new ArrayList<String>();
for(int i=0;i<examTimeMonths.size();i++)
	examTimes.add(nowYear+"-"+examTimeMonths.get(i)+"-"+examTimeDays.get(i));
// for(int i=0;i<examTimes.size();i++)
// 	out.print(cnosSelected.get(i)+" "+examTimes.get(i)+"<br/>");
for(int i=0;i<examTimes.size();i++)
{
// 	out.print("update teach set examTime='"+examTimes.get(i)+"' "+
// 			   "where cno="+cnosSelected.get(i)+" and tno="+tno+"<br/>");
	connectDatabase.exeUpdate("update teach set examTime='"+examTimes.get(i)+"' "+
			   "where cno="+cnosSelected.get(i)+" and tno="+tno);
}
	
response.setHeader("Refresh", "2;URL='../teacher/scheduleExamination.jsp'");
%>

<html>
	<head>
		<title>考试时间预定</title>
		<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
		<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
	</head>
	<body>
		<center>
 		<img src="../images/top.jpg"><br>
 		<jsp:include page="../teacher/header.jsp"/>
		预定时间成功，2秒后返回。
		</table>
	</body>
</html>
