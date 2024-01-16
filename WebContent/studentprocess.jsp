<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String a = request.getParameter("username");

try{

Class.forName("com.mysql.jdbc.Driver"); 
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parcel", "root", "Sekolah_13"); 
out.println ("Display Output\n");
Statement stmt = con.createStatement();

String sql = "SELECT * FROM parcel WHERE Student_ID =" + a;
ResultSet rs = stmt.executeQuery(sql);

	
	        if(rs.next()) 
			{ 
	        	%>
	        	
	        	<%
	        	request.getRequestDispatcher("StudentPage.jsp").forward(request, response);
			  
			} 
		else{
			request.getRequestDispatcher("Studentage2.jsp").forward(request, response);
			
		    }
}
catch (Exception e) {
e.printStackTrace();
}
%>