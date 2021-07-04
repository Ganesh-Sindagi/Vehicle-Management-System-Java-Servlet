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

@WebServlet("/filterareacar")
public class FilterAreaCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/Vehicle/car");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DbConnection db = new DbConnection();
		PrintWriter out = response.getWriter();
		
		String selectedArea = (String)(request.getParameter("area"));
		System.out.println("Price Range:\t" + selectedArea);
		
		// Array List for filters
		Area a = new Area();
		ArrayList<Area> areaList = a.fetchAreaCar();
		
		City c = new City();
		ArrayList<City> cityList = c.fetchCityCar();
		
		ArrayList<Vehicle> carList = new ArrayList<Vehicle>();
		
		try {
			Connection con = db.makeConnection();
			if(con != null) {
				System.out.print("Connection Successfull");
				
				// Execute SQL query
		         Statement st = con.createStatement();
		         String sql;
		         sql = "SELECT * FROM vehicle WHERE type=" + 4 + " AND avail = 'true' AND area='" + selectedArea +"'";
		         ResultSet rs = st.executeQuery(sql);
		         
		         // Extract data from result set
		         if(!rs.isBeforeFirst()) {
		        	 out.println("No Cars FOund");
		         } else {
		        	 while(rs.next()){
		        		Vehicle car = new Vehicle();
		        		 
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
				        
				        
				        car.setV_id(v_id);
		        		car.setOwner_id(owner_id);
		        		car.setType(type);
		        		car.setModel(model);
		        		car.setColor(color);
		        		car.setReg_date(reg_date);
		        		car.setImage(image);
		        		car.setPrice(price);
		        		car.setArea(area);
		        		car.setCity(city);
		        		car.setState(state);
		        		car.setZip(zip);
		        		car.setFuel_type(fuel_type);
		        		car.setGear(gear);
		        		car.setAvail(avail);
				        
				        // Add car objects to carList
				        carList.add(car);
		        	 }
		         }
			}
		} catch(Exception e){};
		
		request.setAttribute("areaList", areaList);
		request.setAttribute("cityList", cityList);
		request.setAttribute("carList", carList);
		RequestDispatcher rd = request.getRequestDispatcher("car.jsp");
		rd.forward(request, response);
	}

}
