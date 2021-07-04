package com.vehicle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bike")
public class BikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DbConnection db = new DbConnection();
		PrintWriter out = response.getWriter();
		
		// Array List for filters
		Area a = new Area();
		ArrayList<Area> areaList = a.fetchAreaBike();
		
		ArrayList<Vehicle> bikeList = new ArrayList<Vehicle>();
		
		try {
			Connection con = db.makeConnection();
			if(con != null) {
				System.out.print("Connection Successfull");
				
				// Execute SQL query
		         Statement st = con.createStatement();
		         String sql;
		         sql = "SELECT * FROM vehicle WHERE type=" + 2 + " AND avail = 'true'";
		         ResultSet rs = st.executeQuery(sql);
		         
		         // Extract data from result set
		         if(!rs.isBeforeFirst()) {
		        	 out.println("No Bikes FOund");
		         } else {
		        	 while(rs.next()){
		        		Vehicle bike = new Vehicle();
		        		 
		        		int v_id = rs.getInt("v_id");
		        		int owner_id = rs.getInt("owner_id");
		        		int type = rs.getInt("type");
		        		String model = rs.getString("model");
		        		String color = rs.getString("color");
				        String reg_date = rs.getString("reg_date");
				        String image = rs.getString("image");
				        float price = Float.parseFloat(rs.getString("price"));
				        String area = rs.getString("area");
				        String city = rs.getString("city");
				        String state = rs.getString("state");
				        String zip = rs.getString("zip");
				        String fuel_type = rs.getString("fuel_type");
				        String gear = rs.getString("gear");
				        boolean avail = Boolean.parseBoolean(rs.getString("avail"));
				        
				        
				        bike.setV_id(v_id);
		        		bike.setOwner_id(owner_id);
		        		bike.setType(type);
		        		bike.setModel(model);
		        		bike.setColor(color);
		        		bike.setReg_date(reg_date);
		        		bike.setImage(image);
		        		bike.setPrice(price);
		        		bike.setArea(area);
		        		bike.setCity(city);
		        		bike.setState(state);
		        		bike.setZip(zip);
		        		bike.setFuel_type(fuel_type);
		        		bike.setGear(gear);
		        		bike.setAvail(avail);
				        
				        // Print the values
//				        out.println("v_id\t" + v_id);
//				        out.println("owner_id\t" + owner_id);
//				        out.println("type\t" + type);
//				        out.println("model\t" + model);
//				        out.println("color\t" + color);
//				        out.println("reg_date\t" + reg_date);
//				        out.println("image\t" + image);
//				        out.println("price\t" + price);
//				        out.println("area\t" + area);
//				        out.println("city\t" + city);
//				        out.println("state\t" + state);
//				        out.println("zip\t" + zip);
//				        out.println("fuel_type\t" + fuel_type);
//				        out.println("gear\t" + gear);
//				        out.println("avail\t" + avail);
				        
				        // Add bike objects to bikeList
				        bikeList.add(bike);
		        	 }
		         }
			}
		} catch(Exception e){};
		
		request.setAttribute("areaList", areaList);
		request.setAttribute("bikeList", bikeList);
		RequestDispatcher rd = request.getRequestDispatcher("bike.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Handle Post Request
	}

}
