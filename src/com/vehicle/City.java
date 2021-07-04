package com.vehicle;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class City {
	String city;

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	public ArrayList<City> fetchCityCar() {
		DbConnection db = new DbConnection();
		
		ArrayList<City> cityList = new ArrayList<City>();
	
		try {
			Connection con = db.makeConnection();
			if(con != null) {
				System.out.print("Connection Successfull");
				
				// Execute SQL query
		         Statement stArea = con.createStatement();
		         String sqlArea;
		         sqlArea = "SELECT DISTINCT city FROM vehicle WHERE type=4";
		         ResultSet rsArea = stArea.executeQuery(sqlArea);
		         
		         // Extract data from result set
		         if(!rsArea.isBeforeFirst()) {
		        	 return null;
		         } else {
		        	 while(rsArea.next()){
		        		City city = new City();
		        		
		        		String cityRes = rsArea.getString("city");
		        		city.setCity(cityRes);
				        
				        // Add area objects to areaList
		        		cityList.add(city);
		        	 }
		         }
			}
		} catch(Exception e){};
		
		return cityList;
	}
	
	public ArrayList<City> fetchCityBike() {
		DbConnection db = new DbConnection();
		
		ArrayList<City> cityList = new ArrayList<City>();
	
		try {
			Connection con = db.makeConnection();
			if(con != null) {
				System.out.print("Connection Successfull");
				
				// Execute SQL query
		         Statement stArea = con.createStatement();
		         String sqlArea;
		         sqlArea = "SELECT DISTINCT city FROM vehicle WHERE type=2";
		         ResultSet rsArea = stArea.executeQuery(sqlArea);
		         
		         // Extract data from result set
		         if(!rsArea.isBeforeFirst()) {
		        	 return null;
		         } else {
		        	 while(rsArea.next()){
		        		City city = new City();
		        		
		        		String cityRes = rsArea.getString("city");
		        		city.setCity(cityRes);
				        
				        // Add area objects to areaList
		        		cityList.add(city);
		        	 }
		         }
			}
		} catch(Exception e){};
		
		return cityList;
	}
}
