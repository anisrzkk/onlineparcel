package OPF;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet (name ="R5", urlPatterns = {"/UpdateStaff"})
public class UpdateStaff extends HttpServlet{

	private static final long serialVersionUID =1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();
	
	
	
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

	out.close();
	}

	
}
