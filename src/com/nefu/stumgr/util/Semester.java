package com.nefu.stumgr.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Semester 
{
	public int getSemester(String sno)
	{
        int admissionTime=Integer.parseInt(sno.substring(0, 4));
 		Date now = new Date();
 		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
 		String nowTime = dateFormat.format(now);
 		String[] nowTimeArray=nowTime.split("-");
 		int nowYear=Integer.parseInt(nowTimeArray[0]);
 		int nowMonth=Integer.parseInt(nowTimeArray[1]);
 		int semester=0;
 		if(nowYear==admissionTime)
 		{
 			if(nowMonth>=9&&nowMonth<=12)
 				semester=1;			
 		}
 		else if(nowYear==admissionTime+1)
 		{
 			if(nowMonth>=3&&nowMonth<=6)
 				semester=2;
 			else if(nowMonth>=9&&nowMonth<=12)
 				semester=3;
 		}
 		else if(nowYear==admissionTime+2)
 		{
 			if(nowMonth>=3&&nowMonth<=6)
 				semester=4;
 			else if(nowMonth>=9&&nowMonth<=12)
 				semester=5;
 		}
 		else if(nowYear==admissionTime+3)
 		{
 			if(nowMonth>=3&&nowMonth<=6)
 				semester=6;
 			else if(nowMonth>=9&&nowMonth<=12)
 				semester=7;
 		}
 		else if(nowYear==admissionTime+4)
 		{
 			if(nowMonth>=3&&nowMonth<=6)
 				semester=8;
 		}
 		return semester;	
	}
}
