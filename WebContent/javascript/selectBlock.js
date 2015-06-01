var aLi=document.getElementById("tabs").getElementsByTagName("li");
var aDiv=document.getElementById("content").getElementsByTagName("div");
for(var i=0;i<aLi.length;i++)
{
	aLi[i].index=aDiv[i].index=i;      		
	aLi[i].onclick=function()
	{
		var index=this.index;
		for(var j=0;j<aDiv.length;j++)
		    aDiv[j].className="hide";
		aDiv[index].className="";
	};
}