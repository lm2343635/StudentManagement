package com.nefu.stumgr.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Grades {
	public static int [] getGrades()
	{
 		Date now = new Date();
 		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
 		String nowTime = dateFormat.format(now);
 		String[] nowTimeArray=nowTime.split("-");
 		int year=Integer.parseInt(nowTimeArray[0]);
 		int month=Integer.parseInt(nowTimeArray[1]);
 		int grades[]={0,0,0,0};
 		if(month<8)//2013  2009 2010 2011 2012
 		{
 			grades[0]=year-4;
 			grades[1]=year-3;
 			grades[2]=year-2;
 			grades[3]=year-1;
 		}
 		else//2013 2010 2011 2012 2013
 		{
 			grades[0]=year-3;
 			grades[1]=year-2;
 			grades[2]=year-1;
 			grades[3]=year;
 		}
		return grades;
	}
}
