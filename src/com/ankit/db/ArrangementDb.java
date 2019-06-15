package com.ankit.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class ArrangementDb implements DbData{
	private static Connection conn = null;
	
	private ArrangementDb() {}
	public static Connection getArrangementDb() {
		return conn;
	}
	
	static {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL,USER,PWD);
		} catch (Exception e) {
			System.out.println("Connection failed :"+e);
		}
	}
	public static void main(String[] args) {
		System.out.println(getArrangementDb());
	}


}
