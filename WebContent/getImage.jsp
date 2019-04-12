<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Blob"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.io.*"%> 
<% 
int img_id = Integer.parseInt(request.getParameter("post_id"));
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
       OutputStream oImage=response.getOutputStream();
       oImage.write(barray);
       oImage.flush();
       oImage.close();
   }
}
catch(Exception e)
{
    e.printStackTrace();
}          
%>