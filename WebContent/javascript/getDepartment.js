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
	  	var sltmajor=document.getElementById("de");
	  	var cono="";
		cono=modifyStudentInfo.college.value;
		var n=1;
		for(var i=0;i<departments.length;i++)
		{
			if(dcono[i]==cono)
				{
					sltmajor[n]=new Option(dname[i]);
					n++;
				}		
		}
	}