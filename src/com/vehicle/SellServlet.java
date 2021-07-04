package com.vehicle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sell")
public class SellServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Check if the user already has vehicles registered
		DbConnection db = new DbConnection();
		HttpSession session = request.getSession();
		
		ArrayList<Vehicle> vehicleList = new ArrayList<Vehicle>();
		
		try {
			Connection con = db.makeConnection();
			if(con != null) {
				System.out.print("Connection Successfull");
				
				// Execute SQL query
		         Statement st = con.createStatement();
		         String sql;
		         sql = "SELECT * FROM vehicle WHERE user_id=" + session.getAttribute("user_id") + " AND avail='true'";
		         ResultSet rs = st.executeQuery(sql);
		         
		         // Extract data from result set
		         if(!rs.isBeforeFirst()) {
		        	 System.out.println("No vehicles FOund");
		        	 request.setAttribute("vehicleList", vehicleList);
		        	 RequestDispatcher rd = request.getRequestDispatcher("sell.jsp");
		     		 rd.forward(request, response);
		         } else {
		        	 while(rs.next()){
		        		Vehicle vehicle = new Vehicle();
		        		 
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
				        
				        
				        vehicle.setV_id(v_id);
		        		vehicle.setOwner_id(owner_id);
		        		vehicle.setType(type);
		        		vehicle.setModel(model);
		        		vehicle.setColor(color);
		        		vehicle.setReg_date(reg_date);
		        		vehicle.setImage(image);
		        		vehicle.setPrice(price);
		        		vehicle.setArea(area);
		        		vehicle.setCity(city);
		        		vehicle.setState(state);
		        		vehicle.setZip(zip);
		        		vehicle.setFuel_type(fuel_type);
		        		vehicle.setGear(gear);
		        		vehicle.setAvail(avail);
				        
				        // Add vehicle objects to vehicleList
				        vehicleList.add(vehicle);
				        request.setAttribute("vehicleList", vehicleList);
						RequestDispatcher rd = request.getRequestDispatcher("sell.jsp");
						rd.forward(request, response);
		        	 }
		         }
			}
		} catch(Exception e){};
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		// Owner Details
		String name = request.getParameter("name");
		String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
		
        // Vehicle Details
		int type = Integer.parseInt(request.getParameter("type"));
		String model = request.getParameter("model");
		String color = request.getParameter("color");
        String reg_date = request.getParameter("reg_date");
        String image = request.getParameter("image");
        float price = Float.parseFloat(request.getParameter("price"));
        String area = request.getParameter("area");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zip = request.getParameter("zip");
        String fuel_type = request.getParameter("fuel_type");
        String gear = request.getParameter("gear");
        boolean avail = true;
		
		try {
			DbConnection db = new DbConnection();
			Connection con = db.makeConnection();
			if(con != null) {
				System.out.print("Connection Successfull");
				
				// Execute SQL query
				Statement stCount = con.createStatement();
				String sqlCount;
				sqlCount = "SELECT * FROM owner";
				ResultSet rsCount = stCount.executeQuery(sqlCount);
				int ownerCount = 0;
				while(rsCount.next()) {
					out.println("Owner_id" + rsCount.getInt("owner_id"));
					ownerCount++;
				}

				int newOwnerCount = ownerCount+1;
				
				// Execute SQL query for Owner
				String sqlOwner;
				sqlOwner = "INSERT INTO owner (owner_id, name, address, phone, email, user_id) VALUES (" + newOwnerCount + ", '" + name + "', '" + address + "', '" + phone + "', '" + email + "'" + ", " + session.getAttribute("user_id") + ");";
				PreparedStatement stOwn = con.prepareStatement(sqlOwner);
				stOwn.executeUpdate();
			
				// Execute SQL query for Vehicle
				String sql;
				sql = "INSERT INTO vehicle (type, model, color, reg_date, image, price, area, city, state, zip, owner_id, fuel_type, gear, avail, user_id) VALUES (" + type + ", '" +  model + "', '" + color + "', '" + reg_date + "', '" + image + "', " + price + ", '" + area + "', '" + city + "', '" + state + "', '" + zip + "', " + newOwnerCount + ", '" + fuel_type + "', '" + gear + "', '" + avail + "', " + session.getAttribute("user_id") + ")";
				PreparedStatement st = con.prepareStatement(sql);
				st.executeUpdate();
				
				System.out.println("All Queries executed!!");
				response.sendRedirect("/Vehicle/sell");
			}
		} catch(Exception e){};
	}

}
