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


@WebServlet (name ="R2", urlPatterns = {"/KeyIn"})
public class KeyIn extends HttpServlet {
	private static final long serialVersionUID =1L;
public void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
response.setContentType("text/html");
PrintWriter out = response.getWriter();
String a = request.getParameter("parcel");
String n = request.getParameter("Staff_ID");
String p = request.getParameter("Student_ID");
String e = request.getParameter("Name");
String c = request.getParameter("Phone");
String d = request.getParameter("tracking");
String f = request.getParameter("block");

try {
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/parcel", "root", "Sekolah_13");
PreparedStatement ps = con
.prepareStatement("insert into parcel values(?,?,?,?,?,?,?)");
ps.setString(1, a);
ps.setString(2, n);
ps.setString(3, p);
ps.setString(4, e);
ps.setString(5, c);
ps.setString(6, d);
ps.setString(7, f);

PreparedStatement ss = con.prepareStatement("insert into student (Student_ID,Student_Name, Student_Number,Parcel_Code)  values(?,?,?,?)");
ss.setString(1, p);
ss.setString(2, e);
ss.setString(3, c);
ss.setString(4, a);



int t = ss.executeUpdate();
int i = ps.executeUpdate();

if (i > 0 && t > 0)
	response.sendRedirect(request.getContextPath() + "/ParcelPage.jsp");
} catch (Exception e2) {
System.out.println(e2);
}

out.close();
}

}