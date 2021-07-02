package com.vehicle;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vehicle.DbConnection;;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("register.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DbConnection db = new DbConnection();
		
		String name =  request.getParameter("name");
		String email =  request.getParameter("email");
		String password =  request.getParameter("password");
		
		
		System.out.println("User name:\t" + request.getParameter("name"));
		System.out.println("User email:\t" + request.getParameter("email"));
		System.out.println("User password:\t" + request.getParameter("password"));
		
		try {
			Connection con = db.makeConnection();
			if(con != null) {
				System.out.print("Connection Successfull");
				
				// Execute SQL query
				String sql;
				sql = "INSERT INTO users (name, email, password) VALUES ('" + name + "', '" + email + "', '" + password + "')";
				PreparedStatement st = con.prepareStatement(sql);
				st.executeUpdate();
				response.sendRedirect("login");
			}
		} catch(Exception e){};
		
	}

}
