<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%


String a = request.getParameter("Name");
String b = request.getParameter("Phone");
String c = request.getParameter("Student_ID");
String d = request.getParameter("pass");



try {
	
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/parcel", "root", "Sekolah_13");

PreparedStatement ps = con
.prepareStatement("UPDATE staff SET Staff_Name=? , Staff_Number=?, Staff_ID=? , Staff_Password=? WHERE Staff_ID =" + c);

ps.setString(1, a);
ps.setString(2, b);
ps.setString(3, c);
ps.setString(4, d);






int z = ps.executeUpdate();


if (z > 0 )
	request.getRequestDispatcher("ProfileStaffPage.jsp").forward(request, response);
	
} catch (Exception e2) {
System.out.println(e2);
}

%>