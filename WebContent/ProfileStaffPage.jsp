<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Staff</title>
    <!-- for google icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
       
    <!-- Now lets start styling -->
    <style>
        /* css untuk body */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
        }
            .main {
  margin-left: 220px;
}
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}  
        /* css untuk menu tepi */
        
        .side-nav {
            height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
        }
    
        .sidenav a {
  padding: 6px 6px 6px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}
        #close{
            position: relative;
            color: white;
            top: -3%;
            left: 81%;
        }
        #close:hover, #ham:hover{
            color: gray;
            cursor: pointer;
        }
        #ham{
            position: absolute;
            top: 3%;
            left: 3%;
            color: white;
            background-color: #191b1f;
            border-radius: 25px;
            padding: 8px;
            display: none;
        }
        .menu {
            margin-left: 15px;
        }
        ul {
            display: flex;
            flex-direction: column;
            padding: 0;
            margin: 0;
            width: 100%;
        }
        a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            padding: 0 20px;
            border-bottom: 1px solid rgb(97, 94, 94);
        }
        a:hover {
            background-color: rgb(19, 18, 18);
            color: rgb(148, 145, 145);
        }
        li {
            list-style-type: none;
            display: flex;
            align-items: center;
            margin: 15px auto;
        }
        .material-icons-outlined {
            font-size: 30px;
        }
        header {
            font-size: 30px;
            margin: 0;
            padding: 10px;
            border-bottom: 1px solid rgb(97, 94, 94);
            text-align: center;
            color: white;
            user-select: none;
        }
        @media screen and (max-width:600px) {
            .side-nav{
                display: none;
            }
            #ham{
                display: block;
            }
        }
       /* Profile punya css */
        .card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  width: 180px;
  text-align: center;
  background-color: whitesmoke;
  font-family: arial;          
  margin: 10 px;
  padding: 10px;
}
.title {
  color: grey;
  font-size: 18px;
}
button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: rgba(40,57,101,.9);
  text-align: center;
  cursor: pointer;
  width: 80%;
  font-size: 18px;
}
button:hover, a:hover {
  opacity: 0.7;
}
        .column {
  float: left;
  width: 25%;
  padding: 0 10px;
}
/* Remove extra left and right margins, due to padding */
.row {margin: 0 -5px;}
/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}     
    </style>
</head>
<body style="background-color:#CBCCBB">
      <span class="material-icons-outlined" id="ham">
        menu
        </span>
    <div class="side-nav">
        <span class="material-icons-outlined" id="close">
            close
            </span>
        <header>PARCEL</header>
        <ul>
            <a href="ParcelPage.jsp">
                <li><span class=" material-icons-outlined">
                        upload
                    </span> <span class="menu">Key In</span> </li>
            </a>
            <a href="RegisterStaff.jsp" >
                <li><span class="material-icons-outlined">
                    add
                    </span><span class="menu">Register Staff</span></li>
            </a>
            <a href="HistoryPage.jsp" >
                <li><span class="material-icons-outlined">
                        history
                    </span><span class="menu">History</span></li>
            </a>
            <a href="ProfileStaffPage.jsp" class="active">
                <li><span class="material-icons-outlined">
                        account_circle
                    </span><span class="menu">Profile</span></li>
            </a>
            <a href="LoginIndex.jsp" >
                <li><span class="material-icons-outlined">
                        logout
                    </span><span class="menu">Log out</span></li>
            </a>
        </ul>
    </div>
    <!-- lets add some javascript -->
    <script>
        let close_btn = document.querySelector('#close')
        let ham = document.querySelector('#ham')
        let nav = document.querySelector('.side-nav')
        close_btn.addEventListener('click',()=>{
            nav.style.display = "none"
            ham.style.display = "block"
        })
        ham.addEventListener('click',()=>{
            nav.style.display = "block"
            ham.style.display = "none"
        })
    </script>
    <div class="main">
<h2 style="text-align:center">Profile Staff</h2>
        <div class="row">
<%
                                
                                try {
                                	

                            		Blob image = null;
                            		byte[ ] imgData = null ;
                            		
                            		Class.forName("com.mysql.jdbc.Driver");
                            		Connection con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/parcel", "root", "Sekolah_13");
                            		
                            	
                            		Statement stmt = con.createStatement();
                            		
                            		String sql = "SELECT * FROM staff";
                            		ResultSet rs = stmt.executeQuery(sql);
                            		
                            		
                            		while(rs.next()) { 
                            			String id = request.getParameter("Staff_ID");
                           	%>
<div class="column">
<br>
<br>

<div class="card">
<img src="person2.png" alt="John" style="width:70%">
  <h3> <%=rs.getString("Staff_Name") %></h3>
  <p class="title"> <%=rs.getString("Staff_ID") %></p>
  <p>  <%=rs.getString("Staff_Number") %></p>
  <p><a href="EditProfilePage.jsp?edit= <%=rs.getString("Staff_ID") %>"> <button>Edit Profile</button> </a> </p> 
</div></div>  

 <%
                            		}
                                }
                            	catch (Exception e2)
                                {
                            		System.out.println(e2);
                                }
                                out.close();
                                
                            			  %>
 
</div></div>
</body>
</html>