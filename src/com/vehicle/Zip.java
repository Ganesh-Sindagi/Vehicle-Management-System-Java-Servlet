package com.vehicle;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Zip {
	String zip;

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}
	
	public ArrayList<Zip> fetchZipCar() {
		DbConnection db = new DbConnection();
		
		ArrayList<Zip> zipList = new ArrayList<Zip>();
	
		try {
			Connection con = db.makeConnection();
			if(con != null) {
				System.out.print("Connection Successfull");
				
				// Execute SQL query
		         Statement stArea = con.createStatement();
		         String sqlArea;
		         sqlArea = "SELECT DISTINCT zip FROM vehicle WHERE type=4";
		         ResultSet rsArea = stArea.executeQuery(sqlArea);
		         
		         // Extract data from result set
		         if(!rsArea.isBeforeFirst()) {
		        	 return null;
		         } else {
		        	 while(rsArea.next()){
		        		Zip zip = new Zip();
		        		
		        		String zipRes = rsArea.getString("zip");
		        		zip.setZip(zipRes);
				        
				        // Add area objects to areaList
		        		zipList.add(zip);
		        	 }
		         }
			}
		} catch(Exception e){};
		
		return zipList;
	}
	
	public ArrayList<Zip> fetchZipBike() {
		DbConnection db = new DbConnection();
		
		ArrayList<Zip> zipList = new ArrayList<Zip>();
	
		try {
			Connection con = db.makeConnection();
			if(con != null) {
				System.out.print("Connection Successfull");
				
				// Execute SQL query
		         Statement stArea = con.createStatement();
		         String sqlArea;
		         sqlArea = "SELECT DISTINCT zip FROM vehicle WHERE type=2";
		         ResultSet rsArea = stArea.executeQuery(sqlArea);
		         
		         // Extract data from result set
		         if(!rsArea.isBeforeFirst()) {
		        	 return null;
		         } else {
		        	 while(rsArea.next()){
		        		Zip zip = new Zip();
		        		
		        		String zipRes = rsArea.getString("zip");
		        		zip.setZip(zipRes);
				        
				        // Add area objects to areaList
		        		zipList.add(zip);
		        	 }
		         }
			}
		} catch(Exception e){};
		
		return zipList;
	}
}
