package com.vehicle;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Area {
	String area;

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	
	public ArrayList<Area> fetchAreaCar() {
		DbConnection db = new DbConnection();
		
		ArrayList<Area> areaList = new ArrayList<Area>();
	
		try {
			Connection con = db.makeConnection();
			if(con != null) {
				System.out.print("Connection Successfull");
				
				// Execute SQL query
		         Statement stArea = con.createStatement();
		         String sqlArea;
		         sqlArea = "SELECT DISTINCT area FROM vehicle WHERE type=4";
		         ResultSet rsArea = stArea.executeQuery(sqlArea);
		         
		         // Extract data from result set
		         if(!rsArea.isBeforeFirst()) {
		        	 return null;
		         } else {
		        	 while(rsArea.next()){
		        		Area area = new Area();
		        		
		        		String areaRes = rsArea.getString("area");
				        area.setArea(areaRes);
				        
				        // Add area objects to areaList
				        areaList.add(area);
		        	 }
		         }
			}
		} catch(Exception e){};
		
		return areaList;
	}
	
	public ArrayList<Area> fetchAreaBike() {
		DbConnection db = new DbConnection();
		
		ArrayList<Area> areaList = new ArrayList<Area>();
	
		try {
			Connection con = db.makeConnection();
			if(con != null) {
				System.out.print("Connection Successfull");
				
				// Execute SQL query
		         Statement stArea = con.createStatement();
		         String sqlArea;
		         sqlArea = "SELECT DISTINCT area FROM vehicle WHERE type=2";
		         ResultSet rsArea = stArea.executeQuery(sqlArea);
		         
		         // Extract data from result set
		         if(!rsArea.isBeforeFirst()) {
		        	 return null;
		         } else {
		        	 while(rsArea.next()){
		        		Area area = new Area();
		        		
		        		String areaRes = rsArea.getString("area");
				        area.setArea(areaRes);
				        
				        // Add area objects to areaList
				        areaList.add(area);
		        	 }
		         }
			}
		} catch(Exception e){};
		
		return areaList;
	}
}
