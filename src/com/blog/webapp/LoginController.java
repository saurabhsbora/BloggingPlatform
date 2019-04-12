package com.blog.webapp;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet 
{
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        
        if(checkUser(email, pass))
        {
        	HttpSession session = request.getSession(true);
        	session.setAttribute("user", email);
        	session.setAttribute("name", getName(email));
        	session.setAttribute("id", getID(email));
        	RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
            rs.forward(request, response);
        }
        else
        {
        	request.setAttribute("errorMessage","Username or Password incorrect");
        	RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
        	rs.include(request, response);
        }
    }
    public boolean checkUser(String email,String pass) 
    {
     boolean st = false;
     try
     {
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bloggingplatform","root","");
        PreparedStatement ps =conn.prepareStatement("select * from users where email=? and password=?");
        ps.setString(1, email);
        ps.setString(2, pass);
        ResultSet rs = ps.executeQuery();
        st = rs.next();
     }
     catch(Exception e)
     {
         e.printStackTrace();
     }
        return st;                 
    }
    public String getName(String email)
    {
    	String name = null;
    	try
        {
           Class.forName("com.mysql.jdbc.Driver"); 
           Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bloggingplatform","root","");
           PreparedStatement ps =conn.prepareStatement("select name from users where email=?");
           ps.setString(1, email);
           ResultSet rs = ps.executeQuery();
           while (rs.next()) {
        	   name = rs.getString("name");
           }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    	return name;
    }
    public int getID(String email)
    {
    	int id = 0;
    	try
        {
           Class.forName("com.mysql.jdbc.Driver"); 
           Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bloggingplatform","root","");
           PreparedStatement ps =conn.prepareStatement("select id from users where email=?");
           ps.setString(1, email);
           ResultSet rs = ps.executeQuery();
           while (rs.next()) {
        	   id = rs.getInt("id");
           }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    	return id;
    }
}
