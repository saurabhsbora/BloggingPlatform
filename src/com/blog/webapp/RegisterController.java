package com.blog.webapp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 boolean check = false;
		 String name = request.getParameter("name");
		 String email = request.getParameter("email");
	     String pass = request.getParameter("password");
		try
	     {
	        Class.forName("com.mysql.jdbc.Driver"); 
	        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bloggingplatform","root","");
	        PreparedStatement stmt =conn.prepareStatement("select * from users where email=?");
	        stmt.setString(1, email);
	        ResultSet rs = stmt.executeQuery();
	        check = rs.next();
	        if(!check)
	        {
	        	PreparedStatement stmt1 = conn.prepareStatement("insert into users(name,email,password) values(?,?,?)");  
		        stmt1.setString(1,name);
		        stmt1.setString(2,email);
		        stmt1.setString(3,pass);
		        stmt1.executeUpdate();
		        request.setAttribute("errorMessage","Successfully Registered");
	        }
	        else
	        {
	        	request.setAttribute("errorMessage","Already Registered");
	        }
	        RequestDispatcher rs1 = request.getRequestDispatcher("index.jsp");
        	rs1.include(request, response);
	     }
	     catch(Exception e)
	     {
	         e.printStackTrace();
	     }
	}
}
