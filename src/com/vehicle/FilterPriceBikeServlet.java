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

@WebServlet("/filterpricebike")
public class FilterPriceBikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/Vehicle/bike");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DbConnection db = new DbConnection();
		PrintWriter out = response.getWriter();
		
		int price_range = Integer.parseInt(request.getParameter("price_range"));
		System.out.println("Price Range:\t" + price_range);
		
		// Array List for filters
		Area a = new Area();
		ArrayList<Area> areaList = a.fetchAreaBike();		
		
		City c = new City();
		ArrayList<City> cityList = c.fetchCityBike();
		
		State s = new State();
		ArrayList<State> stateList = s.fetchStateBike();
		
		Zip z = new Zip();
		ArrayList<Zip> zipList = z.fetchZipBike();
		
		ArrayList<Vehicle> bikeList = new ArrayList<Vehicle>();
		
		try {
			Connection con = db.makeConnection();
			if(con != null) {
				System.out.print("Connection Successfull");
				
				// Execute SQL query
		         Statement st = con.createStatement();
		         String sql;
		         sql = "SELECT * FROM vehicle WHERE type=" + 2 + " AND avail = 'true' AND price<=" + price_range;
		         ResultSet rs = st.executeQuery(sql);
		         
		         // Extract data from result set
		         if(!rs.isBeforeFirst()) {
		        	 out.println("No bikes FOund");
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
				        
				        // Add bike objects to bikeList
				        bikeList.add(bike);
		        	 }
		         }
			}
		} catch(Exception e){};
		
		request.setAttribute("areaList", areaList);
		request.setAttribute("cityList", cityList);
		request.setAttribute("stateList", stateList);
		request.setAttribute("zipList", zipList);
		request.setAttribute("bikeList", bikeList);
		RequestDispatcher rd = request.getRequestDispatcher("bike.jsp");
		rd.forward(request, response);
	}

}
