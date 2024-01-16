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



@WebServlet (name ="R1", urlPatterns = {"/RegisterStaff"})
public class RegisterStaff extends HttpServlet {
	private static final long serialVersionUID =1L;
public void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
response.setContentType("text/html");
PrintWriter out = response.getWriter();
String a = request.getParameter("staff_id");
String n = request.getParameter("Name");
String p = request.getParameter("Contact Number");
String e = request.getParameter("Password");



try {
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/parcel", "root", "Sekolah_13");
PreparedStatement ps = con
.prepareStatement("insert into staff (Staff_ID,Staff_Name,Staff_Number,Staff_Password) values(?,?,?,?)");

ps.setString(1, a);
ps.setString(2, n);
ps.setString(3, p);
ps.setString(4, e);


int i = ps.executeUpdate();
if (i > 0)
out.print("You are successfully registered...");
response.sendRedirect(request.getContextPath() + "/ProfileStaffPage.jsp");
} catch (Exception e2) {
System.out.println(e2);
}
out.close();
}
}