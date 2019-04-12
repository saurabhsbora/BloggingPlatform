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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 boolean check = false;
		 String oldpass = request.getParameter("oldpass");
	     String newpass = request.getParameter("newpass");
	     HttpSession session=request.getSession(false);
	     int uid = (int)session.getAttribute("id");
	     
	     try
	        {
	           Class.forName("com.mysql.jdbc.Driver"); 
	           Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bloggingplatform","root","");
	           PreparedStatement ps =conn.prepareStatement("select password from users where id=?");
	           ps.setInt(1, uid);
	           ResultSet rs = ps.executeQuery();
	           check = rs.next();
	           if(check)
	           {
	        	   PreparedStatement ps1 =conn.prepareStatement("update users set password = ? where id = '"+uid+"'");
	        	   ps1.setString(1, newpass);
	        	   ps1.executeUpdate();
	        	   request.setAttribute("errorMessage","Password changed successfully");
	           }
	           else
	           {
	        	   request.setAttribute("errorMessage","Old password is wrong");
	           }
	           RequestDispatcher rd = request.getRequestDispatcher("changePassword.jsp");
	           rd.include(request, response);
	         }
	        catch(Exception e)
	        {
	            e.printStackTrace();
	        }
		
	}

}
