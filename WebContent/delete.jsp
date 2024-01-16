<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String Parcel_Code=request.getParameter("delete");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
	"jdbc:mysql://localhost:3306/parcel", "root", "Sekolah_13");
Statement st=con.createStatement();
int i=st.executeUpdate("DELETE FROM parcel WHERE Parcel_Code="+Parcel_Code);
response.sendRedirect(request.getContextPath() + "/ParcelPage.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>