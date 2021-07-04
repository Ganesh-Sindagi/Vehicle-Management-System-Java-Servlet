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

@WebServlet("/orders")
public class OrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DbConnection db = new DbConnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		ArrayList<Booking> bookingList = new ArrayList<Booking>();
		ArrayList<Vehicle> vehicleList = new ArrayList<Vehicle>();
		
		try {
			Connection con = db.makeConnection();
			if(con != null) {
				System.out.print("Connection Successfull");
				
				// Execute SQL query
		         Statement st = con.createStatement();
		         String sql;
		         sql = "SELECT * FROM booking WHERE user_id=" + session.getAttribute("user_id");
		         ResultSet rs = st.executeQuery(sql);
		         
		         // Extract data from result set
		         if(!rs.isBeforeFirst()) {
		        	 out.println("No Bookings Found");
		         } else {
		        	 while(rs.next()){
		        		Booking booking = new Booking();
		        		 
		        		int booking_id = rs.getInt("booking_id");
		        		int user_id = rs.getInt("user_id");
		        		int owner_id = rs.getInt("owner_id");
		        		int vehicle_id = rs.getInt("vehicle_id");
		        		String date = rs.getString("date");
		        		
		        		booking.setBooking_id(booking_id);
		        		booking.setUser_id(user_id);
		        		booking.setOwner_id(owner_id);
		        		booking.setVehicle_id(vehicle_id);
		        		booking.setDate(date);
		        		
				        // Print the values
		        		out.println("Booking_id" + booking_id);
		        		out.println("user_id" + user_id);
		        		out.println("owner_id" + owner_id);
		        		out.println("vehicle_id" + vehicle_id);
		        		out.println("date" + date);
		        		
				        // Add car objects to carList
				        bookingList.add(booking);
				        
				        // Execute SQL query for getting vehicles
				        Statement stV = con.createStatement();
				        String sql_V = "SELECT * FROM vehicle WHERE v_id=" + vehicle_id;
				        ResultSet rsV = stV.executeQuery(sql_V);
				        
				        System.out.println("Booking queries Executed");
				        
				        while(rsV.next()){
				        	Vehicle vehicle = new Vehicle();
				        	System.out.println("Entered inside while loop");
			        		int v_id = rsV.getInt("v_id");
			        		int owner_id_V = rsV.getInt("owner_id");
			        		int type = rsV.getInt("type");
			        		String model = rsV.getString("model");
			        		String color = rsV.getString("color");
					        String reg_date = rsV.getString("reg_date");
					        String image = rsV.getString("image");
					        float price = Float.parseFloat(rsV.getString("price"));
					        String area = rsV.getString("area");
					        String city = rsV.getString("city");
					        String state = rsV.getString("state");
					        String zip = rsV.getString("zip");
					        String fuel_type = rsV.getString("fuel_type");
					        String gear = rsV.getString("gear");
					        boolean avail = Boolean.parseBoolean(rsV.getString("avail"));
					        
					        vehicle.setV_id(v_id);
					        vehicle.setOwner_id(owner_id_V);
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
					        
					        // Add car objects to carList
			        		vehicleList.add(vehicle);
			        		
			        		System.out.println("All queries Executed");
				        }
				         
		        	 }
		         }
			}
		} catch(Exception e){};
		
		request.setAttribute("bookingList", bookingList);
		request.setAttribute("vehicleList", vehicleList);
		RequestDispatcher rd = request.getRequestDispatcher("orders.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int v_id =  Integer.parseInt(request.getParameter("vehicle_id"));
		int booking_id =  Integer.parseInt(request.getParameter("booking_id"));
		
		try {
			DbConnection db = new DbConnection();
			Connection con = db.makeConnection();
			if(con != null) {
				System.out.print("Connection Successfull");
				
				// Execute SQL query for Deleting Booking
				String sqlBooking = "DELETE FROM booking WHERE booking_id=" + booking_id;
				PreparedStatement stBooking = con.prepareStatement(sqlBooking);
				stBooking.executeUpdate();
					
				// Execute SQL query for updating vehicle availability
				String sql;
				sql = "UPDATE vehicle SET avail='true' WHERE v_id=" + v_id;
				PreparedStatement st = con.prepareStatement(sql);
				st.executeUpdate();
				
				System.out.println("All UPDATE AND DELETE Queries executed!!");
				response.sendRedirect("/Vehicle/orders");
			}
		} catch(Exception e){};
		
	}

}
