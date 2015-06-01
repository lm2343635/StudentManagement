function submitVerify()
{
	var user=index.user.value;
	var password=index.password.value;
	var userType=getRadioBoxValue("userType");
	if(userType=="student"&&user.length!=8)
		alert("用户类型错误，学生用户名为8位");
	if(userType=="teacher"&&user.length!=6)
		alert("用户类型错误，教师用户名为6位");
	if(userType=="admin"&&user.length!=3)
		alert("用户类型错误，管理员用户名为3位");
	if(userType=="student"&&user.length==8||userType=="teacher"&&user.length==6||userType=="admin"&&user.length==3)
		document.getElementById("index").submit();
}
function getRadioBoxValue(radioName)  
{   
    var obj = document.getElementsByName(radioName);         
      for(i=0;i<obj.length;i++)    
      {  
          if(obj[i].checked)    
             return  obj[i].value;  
      }          
     return "undefined";        
}  