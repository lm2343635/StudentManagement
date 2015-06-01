									var container=document.getElementById("container");
									var aTabsLi=document.getElementById("tabs").getElementsByTagName("li");
									var aContentDiv=document.getElementById("content").getElementsByTagName("div");
									var aArrowSpan=document.getElementById("arrow").getElementsByTagName("span");
									var index=0;		
									var timer;
									for(var i=0;i<aTabsLi.length;i++)
									{
										aTabsLi[i].index=aContentDiv[i].index=i;
										aTabsLi[i].onclick=function()
										{
											showImg(this.index);
										};
									}		
									aArrowSpan[0].onclick=function()
									{
										index--;
										if(index<0)
											index=aTabsLi.length-1;
										showImg(index);				
									};
									aArrowSpan[1].onclick=function()
									{
										index++;
										if(index>aTabsLi.length-1)
											index=0;
										showImg(index);
									};						
									function showImg(index)
									{
										for(var j=0;j<aTabsLi.length;j++)
										{
											aContentDiv[j].className="";
										    aTabsLi[j].className="";
										}
										aContentDiv[index].className="on";
										aTabsLi[index].className="on";
									}	
						
									function autoSwitch()
									{
										timer=setInterval(
												function()
												{
													aArrowSpan[1].onclick();
												},2000);
									}
									
									container.onmouseover=function()
									{
										clearInterval(timer);
									};
									container.onmouseout=function()
									{
										autoSwitch();
									};
									autoSwitch();