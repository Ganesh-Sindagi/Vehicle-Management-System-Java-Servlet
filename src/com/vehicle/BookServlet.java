package com.vehicle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/book")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		int v_id =  Integer.parseInt(request.getParameter("v_id"));
		int owner_id =  Integer.parseInt(request.getParameter("owner_id"));
		int user_id = (Integer)(session.getAttribute("user_id"));
		
		out.println("Vehicle_id:\t" + v_id);
		out.println("Owner id:\t" + owner_id);
		out.println("User id:\t" + user_id);

		try {
			DbConnection db = new DbConnection();
			Connection con = db.makeConnection();
			if(con != null) {
				System.out.print("Connection Successfull");
				
				// Execute SQL query to update avail value for Vehicle
				String sqlUpdt;
				sqlUpdt = "UPDATE vehicle SET avail='false' WHERE v_id=" + v_id;
				PreparedStatement stUpdt = con.prepareStatement(sqlUpdt);
				stUpdt.executeUpdate();
				
				// Execute SQL query to Book a Vehicle
				String sql;
				sql = "INSERT INTO booking (user_id, owner_id, vehicle_id, date) VALUES (" + user_id + ", " + owner_id + ", " + v_id + ", '" + java.time.LocalDate.now() + "')";
				PreparedStatement st = con.prepareStatement(sql);
				st.executeUpdate();
				System.out.println("Successfully Booked");
				response.sendRedirect("/Vehicle/dashboard");
			}
		} catch(Exception e){};
	}

}
