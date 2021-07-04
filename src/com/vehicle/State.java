package com.vehicle;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class State {
	String state;

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	public ArrayList<State> fetchStateCar() {
		DbConnection db = new DbConnection();
		
		ArrayList<State> stateList = new ArrayList<State>();
	
		try {
			Connection con = db.makeConnection();
			if(con != null) {
				System.out.print("Connection Successfull");
				
				// Execute SQL query
		         Statement stArea = con.createStatement();
		         String sqlArea;
		         sqlArea = "SELECT DISTINCT state FROM vehicle WHERE type=4";
		         ResultSet rsArea = stArea.executeQuery(sqlArea);
		         
		         // Extract data from result set
		         if(!rsArea.isBeforeFirst()) {
		        	 return null;
		         } else {
		        	 while(rsArea.next()){
		        		State state = new State();
		        		
		        		String stateRes = rsArea.getString("state");
		        		state.setState(stateRes);
				        
				        // Add area objects to areaList
		        		stateList.add(state);
		        	 }
		         }
			}
		} catch(Exception e){};
		
		return stateList;
	}
	
	public ArrayList<State> fetchStateBike() {
		DbConnection db = new DbConnection();
		
		ArrayList<State> stateList = new ArrayList<State>();
	
		try {
			Connection con = db.makeConnection();
			if(con != null) {
				System.out.print("Connection Successfull");
				
				// Execute SQL query
		         Statement stArea = con.createStatement();
		         String sqlArea;
		         sqlArea = "SELECT DISTINCT state FROM vehicle WHERE type=2";
		         ResultSet rsArea = stArea.executeQuery(sqlArea);
		         
		         // Extract data from result set
		         if(!rsArea.isBeforeFirst()) {
		        	 return null;
		         } else {
		        	 while(rsArea.next()){
		        		State state = new State();
		        		
		        		String stateRes = rsArea.getString("state");
		        		state.setState(stateRes);
				        
				        // Add area objects to areaList
		        		stateList.add(state);
		        	 }
		         }
			}
		} catch(Exception e){};
		
		return stateList;
	}
}
