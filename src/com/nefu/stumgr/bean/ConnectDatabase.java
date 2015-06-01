package com.nefu.stumgr.bean;

import java.sql.*;

public class ConnectDatabase 
{
	public String getDriverName() {
		return driverName;
	}
	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getDbName() {
		return dbName;
	}
	public void setDbName(String dbName) {
		this.dbName = dbName;
	}
	
	String driverName="com.mysql.jdbc.Driver" ;
	String userName="root";
	String userPassword="123456";
	String dbName="student";
	Connection connection=null;
	Statement statement=null;
	
	public ConnectDatabase() throws ClassNotFoundException, SQLException 
	{
			Class.forName(driverName);
			String url="jdbc:mysql://localhost:3306/"+dbName+"?user="+userName+"&password="+userPassword;
			connection=DriverManager.getConnection(url);
			statement=connection.createStatement();
	}
	public ResultSet exeQuery(String sql)
	{
		ResultSet rs=null;
		try {
			rs=statement.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;	
	}
	public int exeUpdate(String sql)
	{
		int flag=0;
		try {
			flag=statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	public void close()
	{
		try {
			statement.close();
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}


