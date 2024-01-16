<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String userid=request.getParameter("username"); 
String password=request.getParameter("pass"); 

try{

Class.forName("com.mysql.jdbc.Driver"); 
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parcel", "root", "Sekolah_13"); 
PreparedStatement pst = con.prepareStatement("select Staff_ID,Staff_Password from staff where Staff_ID =? and Staff_Password =?"); 
	pst.setString(1, userid);
	pst.setString(2, password);
	
	ResultSet rs =pst.executeQuery(); 
	
	        if(rs.next()) 
			{ 
			      out.println("Welcome "+ userid); 
			      response.sendRedirect(request.getContextPath() + "/ParcelPage.jsp");
			} 
		else{
			 out.println("Invalid password or username.");
			 response.sendRedirect(request.getContextPath() + "/LoginIndex.jsp");
		    }
}
catch (Exception e) {
e.printStackTrace();
}
%>