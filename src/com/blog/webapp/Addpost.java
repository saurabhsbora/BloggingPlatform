package com.blog.webapp;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Addpost
 */
@WebServlet("/Addpost")
@MultipartConfig
public class Addpost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addpost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int user_id = 1;
		if(request.getSession(false).getAttribute("id") != null)
			user_id = (int) request.getSession(false).getAttribute("id");
	
	     String title = request.getParameter("title");
		 String authorname = request.getParameter("authorname");
	     String content = request.getParameter("content");
	     String category = request.getParameter("category");
	     Part image = request.getPart("image");
	     InputStream inputStream = image.getInputStream();
		
		try
        {
           Class.forName("com.mysql.jdbc.Driver"); 
           Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bloggingplatform","root","");
           PreparedStatement ps =conn.prepareStatement("insert into posts(title,image,content,authorname,category,user_id) values(?,?,?,?,?,?)");
           ps.setString(1,title);
	       ps.setBlob(2,inputStream);
	       ps.setString(3,content);
	       ps.setString(4,authorname);
	       ps.setString(5,category);
	       ps.setInt(6,user_id);
	       ps.executeUpdate();
           RequestDispatcher rs1 = request.getRequestDispatcher("index.jsp");
       	   rs1.include(request, response);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
	}
}
