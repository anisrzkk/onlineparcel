<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String Staff_ID=request.getParameter("delete");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
	"jdbc:mysql://localhost:3306/parcel", "root", "Sekolah_13");
Statement st=con.createStatement();
int i=st.executeUpdate("DELETE FROM staff WHERE Staff_ID="+ Staff_ID);
response.sendRedirect(request.getContextPath() + "/ProfileStaffPage.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>