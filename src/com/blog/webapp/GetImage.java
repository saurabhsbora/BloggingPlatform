package com.blog.webapp;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/GetImage")
public class GetImage extends HttpServlet 
{  
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int img_id = Integer.parseInt(request.getParameter("post_id"));
    	OutputStream oImage;
    	try
        {
           Class.forName("com.mysql.jdbc.Driver"); 
           Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bloggingplatform","root","");
           PreparedStatement ps =conn.prepareStatement("select * from posts where post_id=?");
           ps.setInt(1, img_id);
           ResultSet rs = ps.executeQuery();
           if(rs.next()) {
               Blob blob = rs.getBlob("image");
        	   byte barray[] = blob.getBytes(1, (int) blob.length());
               response.setContentType("image/gif");
               oImage=response.getOutputStream();
               oImage.write(barray);
               oImage.flush();
               oImage.close();
           }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }                 
    }
}
