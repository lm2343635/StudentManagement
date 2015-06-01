package com.nefu.stumgr.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.nefu.stumgr.bean.ConnectDatabase;

public class Statistics 
{
	public float getAverageGrade(String sno) throws Exception
	{
		ConnectDatabase connectDatabase=new ConnectDatabase();
		float averageGrade=0;
		//获取课程号 成绩
		ResultSet rs=connectDatabase.exeQuery("select cno,grade from sc where sno="+sno);
		ArrayList<String> cno=new ArrayList<String>();
		ArrayList<String> grade=new ArrayList<String>();
		while(rs.next())
		{
			if(rs.getString("grade")!=null)
			{
				cno.add(rs.getString("cno"));
				grade.add(rs.getString("grade"));
			}
		}
		//获取课程学分
		ArrayList<String> ccredit=new ArrayList<String>();	
		for(int i=0;i<cno.size();i++)
		{
			rs=connectDatabase.exeQuery("select ccredit from course where cno="+cno.get(i));
			if(rs.next())
				ccredit.add(rs.getString("ccredit"));
		}
		//获取学分和
		int ccreditSum=0;
		for(int i=0;i<ccredit.size();i++)
			ccreditSum+=Integer.parseInt(ccredit.get(i));
		//计算加权平均成绩
		int sum=0;
		for(int i=0;i<grade.size();i++)
			sum+=Integer.parseInt(ccredit.get(i))*Integer.parseInt(grade.get(i));
		averageGrade=(float)sum/ccreditSum;
//		for(int i=0;i<cno.size();i++)
//			System.out.println(cno.get(i)+" "+grade.get(i)+" "+ccredit.get(i));
//		System.out.println(sum);
//		System.out.println(ccreditSum);
//		System.out.println(averageGrade);
		return averageGrade;
	}
	
	public float getAveragePoint(String sno) throws ClassNotFoundException, SQLException
	{
		float averagePoint=0;
		ConnectDatabase connectDatabase=new ConnectDatabase();
		//获取课程号 学分
		ResultSet rs=connectDatabase.exeQuery("select cno,grade from sc where sno="+sno);
		ArrayList<String> cno=new ArrayList<String>();
		ArrayList<String> point=new ArrayList<String>();
		int grade=0;
		while(rs.next())
		{
			if(rs.getString("grade")!=null)
			{
				cno.add(rs.getString("cno"));
				grade=Integer.parseInt(rs.getString("grade"));
				if(grade<60)
					point.add("0");
				else if(grade>=60&&grade<65)
					point.add("1");
				else if(grade>=65&&grade<70)
					point.add("1.5");
				else if(grade>=70&&grade<75)
					point.add("2");
				else if(grade>=75&&grade<80)
					point.add("2.5");
				else if(grade>=80&&grade<85)
					point.add("3");
				else if(grade>=85&&grade<90)
					point.add("3.5");
				else if(grade>=90&&grade<95)
					point.add("4");
				if(grade>=95)
					point.add("4.5");				
			}
		}
		//获取课程学分
		ArrayList<String> ccredit=new ArrayList<String>();	
		for(int i=0;i<cno.size();i++)
		{
			rs=connectDatabase.exeQuery("select ccredit from course where cno="+cno.get(i));
			if(rs.next())
				ccredit.add(rs.getString("ccredit"));
		}
		//获取学分和
		int ccreditSum=0;
		for(int i=0;i<ccredit.size();i++)
			ccreditSum+=Integer.parseInt(ccredit.get(i));
		//计算加权绩点
		int sum=0;
		for(int i=0;i<point.size();i++)
			sum+=Integer.parseInt(ccredit.get(i))*Double.parseDouble(point.get(i));
		averagePoint=(float)sum/ccreditSum;
		return averagePoint;
	}
	public String[] getGrade(String sno) throws Exception
	{
		String grades[]={"",""};
		grades[0]=String.valueOf(getAverageGrade(sno));
		grades[1]=String.valueOf(getAveragePoint(sno));
		return grades;
	}
	public static void main(String[] args) throws Exception
	{	
		Statistics s=new Statistics();		
		System.out.println(s.getAverageGrade("20114237"));
		System.out.println(s.getAveragePoint("20114237"));
	}
}
