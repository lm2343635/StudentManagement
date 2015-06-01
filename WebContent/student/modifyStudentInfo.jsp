<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connectDatabase" class="com.nefu.stumgr.bean.ConnectDatabase" />

<html>
<head>
	<title>修改个人信息</title>
	<link rel="stylesheet" rev="stylesheet" href="../css/home.css" type="text/css">
	<link rel="stylesheet" rev="stylesheet" href="../css/myfont.css" type="text/css">
</head>
<body>
	<center>
	<img src="../images/top.jpg"><br>
	<jsp:include page="header.jsp"/>	
    <form action="modifyStudentInfoHandle.jsp" method="post"  name="modifyStudentInfo">
    <table width="914"  border="0">
       <tr>
	     <td height="40" colspan="6" align="center" bgcolor="#0000FF">
	     	<myfont>基本信息（ 请修改个人信息，若不修改则置空）</myfont>	
	     </td>
       </tr> 
	   <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">姓名</td>
	     <td width="300" align="center" bgcolor="#D9FFFF">
	     	<input type="text" name="sname" >
	     </td>
	     <td width="150" align="center" bgcolor="#D9FFFF">年龄</td>
	     <td width="300" align="center" bgcolor="#D9FFFF">
	         <select name="sage">
	         <option value="null" selected></option>
	         <%
	            for(int i=0;i<=100;i++)
	        	 {
	        	 %>
	        	 <option value="<%=i %>" ><%=i %></option>
	        	 <%
	        	 }
	             %>
	         </select>岁
         </td>
	   </tr>   
	   <tr>
	     <td height="40" align="center" bgcolor="#D9FFFF">性别</td>
	     <td align="center" bgcolor="#D9FFFF">
		     <input type="radio" name="ssex" value="male" >男
	         <input type="radio" name="ssex" value="female">女
	     </td>
	     <td align="center" bgcolor="#D9FFFF">照片</td>
	     <td align="center" bgcolor="#D9FFFF">
	     	<a href="../public/uploadPhoto.jsp">点击上传照片</a>
         </td>
       </tr>
	   <tr>
	     <td width="150" height="40" align="center" bgcolor="#D9FFFF">出生日期</td>
	     <td width="300" align="center" bgcolor="#D9FFFF">
	         <select name="birthdayYear">
	         <option value="-1" selected></option>
	         <%         
	         for(int i=1985;i<=2013;i++)
	        	 {
                 %><option value="<%=i %>" ><%=i %></option><%
	        	 }
	         %>
	         </select>年
	         <select name="birthdayMonth">
	         <option value="-1" selected></option>
	         <%
	         for(int i=1;i<=12;i++)
	        	 {
                 %><option value="<%=i %>" ><%=i %></option><%
	        	 }
	         %>
	         </select>月
	         <select name="birthdayDay">
	         <option value="-1" selected></option>
	         <%
	         for(int i=1 ;i<=31;i++)
	        	 {
	        	 %><option value="<%=i %>" ><%=i %></option><%
	        	 }
	         %>
	         </select>日
         </td>
	     <td width="150" align="center" bgcolor="#D9FFFF">入学时间</td>
	     <td align="center" bgcolor="#D9FFFF">
	     	<select name="admissionTimeYear">
	     	<option value="-1" selected></option>
	         <%
	         for(int i=2005;i<=2013;i++)
	        	 {
                 %><option value="<%=i %>" ><%=i %></option><%
	        	 }
	         %>
	         </select>年
	         <select name="admissionTimeMonth">
	         <option value="-1" selected></option>
	         <%
	         for(int i=1;i<=12;i++)
	        	 {
                 %><option value="<%=i %>" ><%=i %></option><%
	        	 }
	         %>
	         </select>月
	         <select name="admissionTimeDay">
	         <option value="-1" selected></option>
	         <%
	         for(int i=1 ;i<=31;i++)
	        	 {
	        	 %><option value="<%=i %>" ><%=i %></option><%
	        	 }
	         %>
	         </select>日
         </td>
       </tr> 
	   <tr>
	     <td height="40" align="center" bgcolor="#D9FFFF">民族</td>
	     <td align="center" bgcolor="#D9FFFF">
	     	 <select name="ethnic">
	     	 <option value="null" selected></option>
	         <%
	         String ethnic[]={
                      "汉族","满族","回族","蒙古族","藏族","苗族","彝族","壮族",
	    	         "侗族","瑶族","白族","傣族","黎族","佤族","畲族",   
	    	         "水族", "土族","羌族","怒族","京族" 
	  	           ,"布衣族","朝鲜族","土家族","哈尼族","僳僳族","高山族",  
		           "拉祜族","东乡族","纳西族","景颇族","仫佬族","布朗族","撒拉族",
		           "毛南族","仡佬族","锡伯族","阿昌族","普米族","德昂族","保安族", 
		           "裕固族","独龙族","赫哲族","门巴族","珞巴族","基诺族",        
		           "维吾尔族","哈萨克族","达斡尔族","塔吉克族","塔塔尔族", 
		           "鄂伦春族","俄罗斯族","鄂温克族","乌孜别克族","柯尔克孜族"	    	         
	         };
           

	         for(int i=0 ;i<ethnic.length;i++)
	        	 {
	        	 %><option value="<%=ethnic[i]%>" ><%=ethnic[i] %></option><%
	        	 }
	         %>
	         </select>
         </td>
	     <td align="center" bgcolor="#D9FFFF">学历层次</td>
	     <td align="center" bgcolor="#D9FFFF">
	         <select name="edubg">
	         <option value="null" selected></option>
	         <%
	         String edubg[]={"高中","本科","硕士","博士"};
	         for(int i=0 ;i<edubg.length;i++)
	        	 {
	        	 %><option value="<%=edubg[i]%>" ><%=edubg[i] %></option><%
	        	 }
	         %>
	         </select>
	     </td>
      </tr>
	   <tr>
	     <td height="40" align="center" bgcolor="#D9FFFF">政治面貌</td>
	     <td align="center" bgcolor="#D9FFFF">
	     	 <select name="political">
	     	 <option value="null" selected></option>
	         <%
	         String political[]={"群众","团员","党员"};
	         for(int i=0 ;i<political.length;i++)
	        	 {
	        	 %><option value="<%=political[i]%>" ><%=political[i] %></option><%
	        	 }
	         %>
	         </select>
         </td>
         <td align="center" bgcolor="#D9FFFF">身份证号</td>
	     <td align="center" bgcolor="#D9FFFF"><input type="text" name="IDcard" ></td>
      </tr>

      <jsp:include page="CoDeInfo.jsp"/>	

	   <tr>
	     <td height="40" align="center" bgcolor="#D9FFFF">电话</td>
	     <td align="center" bgcolor="#D9FFFF"><input type="text" name="telphone" ></td>
	     <td align="center" bgcolor="#D9FFFF">邮箱</td>
	     <td align="center" bgcolor="#D9FFFF"><input type="text" name="email" ></td>
      </tr>
	   <tr>
	     <td height="40" align="center" bgcolor="#D9FFFF">籍贯</td>
	     <td align="center" bgcolor="#D9FFFF"><input type="text" name="hometown" ></td>
	     <td align="center" bgcolor="#D9FFFF">家庭住址</td>
	     <td align="center" bgcolor="#D9FFFF"><input type="text" name="homeAddress" ></td>
      </tr>      
      
	</table>
	<input type="submit" value="修改">
    <input type="reset" value="重置">
    </form>
</body>
</html>




