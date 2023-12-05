package com.lp.dao;

import java.sql.*;
import java.util.*;
import java.io.*;

import com.lp.util.AppUtil;

public class MyConnection 
{
	static Connection con=null;

	public static Connection getConnection()
	{
		try
		{
			if(con==null)
			{
				InputStream is=MyConnection.class.getResourceAsStream(AppUtil.PROPERTIES_PATH);

				Properties p=new Properties();
				p.load(is);

				String driver=p.getProperty("driver").trim();
				String url=p.getProperty("url").trim();
				String username=p.getProperty("username").trim();
				String password=p.getProperty("password").trim();

				Class.forName(driver);
	
				con=DriverManager.getConnection(url,username,password);
			}
			return con;
		}
		catch (SQLException se)
		{
			se.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();

		}
		
		return con;
	}
}
