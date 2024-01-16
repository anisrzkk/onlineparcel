package OPF;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
//import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet (name = "R2" , urlPatterns = {"/DisplayServlet" })
public class ParcelDisplay  extends HttpServlet {
	private static final long serialVersionUID =1L;
	

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/parcel", "root", "Sekolah_13");
		
		out.println ("Display Output\n");
		Statement stmt = con.createStatement();
		
		String sql = "SELECT * FROM parcel";
		ResultSet rs = stmt.executeQuery(sql);
		
		out.println("<table border=1 width =50% height=50%");
		out.println("<tr><th>Name</th><th>Password </th> <th>Email</th> <th> Language</th><tr>");
		
		while(rs.next()) {
			String name = rs.getString("Parcel_Code");
			String pwd = rs.getString("Staff_ID");
			String email = rs.getString("");
			String language= rs.getString("LANGUAGE");
			
			out.println("<tr><td>" +name+"</td><td>"+pwd+"</td><td>"+ email+"</td><td>"+language+"</td><td>" );
		}
		out.println("</table>");
		out.println("</html></body>");
		
		}
	catch (Exception e2) {
		System.out.println(e2);
	}
	out.close();
	}

	}
