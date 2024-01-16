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

@WebServlet (name ="R4", urlPatterns = {"/PickUp"})
public class PickUp extends HttpServlet{

	private static final long serialVersionUID =1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();
	
	String Parcel_Code = request.getParameter("Parcel_Code");
	String b = request.getParameter("Staff_ID");
	String c = request.getParameter("Student_ID");
	String d = request.getParameter("Name");
	String f = request.getParameter("Phone");
	String g = request.getParameter("Receiver_ID");
	String h = request.getParameter("Receiver_Phone");
	String i = request.getParameter("Date");


	try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
	"jdbc:mysql://localhost:3306/parcel", "root", "Sekolah_13");
	PreparedStatement ps = con
	.prepareStatement("insert into history values(?,?,?,?,?,?,?,?)");
	ps.setString(1, Parcel_Code);
	ps.setString(2, b);
	ps.setString(3, c);
	ps.setString(4, d);
	ps.setString(5, f);
	ps.setString(6, g);
	ps.setString(7, h);
	ps.setString(8, i);
	

	PreparedStatement ss = con.prepareStatement("DELETE FROM parcel WHERE Parcel_Code=" + Parcel_Code);
	PreparedStatement sd = con.prepareStatement("DELETE FROM student WHERE Parcel_Code=" + Parcel_Code);
	System.out.println("Data Deleted Successfully!");


	int t = ss.executeUpdate();
	int z = ps.executeUpdate();
	int y = sd.executeUpdate();

	response.sendRedirect(request.getContextPath() + "/HistoryPage.jsp");
	if (z > 0 && t > 0 && y >0)
		response.sendRedirect(request.getContextPath() + "/HistoryPage.jsp");
	} catch (Exception e2) {
	System.out.println(e2);
	}

	out.close();
	}

	
}
