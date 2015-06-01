<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />
<%
ResultSet rs=connectDatabase.exeQuery("select * from college");	
rs.last();
int coCount=rs.getRow();
String cono[]=new String [coCount];
String coname[]=new String [coCount];
int i=0;
rs=connectDatabase.exeQuery("select * from college");	
while(rs.next())
{
	cono[i]=rs.getString("cono");
 	coname[i]=rs.getString("coname");
	i++;
}
rs=connectDatabase.exeQuery("select * from department");	
rs.last();
int deCount=rs.getRow();
String dcono[]=new String [deCount];
String dname[]=new String [deCount];
rs=connectDatabase.exeQuery("select * from department");	
i=0;
while(rs.next())
{
	dcono[i]=rs.getString("cono");
	dname[i]=rs.getString("dname");
	i++;
}
String department="";
for(i=0;i<deCount;i++)
	department+=dcono[i]+"-"+dname[i]+",";
department=department.substring(0, department.length()-1);
String sno=(String)session.getAttribute("user");
String grade=sno.substring(0,4);
%>
<tr>
	<td height="40" align="center" bgcolor="#D9FFFF">院系</td>
	<td align="center" bgcolor="#D9FFFF">
		<select name="college"  id="co" onchange="getDepartment()">
			<option value="null" selected>请选择院系</option>
			<%
			for(i=0;i<coCount;i++)
			{
			%>
			<option value="<%=cono[i]%>" ><%=coname[i]%></option>
			<%
			}
			%>
		</select>
	</td>
	<td align="center" bgcolor="#D9FFFF">专业</td>
	<td colspan="300" align="center" bgcolor="#D9FFFF">
		<select name="department" id="de" onchange="getClass()">
			<option value="null"  id="deSelected" selected>请先选择院系</option>
		</select>	     
	</td>
</tr>
<tr>
	<td height="40" align="center" bgcolor="#D9FFFF">行政班</td>
	<td align="center" bgcolor="#D9FFFF">
		<select name="class" id="ca" >
			<option value="null" id="caSelected" selected>请先选择专业</option>
		</select>	   
	</td>
	<td align="center" bgcolor="#D9FFFF">专业方向</td>
	<td align="center" bgcolor="#D9FFFF"><input type="text" name="direction" ></td>
</tr>

<script type="text/javascript">
	function getDepartment()
	{
		//获取系名称和对应的学院号
		var dcono=new Array();
		var dname=new Array();
		var department="<%=department%>";
		var departments=new Array();
		var buffer=new Array();
		departments=department.split(",");
		for(var i=0;i<departments.length;i++)
		{
			buffer=departments[i].split("-");
			dcono[i]=buffer[0];
			dname[i]=buffer[1];
		}
	  	var sltcollage=document.getElementById("co");
	  	var sltdepartment=document.getElementById("de");
	  	var cono="";
		cono=modifyStudentInfo.college.value;
		
		var index = sltdepartment.selectedIndex;
		sltdepartment.options.remove(index);
		sltdepartment[0]=new Option("请选择专业","null");
		
		var n=1;
		for(var i=0;i<departments.length;i++)
		{
			if(dcono[i]==cono)
				{
					sltdepartment[n]=new Option(dname[i],dname[i]);
					n++;
				}		
		}
	}
	function getClass()
	{
		var sltdepartment=document.getElementById("de");
		var sltclass=document.getElementById("ca");
	  	var dname="";
		dname=modifyStudentInfo.department.value;
		var className="";
		var grade="<%=grade%>";
		
		var index = sltclass.selectedIndex;
		sltclass.options.remove(index);
		sltclass[0]=new Option("请选择班级","null");
		
		for(var i=1;i<6;i++)
		{
			className=dname+grade+"-0"+i;
			sltclass[i]=new Option(className,className);
		}
	}
</script>

