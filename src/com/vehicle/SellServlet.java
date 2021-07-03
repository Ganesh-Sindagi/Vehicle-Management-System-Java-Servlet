package com.vehicle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sell")
public class SellServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("sell.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
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
				sqlOwner = "INSERT INTO owner (owner_id, name, address, phone, email) VALUES (" + newOwnerCount + ", '" + name + "', '" + address + "', '" + phone + "', '" + email + "');";
				PreparedStatement stOwn = con.prepareStatement(sqlOwner);
				stOwn.executeUpdate();
			
				// Execute SQL query for Vehicle
				String sql;
				sql = "INSERT INTO vehicle (type, model, color, reg_date, image, price, area, city, state, zip, owner_id, fuel_type, gear, avail) VALUES (" + type + ", '" +  model + "', '" + color + "', '" + reg_date + "', '" + image + "', " + price + ", '" + area + "', '" + city + "', '" + state + "', '" + zip + "', " + newOwnerCount + ", '" + fuel_type + "', '" + gear + "', '" + avail + "')";
				PreparedStatement st = con.prepareStatement(sql);
				st.executeUpdate();
				
				System.out.println("All Queries executed!!");
				response.sendRedirect("/Vehicle/sell");
			}
		} catch(Exception e){};
	}

}
