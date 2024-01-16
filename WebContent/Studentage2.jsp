<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<% String a = request.getParameter("username");
 %>
    
    <!DOCTYPE html>
<html>
<head>
 <title>home student.html</title>
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
</head>   
<style>
    body{
	margin:0;
	font:600 16px/18px 'Open Sans',sans-serif;
}
.bb
    {
      margin-left: 2%;
    margin-right: 2%;
    margin-top: 5%;  
        
    }
 /* css untuk table */
   
table {
  border-collapse: collapse;
  width: 80%;
     margin-left: 5%;
    margin-right: 100%;
    margin-top: 5%;
}

th, td {
  text-align: left;
  padding: 8px;
}
tr
    {background-color: #f2f2f2}
th {
  background-color: rgba(40,57,101,.9);
  color: white;
}
    /*tutup */
</style> 
<body style="background-color:#CBCCBB">;
    <form>
    
	<div class="bb">
	<%
                                
                                try {
                            		Class.forName("com.mysql.jdbc.Driver");
                            		Connection con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/parcel", "root", "Sekolah_13");
                            		
                            		Statement stmt = con.createStatement();
                            		
                            		String sql = "SELECT * FROM parcel WHERE  Student_ID =" + a;
                            		ResultSet rs = stmt.executeQuery(sql);
                            		%>
                            		
                            		
	    
	   <h2>Welcome To Online Parcel Finder </h2>
            <div class="line-dec"></div>
            <span>Please be patient - your parcel has not arrived.</span>
        <table>
      
  <tr>
    <th>Parcel_Code</th>
    <th>Name</th>
    <th>Number Phone</th>
      <th>Kolej</th>
      <th>No Tracking</th>
      
  </tr>
  
    <%
                            		
                            		while(rs.next()) { 
                            		
                            	%>
  <tr>
    <td><%=rs.getString("Parcel_Code") %></td>
    <td><%=rs.getString("Name") %></td>
    <td><%=rs.getString("Number_Phone") %></td>
      <td><%=rs.getString("Block") %></td>
      <td><%=rs.getString("Tracking_Number") %></td>
    
  </tr>
  <%
 
                     		}
                            		
                                }
                            	catch (Exception e2)
                                {
                            		System.out.println(e2);
                                }
                                out.close();
                                
                            			  %>
</table></div>
    </form>
</body>
</html>